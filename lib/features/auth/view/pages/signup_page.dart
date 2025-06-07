import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:triolingo/features/onboarding/view/widgets/primary_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  bool isLoading = false;
  String? errorMessage;

  bool isValidEmail(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  Future<void> _signUp() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();
    final surname = surnameController.text.trim();
    final age = int.tryParse(ageController.text.trim());
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user != null) {
        // Insert profile info into 'profiles' table
        final insertResponse = await Supabase.instance.client
            .from('profiles')
            .insert({
              'id': user.id,
              'name': name,
              'surname': surname,
              'age': age,
              'email': email,
            });
        // Fix: insertResponse may be a List or Map, not an object with .error
        // So, just show the dialog on success, otherwise catch error in catch block
        showDialog(
          context: context,
          barrierDismissible: false,
          builder:
              (context) => AlertDialog(
                title: const Text('Account Created'),
                content: const Text(
                  'You have successfully created your account! Please check your email to verify your account.',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop(); // Go back to previous screen
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
        );
      } else {
        // user is null, likely due to email confirmation being required
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Check your email for confirmation link. Complete email verification before logging in.',
            ),
          ),
        );
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget getStepContent() {
    switch (currentStep) {
      case 0:
        final canContinue = ageController.text.trim().isNotEmpty;
        return SizedBox(
          width: double.infinity,
          child: Column(
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
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 24),
              CustomFullWidthButton(
                text: 'CONTINUE',
                onPressed:
                    canContinue
                        ? () {
                          setState(() => currentStep++);
                        }
                        : null,
                bottomPadding: 24,
              ),
            ],
          ),
        );
      case 1:
        final canContinue =
            nameController.text.trim().isNotEmpty &&
            surnameController.text.trim().isNotEmpty;
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
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: surnameController,
              decoration: const InputDecoration(
                labelText: 'Surname',
                border: OutlineInputBorder(),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 24),
            CustomFullWidthButton(
              text: 'CONTINUE',
              onPressed:
                  canContinue
                      ? () {
                        setState(() => currentStep++);
                      }
                      : null,
              bottomPadding: 24,
            ),
          ],
        );
      case 2:
        final email = emailController.text.trim();
        final canContinue = email.isNotEmpty && isValidEmail(email);
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
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              text: 'CONTINUE',
              onPressed:
                  canContinue
                      ? () {
                        setState(() => currentStep++);
                      }
                      : null,
              bottomPadding: 0,
            ),
          ],
        );
      case 3:
        final canContinue = passwordController.text.trim().isNotEmpty;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create a password',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: passwordController,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
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
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 24),
            if (errorMessage != null)
              Text(errorMessage!, style: TextStyle(color: Colors.red)),
            CustomFullWidthButton(
              text: 'CONTINUE',
              onPressed:
                  canContinue
                      ? () {
                        _signUp();
                      }
                      : null,
              bottomPadding: 24,
            ),
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

class CustomFullWidthButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double bottomPadding;
  const CustomFullWidthButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.bottomPadding = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(147, 211, 51, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
