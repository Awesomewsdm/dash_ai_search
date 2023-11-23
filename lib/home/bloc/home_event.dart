part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FromWelcomeToQuestion extends HomeEvent {
  const FromWelcomeToQuestion();
}

class AskQuestion extends HomeEvent {
  const AskQuestion();
}

class QueryUpdated extends HomeEvent {
  const QueryUpdated({required this.query});

  final String query;
  @override
  List<Object> get props => [query];
}

class QuestionAsked extends HomeEvent {
  const QuestionAsked();
}
