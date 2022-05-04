part of 'style_bloc.dart';



class StyleState extends Equatable {
  final bool isEmpty;
  const StyleState(this.isEmpty);

  @override
  List<Object> get props => [isEmpty];
}
