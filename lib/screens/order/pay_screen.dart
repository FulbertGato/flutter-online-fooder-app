import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../../config/route.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
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
                            'Checkout order',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            width: 32.w,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w,
                      ),
                      child: Text(
                        'SELECT ADDRESS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Config.colors.kTextGrey1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w,
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(RouteGenerator.main),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Farhan Fauzan',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    '4536 Northwest Boulevard, NJ',
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(
                                  6.r,
                                ),
                              ),
                              child: const Text(
                                'Home',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            SvgPicture.asset(
                              'assets/img/kebabmenu.svg',
                              width: 24.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          6.r,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 72.h,
                          decoration: BoxDecoration(
                            color: Config.colors.kPrimaryLight,
                            borderRadius: BorderRadius.circular(
                              6.r,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: -50,
                                top: -30,
                                child: Container(
                                  width: 231.w,
                                  height: 231.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Config.colors.kPrimary.withOpacity(0.1),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 24.0.w,
                                  ),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        child: Text(
                                          'Cashback 50% Black Friday',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 80.w,
                                        height: 24.h,
                                        child: Stack(
                                          children: [
                                            SvgPicture.asset(
                                              'assets/img/coupon.svg',
                                            ),
                                            Center(
                                              child: Text(
                                                '2 Coupon',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w,
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(RouteGenerator.main),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/img/cash.svg',
                              width: 32.w,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: Text(
                                'Pay Cash',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              'Fee: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Config.colors.kTextGrey1,
                                  ),
                            ),
                            Text(
                              '\$0.00',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            SvgPicture.asset(
                              'assets/img/arrow.svg',
                              width: 16.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    DottedLine(
                      dashColor: Config.colors.kTextGrey1,
                      lineThickness: 0.5.sp,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'ORDER ID',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Config.colors.kTextGrey1,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const Desc(
                            title: 'Order Id',
                            info: 'FDS-7850-37676-CDXX',
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const Desc(
                            title: 'Order date',
                            info: 'Today, 08:00',
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 64.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'ORDER DETAILS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Config.colors.kTextGrey1,
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const Desc(
                            title: 'Okonomiyaki',
                            info: 'x  2',
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const Desc(
                            title: 'Fresh Tamagoyaki',
                            info: 'x  1',
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const Desc(
                            title: 'Sushite',
                            info: 'x  1',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                16.w,
                16.h,
                16.w,
                40.h,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50.sp,
                    offset: const Offset(0, -8),
                    color: Config.colors.kTextGrey3,
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Total order:',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Config.colors.kTextGrey1,
                                  ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.w,
                        ),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              6.r,
                            ),
                          ),
                          color: Config.colors.kPrimaryLight,
                        ),
                        child: Text(
                          'Free delivery',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Text(
                        '\$17.66',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                        Colors.white,
                      ),
                      textStyle: MaterialStateProperty.all(
                        Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pushReplacementNamed(
                      RouteGenerator.successOrder,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Pay now',
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Container(
                          width: 24.w,
                          height: 24.w,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(
                              4.r,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '4',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Desc extends StatelessWidget {
  const Desc({
    required this.title,
    required this.info,
  });

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          info,
          style: Theme.of(context).textTheme.headline6,
        )
      ],
    );
  }
}
