import 'package:customer_app/models/burger.dart';
import 'package:customer_app/services/cart/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_svg/svg.dart';
import '../../config/config.dart';
import '../../config/route.dart';
import '../../models/cartItem.dart';

class DetailScreen extends StatefulWidget {
  Burger burger;
  
  static Map<String, CartItem> cartItemMap = {};
  DetailScreen({Key? key, required this.burger}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
                            'Details de ' + widget.burger.title,
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
                                  widget.burger.imgPath,
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
                                    widget.burger.title,
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
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/img/totsuki.svg',
                                        width: 18.w,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Text(
                                        'Totsuki Elite',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      SvgPicture.asset(
                                        'assets/img/rating.svg',
                                        color: Config.colors.kPrimary,
                                      ),
                                      SvgPicture.asset(
                                        'assets/img/rating.svg',
                                        color: Config.colors.kPrimary,
                                      ),
                                      SvgPicture.asset(
                                        'assets/img/rating.svg',
                                        color: Config.colors.kPrimary,
                                      ),
                                      SvgPicture.asset(
                                        'assets/img/rating.svg',
                                        color: Config.colors.kPrimary,
                                      ),
                                      SvgPicture.asset(
                                        'assets/img/rating.svg',
                                        color: Config.colors.kTextGrey2,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'CFA ' + widget.burger.prix.toString(),
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
                                widget.burger.duration,
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
                        widget.burger.desc,
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
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 6.h,
                            ),
                            color: Config.colors.kPrimaryLight,
                            child: const Text(
                              'Breakfast',
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 6.h,
                            ),
                            color: Config.colors.kPrimaryLight,
                            child: const Text(
                              'Vegan',
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 6.h,
                            ),
                            color: Config.colors.kPrimaryLight,
                            child: const Text(
                              'African',
                            ),
                          )
                        ],
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
                      offset: const Offset(0, -8),
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
                      widget.burger.prix.toString() + ' CFA',
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
                        onPressed: () {                       
                          CartService.addItem(widget.burger);

                          // success dialog
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Success'),
                              content: Text('Burger added to cart'),
                              actions: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                          setState(() {});
                          //afficher le panier
                          //Navigator.of(context).pushNamed(RouteGenerator.checkout,);
                          

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Ajouter au panier',
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
                              child:  Center(
                                child: Text(
                                  CartService.cartItemMap.length.toString(),
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
  const HeartToggle({Key? key}) : super(key: key);

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
