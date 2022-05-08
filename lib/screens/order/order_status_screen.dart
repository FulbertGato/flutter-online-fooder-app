import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../../config/route.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                            'Status de la commande',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            width: 32.w,
                          )
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
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/img/tot.svg',
                            width: 48.w,
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ORDER FROM',
                                  style: TextStyle(
                                    color: Config.colors.kTextGrey1,
                                  ),
                                ),
                                Text(
                                  'Brazil Burger',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    DottedLine(
                      dashColor: Config.colors.kTextGrey1,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w,
                      ),
                      child: Text(
                        '',
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
                      padding: EdgeInsets.only(
                        left: 8.0.w,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              SvgPicture.asset(
                                'assets/img/checklistBlack.svg',
                                width: 24.w,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              SvgPicture.asset(
                                'assets/img/progress.svg',
                                height: 24.w,
                              ),
                              
                              SizedBox(
                                height: 20.h,
                              ),
                              Container(
                                width: 24.w,
                                height: 24.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Config.colors.kPrimaryLight,
                                ),
                              ),
                              SizedBox(
                                height: 64.h,
                              ),
                              Container(
                                width: 24.w,
                                height: 24.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Config.colors.kPrimaryLight,
                                ),
                              ),
                              SizedBox(
                                height: 64.h,
                              ),
                              Container(
                                width: 24.w,
                                height: 24.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Config.colors.kPrimaryLight,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const StepsCard(
                                  time: '7:00',
                                  desc: 'Order Recieved',
                                  step: 'ORDER',
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                               const  StepsCard(
                                  time: '7:03',
                                  desc: 'Your food is under cooking!',
                                  step: 'COOKING',
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                              const   StepsCard(
                                  time: '7:10',
                                  desc: 'Your food is ready!',
                                  step: 'READY',
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                              const   StepsCard(
                                  time: '7:10',
                                  desc: 'Your food is on the way, get now!',
                                  step: 'Delivery',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(RouteGenerator.orderTracking),
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
                                SvgPicture.asset(
                                  'assets/img/pin.svg',
                                  width: 24.w,
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                const Expanded(
                                  child: Text(
                                    'Order Tracking',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/img/arrow.svg',
                                  width: 16.w,
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
            ),
          ],
        ),
      ),
    );
  }
}

class StepsCard extends StatelessWidget {
  const StepsCard({
    required this.step,
    required this.desc,
    required this.time,
  });

  final String step;
  final String desc;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      padding: EdgeInsets.only(
        bottom: 16.h,
        right: 8.w,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Config.colors.kTextGrey3,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            step,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Config.colors.kTextGrey1,
                ),
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  desc,
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  color: Config.colors.kTextGrey1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
