import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../bloc/payment/payment_bloc.dart';
import '../../config/config.dart';
import '../../models/payment_method.dart';

final List<PaymentMethod> methods = [
  PaymentMethod(
    name: 'Pay cash on delivery',
    assetName: 'assets/img/cash_on_del.svg',
    fee: '0.00',
  ),
  PaymentMethod(
    name: 'Credit Card',
    assetName: 'assets/img/creditcard.svg',
    fee: '1.20',
  ),
  PaymentMethod(
    name: 'Paypal',
    assetName: 'assets/img/paypal.svg',
    fee: '0.99',
  ),
];

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: SvgPicture.asset(
                        'assets/img/back.svg',
                        width: 32.w,
                      ),
                    ),
                    Text(
                      'Payment method',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/img/add_filled.svg',
                        width: 32.w,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 64.h,
              ),
              ...List.generate(
                methods.length,
                (index) => PaymentCard(
                  methods[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard(this.model);

  final PaymentMethod model;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: EdgeInsets.only(
            bottom: 16.h,
            left: 8.w,
            right: 8.w,
          ),
          padding: EdgeInsets.all(
            16.w,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                6.r,
              ),
              side: BorderSide(
                color: model == state.method
                    ? Config.colors.kPrimary
                    : Config.colors.kTextGrey3,
              ),
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                model.assetName,
                width: 48.w,
              ),
              SizedBox(
                width: 16.h,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Fee: ',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Config.colors.kTextGrey1,
                                  ),
                        ),
                        Text(
                          '\$${model.fee}',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => BlocProvider.of<PaymentBloc>(context).add(
                  SetPayment(model),
                ),
                child: BlocBuilder<PaymentBloc, PaymentState>(
                  builder: (context, state) {
                    return model == state.method
                        ? SvgPicture.asset('assets/img/checklist.svg')
                        : SvgPicture.asset('assets/img/uncheck.svg');
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
