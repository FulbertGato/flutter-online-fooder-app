part of 'checkout_bloc.dart';

class CheckoutState extends Equatable {
  final int count;
  const CheckoutState(this.count);

  @override
  List<Object> get props => [count];
}
