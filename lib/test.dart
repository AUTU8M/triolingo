import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:triolingo/features/auth/view/widgets/outlinedtypa_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  int currentStep = 0;
  final int totalSteps = 4;
  bool passwordVisible = false;

  Widget getStepContent() {
    switch (currentStep) {
      case 0:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How old are you?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is your name?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: surnameController,
              decoration: const InputDecoration(
                labelText: 'Surname',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your email',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create a password',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: passwordController,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: LinearPercentIndicator(
          lineHeight: 14.0,
          percent: (currentStep + 1) / totalSteps,
          progressColor: const Color.fromRGBO(147, 211, 51, 1),
          backgroundColor: Colors.white24,
          barRadius: const Radius.circular(10),
          animation: true,
          animateFromLastPercent: true,
          padding: EdgeInsets.zero,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getStepContent(),
            const Spacer(),
            OutlinedtypaButton(
              text:
                  currentStep == totalSteps - 1 ? 'CREATE PROFILE' : 'CONTINUE',
              buttonIcon:
                  currentStep == totalSteps - 1
                      ? const Icon(Icons.check)
                      : const Icon(Icons.arrow_forward),
              onPressed: () {
                bool canContinue = false;
                switch (currentStep) {
                  case 0:
                    canContinue = ageController.text.trim().isNotEmpty;
                    break;
                  case 1:
                    canContinue =
                        nameController.text.trim().isNotEmpty &&
                        surnameController.text.trim().isNotEmpty;
                    break;
                  case 2:
                    canContinue = emailController.text.trim().isNotEmpty;
                    break;
                  case 3:
                    canContinue = passwordController.text.trim().isNotEmpty;
                    break;
                }
                if (canContinue) {
                  if (currentStep < totalSteps - 1) {
                    setState(() => currentStep++);
                  } else {
                    // TODO: Handle signup logic
                  }
                }
              },
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                'By signing in to Duolingo, you agree to our Terms and Privacy Policy.',
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
