import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../../models/menu.dart';

class DetailMenuScreen extends StatelessWidget {
  Menu menu;
  DetailMenuScreen({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
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
                            'Detail Menu : '+menu.title,
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          const HeartToggle(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      width: double.infinity,
                      height: 220.h,
                      padding: EdgeInsets.only(
                        left: 8.0.w,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              height: 200.h,
                              width: 350.w,
                              margin: EdgeInsets.only(right: 16.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.r),
                                child: Image.asset(
                                  'assets/img/food/tamago.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              height: 200.h,
                              width: 350.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.r),
                                child: Image.asset(
                                  'assets/img/food/tamago.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          ],
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
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    menu.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'CFA ' + menu.prix.toString(),
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                
                              ],
                            )
                          ],
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
                      child: Row(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/img/time.svg',
                                width: 16.w,
                              ),
                              Text(
                                menu.duration,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/img/star.svg',
                                width: 16.w,
                              ),
                              Text(
                                '4.5',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/img/delivery.svg',
                                width: 16.w,
                              ),
                              Text(
                                'Free delivery',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                      ),
                      child: Text(
                        'Tamagoyaki is a type of Japanese omelette, '
                        'which is made by rolling together several layers '
                        'of cooked egg. These are often prepared in a'
                        ' rectangular omelette pan called a'
                        ' makiyakinabe or tamagoyakiki.',
                        style: TextStyle(
                          color: Config.colors.kTextGrey1,
                          height: 2.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                      ),
                      child: Row(
                        children: List.generate(menu.complements.length, (index) => 
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 6.h,
                            ),
                            color: Config.colors.kPrimaryLight,
                            child: Text(
                              index.toString(),
                            ),
                          ),
                          
                          )
                      ),
                    ),
                    Divider(
                      color: Config.colors.kTextGrey2,
                      height: 64.h,
                    ),
                    
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              width: 1.sw,
              child: Container(
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
                      offset: Offset(0, -8),
                      color: Config.colors.kTextGrey3,
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6.r,
                          ),
                        ),
                        color: Config.colors.kTextGrey3,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/img/order.svg',
                          width: 16.w,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Text(
                      '\$12.00',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      width: 24.w,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                            Colors.white,
                          ),
                          textStyle: MaterialStateProperty.all(
                            Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Place order',
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
                              child: Center(
                                child: Text(
                                  '2',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeartToggle extends StatefulWidget {
  const HeartToggle();

  @override
  _HeartToggleState createState() => _HeartToggleState();
}

class _HeartToggleState extends State<HeartToggle> {
  late bool isFav;

  @override
  void initState() {
    isFav = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFav = !isFav;
        });
      },
      child: SvgPicture.asset(
        'assets/img/heart.svg',
        width: 32.w,
        color: isFav ? Config.colors.kPrimary : Config.colors.kTextGrey2,
      ),
    );
  }
}
