import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/config.dart';
import '../../models/burger.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    required this.food,
    this.onTap,
  });

  final Burger food;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 240.w,
        margin: EdgeInsets.only(right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 240.w,
              height: 130.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.r),
                  topRight: Radius.circular(6.r),
                ),
                child: Image.asset(
                  food.imgPath,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              food.title,
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              food.desc,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Config.colors.kTextGrey1,
                  ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/img/time.svg',
                        width: 16.w,
                      ),
                      Text(
                        food.duration,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/img/star.svg',
                        width: 16.w,
                      ),
                      Text(
                        food.rating,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/img/delivery.svg',
                        width: 16.w,
                      ),
                      Text(
                        food.delivery,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}