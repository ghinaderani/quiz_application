part of 'add_question_bloc.dart';

// part of 'add_question_bloc.dart';

@immutable
sealed class AddQuestionEvent {}


class Postbloc extends AddQuestionEvent {
  ModelAdd Asks;
  Postbloc({
    required this.Asks,
  });
}
