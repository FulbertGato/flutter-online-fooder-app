import 'package:customer_app/services/cart/cart_service.dart';
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
                            'Passez à la caisse',
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
                        'Adresse de livraison',
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
                        onTap: () => {},
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Brazil Dakar - Senegal',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    '12 avenue de brazil burger',
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
                                'Pickup',
                                style:  TextStyle(
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
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0.w,
                      ),
                      child: GestureDetector(
                        onTap: () => {},
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
                                'Payé Cash a la livraison',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            Text(
                              'Frais: ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Config.colors.kTextGrey1,
                                  ),
                            ),
                            Text(
                              '0 FCFA',
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
                            'Details de la commande',
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
                          'Total :',
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
                          'Livraison gratuite',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Text(
                        CartService.getTotal().toString() + ' FCFA',
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
                    onPressed: () => {                     
                      Navigator.of(context).pushReplacementNamed(
                      RouteGenerator.successOrder),
                      },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Payer maintenant',
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
  const Desc({Key? key, 
    required this.title,
    required this.info,
  }) : super(key: key);

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
