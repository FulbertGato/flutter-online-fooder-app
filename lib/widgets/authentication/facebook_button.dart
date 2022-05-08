import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FacebookButton extends StatelessWidget {
   const FacebookButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.all(
              Colors.white,
            ),
            side: MaterialStateProperty.all(
              const BorderSide(
                color: Colors.black,
              ),
            ),
          ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/img/facebook.svg'),
          SizedBox(
            width: 8.w,
          ),
          const Text(
            'Sign up with Facebook',
          ),
        ],
      ),
    );
  }
}
