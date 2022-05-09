import 'package:customer_app/services/cart/cart_service.dart';
import 'package:customer_app/services/order/order_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../../config/route.dart';
import '../../models/order.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderService.getMyOrders();
    final List<Order> orders = OrderService.myOrders;

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
                      'MON PANIER ',
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
                      'Commande récentes',
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
    Key? key,
    this.isLast = false,
    required this.order,
  }) : super(key: key);

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
                        'CFA ${order.price}',
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
  const CheckoutCard({Key? key}) : super(key: key);

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
                            'Voir mon panier',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            CartService.getTotal().toString(),
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
