part of 'chip_bloc.dart';

class ChipState extends Equatable {
  final int currentMealIndex;
  const ChipState(this.currentMealIndex);

  @override
  List<Object> get props => [currentMealIndex];
}
