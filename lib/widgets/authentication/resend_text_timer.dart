import 'dart:async';
import 'package:flutter/material.dart';

class ResendTextTimer extends StatefulWidget {
  const ResendTextTimer({ Key? key }) : super(key: key);

  @override
  State<ResendTextTimer> createState() => _ResendTextTimerState();
}

class _ResendTextTimerState extends State<ResendTextTimer> {
  late int count;
  late Timer counter;

  @override
  void initState() {
    count = 120;
    counter = Timer.periodic(const Duration(seconds: 1), (_) {
      if (count == 0) {
        count = 60;
      }
      setState(() {
        count--;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    counter.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'j\'ai pas reçu de code? ',
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          'Renvoyer ($count)',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
