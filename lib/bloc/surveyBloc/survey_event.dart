part of 'survey_bloc.dart';

abstract class SurveyEvent extends Equatable {
  const SurveyEvent();

  @override
  List<Object> get props => [];
}

class Toggle extends SurveyEvent {
  const Toggle();
}
