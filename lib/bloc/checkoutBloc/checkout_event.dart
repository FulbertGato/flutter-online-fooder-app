
part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class Add extends CheckoutEvent {}

class Minus extends CheckoutEvent {}
