import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFE6EFFD),
        body: Center(child: NeumorphicButton()),
      ),
    ),
  );
}

class NeumorphicButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: Color(0xFFE6EFFD),
        borderRadius: BorderRadius.circular(64.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(12.0, 12.0),
            color: Color(0xFFA2B4C6).withOpacity(0.3),
            spreadRadius: 3.0,
            blurRadius: 20.0,
          ),
          BoxShadow(
            offset: Offset(-12.0, -12.0),
            color: Colors.white,
            spreadRadius: 3.0,
            blurRadius: 20.0,
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.favorite_border,
          color: Colors.red[400],
          size: 150.0,
        ),
      ),
    );
  }
}
