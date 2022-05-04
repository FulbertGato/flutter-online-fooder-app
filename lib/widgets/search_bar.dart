import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/config.dart';

class SearchBar extends StatelessWidget {
  const SearchBar();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          textAlignVertical: TextAlignVertical.bottom,
          cursorColor: Config.colors.kPrimary,
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            fillColor: Config.colors.kSearchBar,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                6.r,
              ),
            ),
            contentPadding: EdgeInsets.only(
              top: 16.h,
              bottom: 16.h,
              left: 56.w,
            ),
            hintText: 'Search food',
            hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Config.colors.kTextGrey1,
                ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 20.w,
          child: SvgPicture.asset(
            'assets/img/search.svg',
            width: 24.w,
          ),
        )
      ],
    );
  }
}
