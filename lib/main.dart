import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/app_theme.dart';
import 'config/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context) => MaterialApp(
        title: 'Brazil Burger Dakar',
        theme: AppTheme(context).initTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteGenerator.splash,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
