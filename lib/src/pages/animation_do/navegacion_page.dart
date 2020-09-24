import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificacionModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notifications Page'),
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: FaIcon(FontAwesomeIcons.play),
        backgroundColor: Colors.pink,
        onPressed: () {
          final notiModel =
              Provider.of<_NotificacionModel>(context, listen: false);
          int numero = notiModel.numero;
          numero++;
          notiModel.numero = numero;
          if (numero >= 2) {
            final controller = notiModel.bounceController;
            controller.forward(from: 0.0);
          }
        });
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int numero = Provider.of<_NotificacionModel>(context).numero;
    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bone), title: Text('Bones')),
          BottomNavigationBarItem(
              icon: Stack(
                children: <Widget>[
                  FaIcon(FontAwesomeIcons.bell),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: BounceInDown(
                      from: 10,
                      animate: (numero > 0) ? true : false,
                      child: Bounce(
                        from: 10,
                        controller: (controller) =>
                            Provider.of<_NotificacionModel>(context,
                                    listen: false)
                                .bounceController = controller,
                        child: Container(
                          child: Text(
                            '$numero',
                            style: TextStyle(color: Colors.white, fontSize: 7),
                          ),
                          alignment: Alignment.center,
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              color: Colors.redAccent, shape: BoxShape.circle),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              title: Text('Notificacions')),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.dog), title: Text('My Dog')),
        ]);
  }
}

class _NotificacionModel extends ChangeNotifier {
  int _numero = 0;
  AnimationController _bounceController;

  int get numero => this._numero;

  set numero(int value) {
    this._numero = value;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController controller) {
    this._bounceController = controller;
  }
}
