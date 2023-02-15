// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:mobile_pcc/screens/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    gologin();
    super.initState();
  }

  gologin() async {
    await Future.delayed(const Duration(milliseconds: 6000), () {});

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            const LoginPage(title: 'Login Wells Fargo'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/render.gif',
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}
