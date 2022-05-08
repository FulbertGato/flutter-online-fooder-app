import 'package:flutter/material.dart';


class AuthScaffold extends StatelessWidget {
   const AuthScaffold({Key? key, 
    required this.title1,
    required this.title2,
    required this.children,
  }) : super(key: key);

  final List<Widget> children;
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 32.0,
                ),
                Text(
                  title1,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  title2,
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 64.0,
                ),
                ...children
              ],
            ),
          ),
        ),
      ),
    );
  }
}
