import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/payment_method.dart';


part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc()
      : super(
          PaymentState(
            PaymentMethod(
              name: 'Pay cash on delivery',
              fee: '0.00',
              assetName: 'assets/img/cash_on_del.svg',
            ),
          ),
        );

  @override
  Stream<PaymentState> mapEventToState(
    PaymentEvent event,
  ) async* {
    if (event is SetPayment) {
      yield PaymentState(event.method);
    }
  }
}
