import "dart:math";
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:wedding_invitation/widgets/welcome.dart';
import 'package:wedding_invitation/widgets/invitation.dart';
import 'package:wedding_invitation/widgets/gallery.dart';
import 'package:wedding_invitation/widgets/map.dart';
import 'package:wedding_invitation/widgets/guide.dart';
import 'package:wedding_invitation/widgets/bank_account.dart';
import 'package:wedding_invitation/widgets/developed_by.dart';
import 'section_title.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

Path createBearPath(Size size) {
  // final path = Path();

  // // 🟤 얼굴 (중간 큰 원)
  // path.addOval(Rect.fromCircle(center: Offset(0, 0), radius: 10));
  // // 🟤 왼쪽 귀
  // path.addOval(Rect.fromCircle(center: Offset(-8, -10), radius: 4));
  // // 🟤 오른쪽 귀
  // path.addOval(Rect.fromCircle(center: Offset(8, -10), radius: 4));

  // return path;

  final s = min(size.width, size.height); // 기준 스케일
  final path = Path();

  // 얼굴 타원 (가로가 더 긴 비율)
  final faceW = 0.80 * s;   // 얼굴 가로폭
  final faceH = 0.62 * s;   // 얼굴 세로폭 (가로 대비 약 0.78배)
  path.addOval(Rect.fromCenter(
    center: const Offset(0, 0),
    width: faceW,
    height: faceH,
  ));

  // 귀 타원 (살짝 납작, 작고 둥글게)
  final earW = 0.32 * s;
  final earH = 0.28 * s;

  // 귀 위치 (얼굴 위쪽 + 바깥쪽)
  final earDx = 0.36 * s;   // 좌우 이동
  final earUp = 0.34 * s;   // 위로 이동(음수 y)

  // 왼쪽 귀
  path.addOval(Rect.fromCenter(
    center: Offset(-earDx, -earUp),
    width: earW,
    height: earH,
  ));

  // 오른쪽 귀
  path.addOval(Rect.fromCenter(
    center: Offset( earDx, -earUp),
    width: earW,
    height: earH,
  ));

  return path;
}


class _MyHomePageState extends State<MyHomePage> {
  final controller = ConfettiController();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack (
    alignment: Alignment.topCenter,
    children: [
      Scaffold (
        body: SingleChildScrollView (
          child: Column (
            children: [
              Welcome(),
              const SectionTitle(text: '소중하고 감사한 당신을 초대합니다.', spacingTop: 60.0,),
              Invitation(),
              const SectionTitle(text: '갤러리', spacingTop: 60.0,),
              Gallery(),
              const SectionTitle(text: '오시는 길', spacingTop: 60.0,),
              Map(),
              const SectionTitle(text: '예식 안내사항', spacingTop: 60.0,),
              Guide(),
              const SectionTitle(text: '마음 전하는 곳', spacingTop: 60.0,),
              BankAccount(),
              const SizedBox(height: 60),
              DevelopedBy(),
            ],
          ),
        ),
      ),
      
      ConfettiWidget(
        confettiController: controller,
        shouldLoop: false,

        blastDirectionality: BlastDirectionality.explosive,
        emissionFrequency: 0.05,
        numberOfParticles: 1,
        gravity: 0.1,

        createParticlePath: createBearPath,
      )
      
    ],
  );
}