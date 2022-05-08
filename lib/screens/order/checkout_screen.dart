import 'package:customer_app/services/cart/cart_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/checkoutBloc/checkout_bloc.dart';
import '../../config/config.dart';
import '../../config/route.dart';
import '../../models/cartItem.dart';

class Checkoutscreen extends StatefulWidget {
  const Checkoutscreen({Key? key}) : super(key: key);
  
  @override
  State<Checkoutscreen> createState() => _CheckoutscreenState();
}

class _CheckoutscreenState extends State<Checkoutscreen> {
  int quantity = CartService.getCartQuantity();
  Map<String, CartItem> checkoutsData = CartService.getCart()  ;
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: SvgPicture.asset(
                      'assets/img/back.svg',
                      width: 32.w,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Mon panier',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/img/add_filled.svg',
                      width: 32.w,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    checkoutsData.length,
                    (index) => BlocProvider(
                      create: (context) => CheckoutBloc(),
                      child: CheckoutCard(
                          checkoutsData.values.elementAt(index)),
                    ),
                  ),
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
                        CartService.getTotal().toString(),
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
                    onPressed: () =>
                        Navigator.of(context).pushNamed(RouteGenerator.pay),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
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

class CheckoutCard extends StatefulWidget {
  CheckoutCard(this.checkout, {Key? key}) : super(key: key);
  
  CartItem checkout;

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        8.w,
        16.h,
        8.w,
        32.h,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Config.colors.kTextGrey3,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              width: 94.w,
              child: Image.asset(
                "assets/img/food/tamago.png",
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
                    BlocBuilder<CheckoutBloc, CheckoutState>(
                      builder: (context, state) {
                        return Expanded(
                          child: Text(
                            widget.checkout.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                    BlocBuilder<CheckoutBloc, CheckoutState>(
                      builder: (context, state) {
                        return Text(
                          widget.checkout.totalPrice.toString() + ' CFA',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Config.colors.kTextGrey1,
                                  ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      widget.checkout.shopPic,
                      width: 18.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: Text(
                        widget.checkout.shopName,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/img/time.svg',
                            width: 16.w,
                          ),
                          Text(
                            '${widget.checkout.duration} min',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => {
                              CartService.removeItemByCode(
                                  widget.checkout.code),
                              setState(() => {}),
                              
                            },
                            child: SvgPicture.asset(
                              'assets/img/minus.svg',
                              width: 24.w,
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            child: BlocBuilder<CheckoutBloc, CheckoutState>(
                              builder: (context, state) {
                                return Text(
                                  widget.checkout.quantity.toString(),
                                  style: Theme.of(context).textTheme.headline6,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          GestureDetector(
                            onTap: () => {
                              // CartService.addItemByCode(widget.checkout.code),
                              setState(
                                () => {
                                  // widget.checkout.quantity++,
                                  CartService.addItemByCode(
                                      widget.checkout.code)
                                },
                              )
                            },
                            child: SvgPicture.asset(
                              'assets/img/add.svg',
                              width: 24.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => {
                              setState(
                                () => {
                                  CartService.removeItem(widget.checkout.code),
                                },
                              )
                            },
                            child: SvgPicture.asset(
                              'assets/img/delete.svg',
                              width: 16.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
