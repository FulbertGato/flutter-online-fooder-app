part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final PaymentMethod method;
  const PaymentState(this.method);

  @override
  List<Object> get props => [method];
}
