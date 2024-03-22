import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

class Guide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      margin: EdgeInsetsDirectional.all(20.0),
      child: Column(
        children: [
          /*
          Text(
            '예식 안내사항',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, height: 1, color: Color.fromRGBO(41, 82, 56, 100))
          ),
          Text(
            '식사 안내',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3)
          ),
          Text(
            '식사는 예식 30분 전인 11시 30분부터 가능합니다. (6층 연회장)',
            style: TextStyle(height: 2,)
          ),
          Text(
            '식사는 뷔페식이며, 양쪽의 메뉴가 다르게 구성되어 있습니다.',
            style: TextStyle(height: 2,)
          ),
          */
          Container (
            height: 240.0,
            child: Image.asset(
              'assets/images/guide.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      )
    );
  }
}

