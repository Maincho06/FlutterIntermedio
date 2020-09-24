import 'package:disenos/src/pages/theme/theme.dart';
import 'package:disenos/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(child: MiSlideshow()),
        Expanded(child: MiSlideshow()),
      ],
    ));
  }
}

class MiSlideshow extends StatelessWidget {
  const MiSlideshow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;
    return Slideshow(
      bulletPrimario: 25,
      bulletSecundario: 12,
      // puntosArriba: true,
      colorPrimario: appTheme.darkTheme ? accentColor : Color(0xffFF5A7E),
      // colorSecundario: Colors.purpleAccent,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
      ],
    );
  }
}
