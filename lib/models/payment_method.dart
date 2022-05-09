import 'package:equatable/equatable.dart';

class PaymentMethod extends Equatable {
  final String name;
  final String assetName;
  final String fee;

  PaymentMethod({
    required this.name,
    required this.assetName,
    required this.fee,
  });

  @override
  List<Object?> get props => [name, assetName, fee];
}
