import 'package:flutter/material.dart';
import '../widgets/sign_in_view_boody.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: SignInViewBody(),
    );
  }
}
