import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Hero(
                tag: 'logo',
                child: SvgPicture.asset('assets/svg/Valorant.svg'),
              ),
            ),
            const Spacer(),
            const Text('Create by: Rama Arya')
          ],
        ),
      ),
    );
  }
}
