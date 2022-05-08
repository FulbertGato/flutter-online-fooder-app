import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/route.dart';

class RegisterSuccessfulScreen extends StatelessWidget {
  const RegisterSuccessfulScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              'Yeay! Ready to eat',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Text(
              'everything?',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  'assets/img/illu3.svg',
                  width: 350.w,
                ),
              ],
            ),
            Spacer(
              flex: 3,
            ),
            SizedBox(
              width: 196.w,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(RouteGenerator.main),
                style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
                      minimumSize: MaterialStateProperty.all(
                        Size(
                          0,
                          56.h,
                        ),
                      ),
                      shape: MaterialStateProperty.all(
                        const StadiumBorder(),
                      ),
                    ),
                child: Text('Find food near you'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
