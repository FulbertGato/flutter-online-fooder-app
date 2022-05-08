import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const CheckoutState(1));

  Stream<CheckoutState> mapEventToState(
    CheckoutEvent event,
  ) async* {
    if (event is Add) {
         yield CheckoutState(state.count + 1);
    } else if (event is Minus) {
        if (state.count > 0) yield CheckoutState(state.count - 1);
    }
  }
}
