import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/img/bg.png',
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            top: 0.4.sh,
            left: 26.w,
            child: Center(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6.r),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 8),
                          blurRadius: 20.r,
                          color: Config.colors.kTextGrey2,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 28.w,
                          child: Image.asset(
                            'assets/img/profile.png',
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thomas Todkoro',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Send by ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        color: Config.colors.kTextGrey1,
                                      ),
                                ),
                                Text(
                                  'Uber eat',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 40.w,
                        ),
                        SvgPicture.asset(
                          'assets/img/arrow.svg',
                          width: 12.w,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -7.h,
                    child: Center(
                      child: ClipPath(
                        clipper: TriangleClipper(),
                        child: Container(
                          width: 24.w,
                          height: 8.h,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            width: 1.sw,
            bottom: 64.h,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    24.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 20.r,
                      color: Config.colors.kTextGrey2,
                    )
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0.w,
                      vertical: 16.0.h,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'ORDER STATUS',
                            style: TextStyle(
                              color: Config.colors.kTextGrey1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/img/call.svg',
                          width: 32.w,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SvgPicture.asset(
                          'assets/img/chat.svg',
                          width: 32.w,
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Config.colors.kTextGrey3,
                    thickness: 1.5.sp,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  OrderCard(
                    imagePath: 'assets/img/food/tamago.png',
                    distance: '1.5 km',
                    time: '10 min',
                    title: '1  x  Fresh Tamagoyaki',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  OrderCard(
                    imagePath: 'assets/img/food/okonomiyaki.png',
                    distance: '0.5 km',
                    time: '10 min',
                    title: '1  x  Okonomiyaki',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  OrderCard(
                    imagePath: 'assets/img/food/sushi.png',
                    distance: '1.0 km',
                    time: '10 min',
                    title: '1  x  Sushite',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      'assets/img/back.svg',
                      width: 32.w,
                    ),
                  ),
                  Text(
                    'Order Tracking',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    required this.imagePath,
    required this.title,
    required this.time,
    required this.distance,
  });

  final String imagePath;
  final String title;
  final String time;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
      ),
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    6.r,
                  ),
                  child: SizedBox(
                    width: 94.w,
                    height: 56.h,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 32.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/img/time.svg',
                            width: 16.w,
                          ),
                          Text(
                            time,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          SvgPicture.asset(
                            'assets/img/location.svg',
                            width: 16.w,
                          ),
                          Text(
                            distance,
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
