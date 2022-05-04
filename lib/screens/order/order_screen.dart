import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../../config/route.dart';
import '../../models/Order.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Order> orders = [
      const Order(
        foods: [
          '2  x  Okonomiyaki',
          '1  x  Fresh Tamagoyaki',
        ],
        price: '16.00',
        shopName: 'Totsuki Elite',
        shopPic: 'assets/img/totsuki.svg',
        image: 'assets/img/food/okonomiyaki.png',
      ),
      const Order(
        foods: [
          '1  x  Karage Balls',
        ],
        price: '3.66',
        shopName: 'Shokugeki',
        shopPic: 'assets/img/shoku.svg',
        image: 'assets/img/food/karageball.png',
      ),
      const Order(
        foods: [
          '1  x  Sushite',
        ],
        price: '2.57',
        shopName: 'Megumi',
        shopPic: 'assets/img/megumi.svg',
        image: 'assets/img/food/sushi.png',
      ),
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Column(
            children: [
              Text(
                'Your order',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'READY TO CHECKOUT',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              const CheckoutCard(),
              SizedBox(
                height: 32.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'ORDER ON THE WAY',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
              ...List.generate(
                orders.length,
                (index) => OrderCard(
                  order: orders[index],
                  isLast: index == orders.length - 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({
    this.isLast = false,
    required this.order,
  });

  final bool isLast;
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 24.h,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : BorderSide(
                  color: Config.colors.kTextGrey3,
                ),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              width: 94.w,
              child: Image.asset(
                order.image,
              ),
            ),
          ),
          SizedBox(
            width: 24.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  order.foods.length,
                  (index) => Column(
                    children: [
                      Text(
                        order.foods[index],
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      order.shopPic,
                      width: 18.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: Text(
                        order.shopName,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '\$${order.price}',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            'assets/img/arrow.svg',
            width: 16.w,
          ),
          SizedBox(
            width: 12.w,
          )
        ],
      ),
    );
  }
}

class CheckoutCard extends StatelessWidget {
  const CheckoutCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        RouteGenerator.checkout,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 94.w,
        child: Stack(
          children: [
            Positioned(
              right: 0,
              child: Container(
                height: 94.w,
                width: 1.sw - 93.w - 16.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Config.colors.kTextGrey2,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6.r),
                    bottomRight: Radius.circular(6.r),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'View all order',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            '\$17.66',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/img/arrow.svg',
                      width: 16.sp,
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                height: 94.w,
                width: 94.w,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6.r),
                      bottomLeft: Radius.circular(6.r),
                    ),
                  ),
                  color: Config.colors.kPrimary,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/img/illu8.svg',
                    width: 50.w,
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
