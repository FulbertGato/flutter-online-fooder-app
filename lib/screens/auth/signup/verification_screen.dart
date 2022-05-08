import 'package:customer_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/config.dart';
import '../../../config/route.dart';
import '../../../models/user.dart';
import '../../../widgets/authentication/resend_text_timer.dart';
import '../../../widgets/authentication/tac_row.dart';

class VerificationScreen extends StatefulWidget {
  final String code;
  final String phone;
  final User user;
  const VerificationScreen(
      {Key? key, required this.code, required this.phone, required this.user})
      : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late bool hasError;

  String userKeyedInTac = '';

  @override
  void initState() {
    hasError = false;

    super.initState();
  }

  void checkTac() {
    if (widget.code == userKeyedInTac) {
      setState(() {
        hasError = false;
      });

      var user = authService.registerUser(widget.user);

      if (user != null) {
        bool isLoggedIn = authService.isLoggedIn;

        if (isLoggedIn) {
          Navigator.of(context).pushReplacementNamed(RouteGenerator.survey);
        } else {
          Navigator.of(context).pushReplacementNamed(RouteGenerator.signup);
        }
      }
//survey
    } else {
      setState(() {
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: SvgPicture.asset(
                        'assets/img/back.svg',
                        width: 32.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 64.h,
                ),
                SvgPicture.asset(
                  'assets/img/illu5.svg',
                  width: 252.w,
                ),
                SizedBox(
                  height: 32.h,
                ),
                TacRow(
                  activeColor: Config.colors.kPrimary,
                  hasError: hasError,
                  tacCode: widget.code,
                  setTacCode: (String val) => userKeyedInTac = val,
                  successCallback: () {
                    setState(() {
                      hasError = false;
                    });
                    Navigator.of(context)
                        .pushReplacementNamed(RouteGenerator.survey); //survey
                  },
                  failCallback: () {
                    setState(() {
                      hasError = true;
                    });
                  },
                  onChanged: () {
                    setState(() {
                      hasError = false;
                    });
                  },
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: 217.w,
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: Text(
                        'Nous avons envoyé la vérification du code à votre numéro de téléphone mobile ' +
                            widget.phone.lastChars(4)),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: hasError
                              ? Config.colors.kTextError
                              : Config.colors.kTextBlack,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () => checkTac(),
                  child: const Text(
                    'Verification',
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                const ResendTextTimer(),
                SizedBox(
                  height: 64.h,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Need help?',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension E on String {
  String lastChars(int n) => substring(length - n);
}
