import 'package:customer_app/models/burger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../../widgets/home/food_card.dart';

final List<Burger> breakfasts = [
  Burger(
    imgPath: 'assets/img/food/tamago.png',
    desc: 'A delicious egg food from Japan',
    delivery: 'Free delivery',
    duration: '10 min',
    prix: 500,
    title: 'Burger Tamago',
  ),
  Burger(
    imgPath: 'assets/img/food/okonomiyaki.png',
    desc: '\'unagi\' is the Japanese western food.',
    delivery: 'Free delivery',
    duration: '10 min',
    prix: 5000,
    title: 'Burger Enma',
  ),
];

final List<Burger> lunches = [
  Burger(
    imgPath: 'assets/img/food/tempura.png',
    desc: 'A delicious egg food from Japan',
    delivery: 'Free delivery',
    duration: '10 min',
    prix: 5000,
    title: 'Menu Enma',
  ),
  Burger(
    imgPath: 'assets/img/food/donburi.png',
    desc: '\'unagi\' is the Japanese western food.',
    delivery: 'Free delivery',
    duration: '10 min',
    prix: 5000,
    title: 'Menu gras',
  ),
];

class StylePage extends StatelessWidget {
  const StylePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0.w,
          ),
          child: Container(
            height: 110.h,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  width: 1.sw - 16.w,
                  child: Stack(
                    children: [
                      Container(
                        height: 94.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Config.colors.kPrimary,
                          borderRadius: BorderRadius.circular(
                            6.r,
                          ),
                        ),
                      ),
                      Positioned(
                        right: -135.w,
                        child: Container(
                          width: 304.w,
                          height: 304.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Config.colors.kPrimaryLight.withOpacity(0.4),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'assets/img/illu7.svg',
                        height: 110.h,
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 94.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Salut BG ! ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                'Commandez maintenant sur brazil Burger?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
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
          child: Row(
            children: [
              Text(
                'Breakfast ',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '(Fastest food)',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Config.colors.kTextGrey1,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.w,
        ),
        Container(
          padding: EdgeInsets.only(left: 8.0.w),
          height: 240.h,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                breakfasts.length,
                (index) => FoodCard(food: breakfasts[index]),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 8.0.w,
          ),
          child: Row(
            children: [
              Text(
                'Lunch ',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '(Japanese food)',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Config.colors.kTextGrey1,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 16.w,
        ),
        Container(
          padding: EdgeInsets.only(left: 8.0.w),
          height: 240.h,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                lunches.length,
                (index) => FoodCard(food: lunches[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
