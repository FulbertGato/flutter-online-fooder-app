import 'package:flutter/material.dart';
import '../../../widgets/authentication/facebook_button.dart';
import '../../config/config.dart';
import '../../config/route.dart';
import '../../widgets/authentication/auth_widget.dart';
import '../../widgets/custom_input_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController pwController;
  late Map<String, String> credential;
  bool hasError = false;

  @override
  void initState() {
    emailController = TextEditingController();
    pwController = TextEditingController();
    credential = {
      'email': 'Farhanpoozan@gmail.com',
      'password': 'Farhan1234',
    };
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
  }

  bool authenticate() {
    String email = emailController.text;
    String password = pwController.text;

    if (email == credential['email'] && password == credential['password']) {
      return true;
    } else {
      return true;
    }
  }

  void submitForm() {
    bool success = authenticate();

    if (success) {
      setState(() {
        hasError = false;
      });
      Navigator.of(context).pushReplacementNamed(RouteGenerator.main);
    } else {
      setState(() {
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title1: 'Login to',
      title2: 'find the best food',
      children: [
        CustomInputField(
          labelText: 'EMAIL',
          assetName: 'assets/img/email.svg',
          textInputAction: TextInputAction.next,
          controller: emailController,
          hasError: hasError,
          hintText: 'Enter your email',
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomInputField(
          labelText: 'PASSWORD',
          assetName: 'assets/img/password.svg',
          controller: pwController,
          textInputAction: TextInputAction.done,
          isPassword: true,
          onSubmitted: (_) => submitForm(),
          hasError: hasError,
          hintText: 'Enter your password',
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: hasError
              ? SizedBox(
                  height: 8.h,
                )
              : Container(),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: hasError
              ? Row(
                  children: [
                    Icon(
                      Icons.clear,
                      color: Config.colors.kTextError,
                      size: 12.sp,
                    ),
                    Text(
                      'Your email or password is incorrect!',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Config.colors.kTextError,
                          ),
                    ),
                  ],
                )
              : Container(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context)
                  .pushReplacementNamed(RouteGenerator.main),
              child: const Text(
                'Forget password?',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () => submitForm(),
          child: const Text(
            'Sign in',
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        FacebookButton(),
        TextButton(
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(RouteGenerator.main),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               const Text(
                'Don\'t have an account? ',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
             const  Text(
                'Register',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
      ],
    );
  }
}
