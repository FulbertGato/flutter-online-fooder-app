part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class SetPayment extends PaymentEvent {
  final PaymentMethod method;
  const SetPayment(this.method);

  @override
  List<Object> get props => [method];
}
