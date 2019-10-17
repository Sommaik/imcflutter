import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class AppIntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Slide> slides = new List();
    slides.add(Slide(
      title: "ERASER",
      description:
          "Allow miles wound place the leave had. To sitting subject no improve studied limited",
      // pathImage: "images/photo_eraser.png",
      backgroundColor: Color(0xfff5a623),
    ));
    return IntroSlider(
      slides: slides,
      onDonePress: () {
        Navigator.of(context).pushReplacementNamed('/login');
      },
    );
  }
}
