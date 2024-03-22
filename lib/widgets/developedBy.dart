import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

class DevelopedBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      margin: EdgeInsetsDirectional.all(20.0),
      child: Column(
        children: [
          Container (
            height: 50.0,
            child: Image.asset(
              'assets/images/developed_by.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
