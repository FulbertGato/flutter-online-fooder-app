import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/route.dart';
import '../../../models/user.dart';
import '../../../services/notification/notification_service.dart';
import '../../../widgets/authentication/auth_widget.dart';
import '../../../widgets/authentication/facebook_button.dart';
import '../../../widgets/custom_input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController pwController;
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    pwController = TextEditingController();
    
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    pwController.dispose();
    super.dispose();
  }

  //verify the form
  bool validateForm() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        pwController.text.isEmpty) {
      return false;
    }

    return true;
  }

  void submitForm() {
    if (validateForm()) {

      Random rnd;
      int min = 1000;
      int max = 9999;
      rnd = Random();
      int randomNumber = rnd.nextInt(max - min) + min;
      String code = randomNumber.toString();
     //String code = '1234';
      User user = User(
        lastName: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: pwController.text,
        firstName: "",
      );
      ScreenArguments args = ScreenArguments( phoneController.text,code,user);
      NotificationService.sendSmsCompte(phoneController.text, code);
      Navigator.of(context).pushNamed(RouteGenerator.verification,
          arguments: args);
    }else{
      print('Form is not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title1: 'S\'inscrire',
      title2: 'Nouveau compte',
      children: [
        CustomInputField(
          assetName: 'assets/img/data.svg',
          labelText: 'Nom complet',
          controller: nameController,
          textInputAction: TextInputAction.next,
          hintText: '',
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomInputField(
          assetName: 'assets/img/email.svg',
          labelText: 'EMAIL',
          controller: emailController,
          textInputAction: TextInputAction.next,
          hintText: '',
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomInputField(
          assetName: 'assets/img/phone.svg',
          labelText: 'PHONE',
          controller: phoneController,
          textInputAction: TextInputAction.next,
          hintText: '',
        ),
        SizedBox(
          height: 16.h,
        ),
        CustomInputField(
          assetName: 'assets/img/password.svg',
          labelText: 'PASSWORD',
          isPassword: true,
          controller: pwController,
          onSubmitted: (_) => submitForm(),
          hintText: '',
        ),
        SizedBox(
          height: 16.h,
        ),
        ElevatedButton(
          onPressed: () => submitForm(),
          child: const Text('Créer un compte'),
        ),
        SizedBox(
          height: 16.h,
        ),
        const FacebookButton(),
        TextButton(
            onPressed: () => Navigator.of(context).pushReplacementNamed(
                  RouteGenerator.login,
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'j\'ai déja un compte? ',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                const Text('Se connecter')
              ],
            ))
      ],
    );
  }
}
