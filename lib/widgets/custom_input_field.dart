import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/config.dart';


class CustomInputField extends StatelessWidget {
  const CustomInputField({
    required this.labelText,
    this.textInputAction,
    this.onSubmitted,
    this.controller,
    this.onTap,
    this.isPassword = false,
    this.hasError = false,
    required this.hintText,
    required this.assetName
  });

  final String labelText;
  final String hintText;
  final bool isPassword;
  final bool hasError;
  final TextInputAction? textInputAction;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final TextEditingController? controller;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: Config.colors.kTextGrey1,
              ),
        ),
        Stack(
          children: [
            TextField(
              obscureText: isPassword,
              controller: controller,
              textInputAction: textInputAction,
              onSubmitted: onSubmitted,
              cursorColor: Config.colors.kPrimary,
              style: Theme.of(context).textTheme.headline6,
              decoration: InputDecoration(
                 
                  isDense: true,
                  
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Config.colors.kTextGrey3,

                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color:
                          hasError ? Config.colors.kTextError : Config.colors.kTextGrey3,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Config.colors.kPrimary,
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Config.colors.kTextError,
                    ),
                  ),
                  contentPadding: EdgeInsets.only(
                    top: 16.h,
                    bottom: 16.h,
                    right: 56.w,
                  ),
                  hintText: hintText,
                  hintStyle: Theme.of(context).textTheme.headline6,
                  ),
                  
            ),
          ],
        ),
      ],
    );
  }
}
