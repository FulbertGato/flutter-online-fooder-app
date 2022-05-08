part of 'survey_bloc.dart';

class SurveyState extends Equatable {
  final bool isSelected;
  const SurveyState(this.isSelected);

  @override
  List<Object> get props => [isSelected];
}
