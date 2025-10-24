import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify email')),
      body: Column(
        children: [
          TextHighlight(
            text:
                'We\'ve sent you an email verification. Please open it to verify your account',
            words: {
              'verify your account': HighlightedWord(
                textStyle: TextStyle(backgroundColor: Colors.yellow),
              ),
            },
            textStyle: TextStyle(fontSize: 16.0),
          ),
          const Text(
            'If you haven\'nt a verification email yet, press the button below',
          ),
          Icon(PhosphorIcons.airplane()),
          TextButton(
            onPressed: () async {
              AuthService.firebase().sentEmailVerification;
              print('email sent');
            },
            child: const Text('Send email verification'),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil(registerRoute, (route) => false);
            },
            child: Text('Restart'),
          ),
        ],
      ),
    );
  }
}
