import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../../config/route.dart';

class SuccessOrderScreen extends StatelessWidget {
  const SuccessOrderScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                    width: 254.w,
                    child: Text(
                      'Yeay! Your order is on the way',
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  SvgPicture.asset(
                    'assets/img/illu2.svg',
                    width: 1.sw - 16.w,
                  ),
                  const Spacer(
                    flex: 2,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                              RouteGenerator.main, (route) => false),
                      child: Text(
                        'Back to home',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Config.colors.kTextGrey1,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          const StadiumBorder(),
                        ),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed(RouteGenerator.main),
                      child: const Text('Track your order'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
