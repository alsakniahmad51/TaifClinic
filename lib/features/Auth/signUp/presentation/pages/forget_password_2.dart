import 'package:clinic/features/Auth/logIn/presentaion/widgets/gmail_logo.dart';
import 'package:clinic/features/Auth/signUp/presentation/widgets/helper_text.dart';
import 'package:clinic/features/Auth/logIn/presentaion/widgets/open_gmail.dart';
import 'package:clinic/features/Auth/signUp/presentation/widgets/skip_to_later.dart';
import 'package:flutter/material.dart';

class ForgetPassword2 extends StatelessWidget {
  const ForgetPassword2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [GmailLogo(), HelperText(), OpenGmail(), SkipToLater()],
      ),
    );
  }
}
