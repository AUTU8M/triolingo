import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:triolingo/features/auth/view/widgets/outlinedtypa_button.dart';
import 'package:triolingo/features/auth/view/widgets/phone_no_widget.dart';
import 'package:triolingo/features/auth/view/widgets/sign_in_widget.dart';
import 'package:triolingo/login_page.dart';
import 'package:triolingo/features/auth/view/pages/email_signin_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    super.dispose();
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              PhoneNoWidget(
                phoneController: phoneController,
                otpController: otpController,
              ),
              SizedBox(height: 20),
              SignInWidget(),
              SizedBox(height: 20),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              Expanded(
                child: Container(),
              ), // This pushes the rest to the bottom
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmailSignInPage(),
                    ),
                  );
                },
                buttonIcon: Icon(Icons.mail),
              ),
              SizedBox(height: 10),
              Text(
                'By signing in to Duolingo, you agree to our Terms and privacy policy',
                style: TextStyle(
                  fontSize: 11,
                  color: Color.fromARGB(204, 167, 164, 164),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
