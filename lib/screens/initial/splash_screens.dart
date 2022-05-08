import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../../config/route.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
          () => Navigator.of(context).pushReplacementNamed(
        RouteGenerator.onboarding,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colors.kPrimary,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0.3.sw,
              child: SvgPicture.asset(
                'assets/img/splashscreenbg.svg',
                width: 1.sw,
              ),
            ),
            Positioned(
              top: 0.3.sw,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/img/appIcon.svg',
                    width: 60.sp,
                  ),
                  Text(
                    'Foodes App',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
