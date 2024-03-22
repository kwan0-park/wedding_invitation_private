import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  final API_KEY = "AIzaSyBA0lA83HAYq0dIAIncAznqQgW7RWR0nNY";

  Widget getMap() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory('iframe', (int viewId) {
      var iframe = html.IFrameElement();
      iframe.src = 'https://www.google.com/maps/embed/v1/place?key=$API_KEY&q=수원노블레스웨딩컨벤션';
      iframe.style.border = 'none';
      return iframe;
    });

    return const HtmlElementView(viewType: 'iframe');
  }

  @override
  Widget build(BuildContext context) {
  return Center(
    child: Container(
      margin: EdgeInsetsDirectional.all(20.0),
      child: Column(
        children: [
          /*
          Text(
            '오시는 길',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, height: 1, color: Color.fromRGBO(41, 82, 56, 100))
          ),
          Text(
            '수원 노블레스 웨딩 컨벤션',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3)
          ),
          Text('경기도 수원시 팔달구 팔달문로 128',),
          */
          Container (
            height: 150.0,
            child: Image.asset(
              'assets/images/express.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 30),

          Container (
            height: 110.0,
            child: Image.asset(
              'assets/images/place_info.png',
              fit: BoxFit.fitWidth,
            ),
          ),

          const SizedBox(height: 20),
          Container(
            width: 500,
            height: 300,
            child: getMap(),
          ),
          const SizedBox(height: 10,),

          /*
          Text(
            '지하철',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3)
          ),
          Text(
            '수인분당선 수원시청역 5번 출구 셔틀버스 수시 운행',
          ),

          Text(
            '버스',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3)
          ),
          Text(
            '수원역(4번 출구) → 동수원병원 하차 (13-4, 83-1, 720-2)',
            style: TextStyle(height: 2,)
          ),
          Text(
            '수원버스터미널 → 수병원 하차 (300)',
            style: TextStyle(height: 2,)
          ),
          Text(
            '망포역(4번 출구) → 동수원사거리 하차 (62-1)',
            style: TextStyle(height: 2,)
          ),
          Text(
            '광교중앙역(3번 출구) → 동수원사거리 하차 (13-4)',
            style: TextStyle(height: 2,)
          ),
          Text(
            '강남역(나라빌딩앞) → 수원월드컵경기장 하차 (3007)',
            style: TextStyle(height: 2,)
          ),

            Text(
              '주차',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, height: 3)
            ),
            Text(
              '예식장 주차타워 내 1시간 30분 무료 주차가 가능합니다.',
              style: TextStyle(height: 2,)
            ),
            Text(
              '골목에 위치하여 혼잡할 수 있는점 너그러이 양해 부탁드립니다.',
              style: TextStyle(height: 2,)
            )
            */
            Container (
              height: 310.0,
              child: Image.asset(
                'assets/images/place_info_3.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

