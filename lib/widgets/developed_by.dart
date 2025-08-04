import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:kakao_flutter_sdk_navi/kakao_flutter_sdk_navi.dart';

class DevelopedBy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      margin: const EdgeInsetsDirectional.all(20.0),
      child: const Column(
        children: [
          SizedBox(height: 60.0),
          Text(
            '© 2025 박관영. Developed with Flutter',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
