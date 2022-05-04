import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/checkoutBloc/checkout_bloc.dart';
import '../../config/config.dart';
import '../../config/route.dart';
import '../../models/checkout.dart';

class Checkoutscreen extends StatelessWidget {
  const Checkoutscreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Checkout> checkouts = [
      const Checkout(
        shopName: 'Totsuki Elite',
        shopPic: 'assets/img/totsuki.svg',
        image: 'assets/img/food/tamago.png',
        price: 6.00,
        foods: ['Fresh Tamagoyaki'],
        time: '10',
      ),
      const Checkout(
        shopName: 'Shokugeki',
        shopPic: 'assets/img/shoku.svg',
        image: 'assets/img/food/okonomiyaki.png',
        price: 3.66,
        foods: ['Okanomiyaki'],
        time: '7',
      ),
      Checkout(
        shopName: 'Megumi',
        shopPic: 'assets/img/megumi.svg',
        image: 'assets/img/food/sushi.png',
        price: 3.66,
        foods: ['Sushite'],
        time: '3',
      ),
    ];
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
                      'Checkout order',
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
                    checkouts.length,
                    (index) => BlocProvider(
                      create: (context) => CheckoutBloc(),
                      child: CheckoutCard(checkouts[index]),
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
                    offset: Offset(0, -8),
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
                          child: const  Center(
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

class CheckoutCard extends StatelessWidget {
  const CheckoutCard(this.checkout);

  final Checkout checkout;

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
            child: Container(
              width: 94.w,
              child: Image.asset(
                checkout.image,
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
                            '${state.count}  x  ${checkout.foods[0]}',
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
                          '\$${(state.count * checkout.price).toStringAsFixed(2)}',
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
                      checkout.shopPic,
                      width: 18.w,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Expanded(
                      child: Text(
                        checkout.shopName,
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
                            '${checkout.time} min',
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
                            onTap: () =>
                                BlocProvider.of<CheckoutBloc>(context).add(
                              Minus(),
                            ),
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
                                  ' ${state.count} ',
                                  style: Theme.of(context).textTheme.headline6,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          GestureDetector(
                            onTap: () =>
                                BlocProvider.of<CheckoutBloc>(context).add(
                              Add(),
                            ),
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
                          SvgPicture.asset(
                            'assets/img/delete.svg',
                            width: 16.w,
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
