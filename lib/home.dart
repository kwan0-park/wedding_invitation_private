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

        createParticlePath: (size) {
          final path = Path();
          path.addRect(Rect.fromPoints(Offset(-5, -5), Offset(10, 1)));
          //path.addOval(Rect.fromCircle(center: Offset.zero, radius: 5));
          return path;
        },
      )
      
    ],
  );
}