import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_quiz/model/model_add.dart';
import 'package:test_quiz/service/service.dart';
part 'add_question_event.dart';
part 'add_question_state.dart';
class AddQuestionBloc extends Bloc<AddQuestionEvent, AddQuestionState> {
  AddQuestionBloc() : super(AddQuestionInitial()) {
    on<Postbloc>((event, emit) async {
      try {
        emit(Loading());
dynamic temp = await  AddServiceImpl().Question(event.Asks);
        
        if (temp is String) {
          emit(Error());
          print(temp);
        } else {
          emit(Success());
        }
      } catch (e) {
        emit(Offline());
      }
    });
  }
}

