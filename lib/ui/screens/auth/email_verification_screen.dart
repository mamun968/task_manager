import 'package:flutter/material.dart';
import 'package:task_manager_api/ui/screens/widgets/screen_background.dart';

import 'otp_verification_screen.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(64),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 64,
            ),
            Text(
              'Your email address',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Text("A 6 digit code has been sent to your email address.",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey)),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email",
                )),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const OtpVerificationScreen(email: '',)));
                  },
                  child: const Icon(Icons.arrow_forward_ios)),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Have an account?",
                  style: TextStyle(
                      fontWeight: FontWeight.w500, letterSpacing: 0.5)),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Sign In"))
            ])
          ]),
        ),
      )),
    );
  }
}
