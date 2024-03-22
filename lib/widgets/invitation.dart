import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:url_launcher/url_launcher.dart';

final Color indiBlueColor = Color.fromRGBO(102, 142, 170, 1.0);
final Color indiPinkColor = Color.fromRGBO(206, 131, 131, 1.0);

Widget _buildName(String father, mother, relation, name) {
  return Center (
    child: Row (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$father · $mother', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(' 의 $relation ', style: TextStyle(fontSize: 13)),
        Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    )
  );
}

void _launchPhoneCall(String phoneNumber) async {
  final uri = Uri.parse('tel:$phoneNumber');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw '전화를 걸 수 없습니다: $uri';
  }
}

void _sendSms(String phoneNumber) async {
  final uri = Uri.parse('sms:$phoneNumber');
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw '문자를 보낼 수 없습니다: $uri';
  }
}

Widget _buildContactInfo(String who, name, number, Color color) {
  return Row (
    children: [
      Expanded(
        flex: 2,
        child: Align(
          alignment: Alignment.center,
          child: Text('$who', style: TextStyle(color: color)),
        ),
      ),
      Expanded(
        flex: 2,
        child: Align(
          alignment: Alignment.center,
          child: Text('$name', style: TextStyle(color: Colors.grey)),
        ),
      ),
      Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () { _launchPhoneCall(number); },
            child: Icon(Icons.phone, color: color, size: 24.0),
          )
        ),
      ),
      Expanded(
        flex: 1,
        child: Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () { _sendSms(number); },
            child: Icon(Icons.email, color: color, size: 24.0),
          )
        ),
      ),
    ],
  );
}

Widget _buildPopUpContent() {
  return Container(
    width: 500.0,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildContactInfo('신랑', '유균호', '010-8754-9911', indiBlueColor),
        const SizedBox(height: 1),
        _buildContactInfo('신랑 아버지', '유병수', '010-3679-2570', indiBlueColor),
        const SizedBox(height: 1),
        _buildContactInfo('신랑 어머니', '나윤옥', '010-8648-6008', indiBlueColor),

        const SizedBox(height: 10),
        Divider(thickness: 1, height: 1,),
        const SizedBox(height: 10),

        _buildContactInfo('신부', '심하영', '010-2837-2059', indiPinkColor),
        const SizedBox(height: 1),
        _buildContactInfo('신부 아버지', '심영석', '010-2837-0600', indiPinkColor),
        const SizedBox(height: 1),
        _buildContactInfo('신부 어머니', '류지현', '010-2808-2083', indiPinkColor),
      ],
    ),
  );
}


Widget _buildContactButton(BuildContext context) {
  return OutlinedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              /*child: Text('연락하기', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))*/),
            content: _buildPopUpContent(),
          );
        },
      );
    },
    child: Text(
      '                 📞 연락하기                  ',
      style: TextStyle(color: Color.fromRGBO(41, 82, 56, 100), fontWeight: FontWeight.w600)
    ),
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: EdgeInsets.all(16.0),
      backgroundColor: const Color(0xFFFFFFFF),
      side: BorderSide(width: 0.5, color: Color.fromRGBO(41, 82, 56, 100))
    ),
  );
}

class Invitation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container (
      width: 500.0,
      margin: const EdgeInsetsDirectional.all(20.0),
      child: Column (
        children: [
          Container (
            height: 150,
            width: 500.0,
            child: Image.asset('assets/images/wizard.png', fit: BoxFit.contain,),
          ),
          
          const SizedBox(height: 40),
          /*
          const AutoSizeText(
            '소중하고 감사한 당신을 초대합니다.',
            style: TextStyle(
              color: Color.fromRGBO(41, 82, 56, 100),
              fontSize: 18,
              fontWeight: FontWeight.w600)
          ),

          const SizedBox(height: 40),
          const AutoSizeText(
            '연인으로서 맞이한 열 번의 봄날을 뒤로 하고,\n이제는 부부로서의 첫 번째 봄을 맞이하고자 합니다.\n둘이서 만들어갈 나날의 첫 시작을 함께 밝혀주시면\n더없는 기쁨으로 간직하겠습니다.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              height: 2,
              fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 50),
          _buildName('유병수', '나윤옥', '장남', '유균호'),
          const SizedBox(height: 10),
          _buildName('심영석', '류지현', '장녀', '심하영'),
          const SizedBox(height: 50),
          */
          Container (
            height: 350.0,
            child: Image.asset(
              'assets/images/invitation.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(height: 40),
          _buildContactButton(context),
        ],
      )
    );
  }
}