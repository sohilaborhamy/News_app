import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';

import '../../core/constants/assets_app.dart';
import '../../core/routes/name_routes_screen.dart';












class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
 void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3),
      () {
      
        Navigator.pushReplacementNamed(context,
       ScreenRouteName.homeView);
      },
 );
 }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      //backgroundColor: ColorsApp.primaryColorLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            ZoomIn(
              duration: const Duration(seconds: 1),
              child: Image.asset(
                AssetsApp.logoSplash,
                width: 150,
                height: size.size.height * 0.4,
              ),
            ),
            const Spacer(),
            SlideInUp(
              duration: const Duration(seconds: 1),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  AssetsApp.brandingSplash,
                  width: 214,
                  height: 86,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
