import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/config.dart';
import '../../models/suggestion.dart';
import '../../widgets/search_bar.dart';
final List<Suggestion> suggestions = [
 const  Suggestion(
    'assets/img/vegetarian.svg',
    'Vegetarian Foodies',
    '200+',
  ),
 const  Suggestion(
    'assets/img/cake.svg',
    'Sweety Lovers',
    '10',
  ),
];

class EmptyPage extends StatelessWidget {
  const EmptyPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(),
        SizedBox(
          height: 32.h,
        ),
        Row(
          children: [
            Flexible(
              child: Text(
                'Suggestion for you ',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Flexible(
              child: Text(
                '(nearby)',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Config.colors.kTextGrey1,
                    ),
              ),
            ),
          ],
        ),
        ...List.generate(
          suggestions.length,
          (index) => SuggestionCard(
            suggestions[index],
          ),
        ),
        Divider(
          color: Config.colors.kTextGrey2,
          thickness: 1.sp,
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 130.w,
            ),
            SvgPicture.asset(
              'assets/img/illu6.svg',
              width: 178.w,
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          'Huh! You have no food style :(',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: 238.w,
          child: Text(
            'Pick from suggestion or you can easily search and create your own.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Config.colors.kTextGrey1,
                ),
          ),
        ),
      ],
    );
  }
}

class SuggestionCard extends StatelessWidget {
  const SuggestionCard(this.suggestion);

  final Suggestion suggestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0.h),
      child: Row(
        children: [
          Container(
            width: 56.w,
            height: 46.w,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  6.r,
                ),
              ),
              color: Config.colors.kPrimaryLight,
            ),
            child: Center(
              child: SvgPicture.asset(
                suggestion.assetName,
                width: 24.sp,
              ),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  suggestion.title,
                  style: const  TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Added by ',
                      style: TextStyle(
                        color: Config.colors.kTextGrey1,
                      ),
                    ),
                    Text(
                      '${suggestion.totalPeople} people',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                  side: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(0, 40.h),
              ),
              textStyle: MaterialStateProperty.all(
                TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  size: 14.sp,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  'Add to order',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
