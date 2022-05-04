import 'package:customer_app/screens/foodStyle/empty_page.dart';
import 'package:customer_app/screens/foodStyle/style_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/styleBloc/style_bloc.dart';
class FoodStyleScreen extends StatelessWidget {
  const FoodStyleScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StyleBloc(),
      child: Child(),
    );
  }
}

class Child extends StatelessWidget {
  const Child();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 32.w,
                  ),
                  const Spacer(),
                  Text(
                    'Food Style',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => BlocProvider.of<StyleBloc>(context).add(
                      Toggle(),
                    ),
                    child: SvgPicture.asset(
                      'assets/img/add_filled.svg',
                      width: 32.w,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            BlocBuilder<StyleBloc, StyleState>(
              builder: (context, state) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  child: state.isEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: const StylePage(),
                        )
                      : const EmptyPage() ,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
