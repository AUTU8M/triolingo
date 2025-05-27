import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:triolingo/features/auth/view/widgets/outlinedtypa_button.dart';
import 'package:triolingo/login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromARGB(255, 114, 114, 114),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed:
              () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              ),
        ),
        centerTitle: true,
        title: Text(
          'Enter your details',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            OutlinedtypaButton(
              text: 'SIGN IN WITH GOOGLE',
              onPressed: () {},
              buttonIcon: Icon(FontAwesomeIcons.google),
            ),
            SizedBox(height: 10),
            OutlinedtypaButton(
              text: 'SIGN IN WITH FACEBOOK',
              onPressed: () {},
              buttonIcon: Icon(FontAwesomeIcons.facebook),
            ),
            SizedBox(height: 10),
            OutlinedtypaButton(
              text: 'SIGN IN WITH EMAIL',
              onPressed: () {},
              buttonIcon: Icon(Icons.mail),
            ),
            SizedBox(height: 10),

            Text(
              'By signing in to Duolingo, you agree to our Terms and privacy policy',
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(204, 102, 100, 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
