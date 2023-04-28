import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/bloc/alphabet_activity_bloc_events.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/bloc/alphabet_activity_bloc_states.dart';

class AlphabetActivityBloc
    extends Bloc<AlphabetActivityBlocEvent, AlphabetActivityState> {
  AlphabetActivityBloc() : super(AlphabetActivityState.initialState()) {
    int counter = 0;

    on<NextLetterBlocEvent>((event, emit) {
      counter++;

      if (counter == letters.length) counter = 0;

      final LetterModel nextLetter = letters.entries.elementAt(counter).value;

      String avatarMessage =
          "Parabéns! Continue assim. ${letters.entries.elementAt(counter).key}";
      return emit(
        AlphabetActivityState(
          letter: nextLetter,
          avatarMessage: avatarMessage,
        ),
      );
    });
  }
}
