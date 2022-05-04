part of 'chip_bloc.dart';

abstract class ChipEvent extends Equatable {
  const ChipEvent();
}

class SelectChip extends ChipEvent {
  final int index;
  const SelectChip(this.index);

  @override
  List<Object> get props => [index];
}
