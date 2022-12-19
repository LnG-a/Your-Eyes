import 'package:flutter/material.dart';

final shape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10),
);

const int _primaryValue = 0xff7f3dff;
const mainColor = Color(0xff7f3dff);

const MaterialColor primaryViolet = MaterialColor(
  _primaryValue,
  <int, Color>{
    50: Color(0xff7f3dff),
    100: Color(0xff7f3dff),
    200: Color(0xff7f3dff),
    300: Color(0xff7f3dff),
    400: Color(0xff7f3dff),
    500: Color(0xff7f3dff),
    600: Color(0xff7f3dff),
    700: Color(0xff7f3dff),
    800: Color(0xff7f3dff),
    900: Color(0xff7f3dff),
  },
);

const Size medium = Size(370, 56);
const Size large = Size(380, 65);
const Size half = Size(180, 65);
const bool colorType1 = true;
const bool colorType2 = false;

Widget buildButton(
  String text,
  Size size,
  bool colorType,
  VoidCallback onPressed,
) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorType ? mainColor : Colors.grey.shade300,
      minimumSize: size,
      shape: shape,
    ),
    onPressed: () => onPressed(),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: colorType ? Colors.white : mainColor,
      ),
    ),
  );
}
