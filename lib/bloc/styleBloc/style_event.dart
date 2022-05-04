part of 'style_bloc.dart';

abstract class StyleEvent extends Equatable {
  const StyleEvent();

  @override
  List<Object> get props => [];
}

class Toggle extends StyleEvent {}
