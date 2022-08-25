import 'package:cartoon_app/character/screens/character_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _navigateRoute() async {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, CharacterScreen.routeName);
    });
  }

  @override
  void initState() {
    super.initState();
    _navigateRoute();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFff7143),
      body: Center(
        child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image(image: AssetImage('assets/images/k.png'))),
      ),
    );
  }
  @override
  void dispose() {
 
    super.dispose();
    _navigateRoute();
  }
}
