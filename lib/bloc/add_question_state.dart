part of 'add_question_bloc.dart';

// part of 'add_question_bloc.dart';

@immutable
sealed class AddQuestionState {}

final class AddQuestionInitial extends AddQuestionState {}

class Success extends AddQuestionState {
  //  String token;
  // Success({
  //   required this.token,
  // });
  }

class Error extends AddQuestionState{}

class Loading extends AddQuestionState {}

class Offline extends AddQuestionState {}

