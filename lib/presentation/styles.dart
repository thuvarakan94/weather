import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const detailsBgDecoration = BoxDecoration(
  color: Colors.transparent,
  gradient: LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    colors: [
      Color.fromARGB(137, 8, 233, 253),
      Color.fromARGB(115, 1, 61, 125),
    ],
    stops: [0.0, 0.5],
  ),
);

final detailsBgDecorationWithGradient = BoxDecoration(
  color: Colors.white,
  gradient: LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    colors: [
      const Color.fromARGB(137, 0, 49, 75).withOpacity(0.0),
      const Color.fromARGB(115, 70, 188, 235),
    ],
    stops: const [0.0, 0.5],
  ),
);

final backButtonDecoration = BoxDecoration(
  color: const Color(0xffe0e0e0),
  boxShadow: backBtnBoxShadow,
  borderRadius: const BorderRadius.all(
    Radius.circular(10),
  ),
);

const outlineInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.all(Radius.circular(30.0)));

const hintTextStyle = TextStyle(
    color: Colors.white54,
    fontWeight: FontWeight.w100,
    fontStyle: FontStyle.italic);

const nightColor = Color(0xff262431);
const dayColor = Color(0xffFDAE1C);
const dayShadowColor = Color(0xff200003);
const nightBackgroundColor = Color(0xff14141C);

TextStyle bigTitleStyle =
    GoogleFonts.raleway(fontSize: 48, color: Colors.white);

List<BoxShadow> backBtnBoxShadow = [
  BoxShadow(
    color: const Color(0xffc3c3c3).withOpacity(0.4),
    spreadRadius: 15,
    blurRadius: 30,
    offset: const Offset(-20, 20), // changes position of shadow
  ),
  const BoxShadow(
    color: nightBackgroundColor,
    spreadRadius: 15,
    blurRadius: 30,
    offset: Offset(20, -20), // changes position of shadow
  )
];

TextStyle weatherDetailsTextStyle =
    GoogleFonts.raleway(fontSize: 24, color: Colors.black);

const inputDecoration = InputDecoration(
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: outlineInputBorder,
  hintText: "Enter the city name",
  hintStyle: hintTextStyle,
);
