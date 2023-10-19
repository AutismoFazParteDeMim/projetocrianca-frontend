// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_crianca/modules/activities/activities/alphabet/bloc/alphabet_activity_bloc_events.dart';
import 'package:projeto_crianca/modules/activities/activities/alphabet/bloc/alphabet_activity_bloc_states.dart';

class AlphabetActivityBloc
    extends Bloc<AlphabetActivityBlocEvent, AlphabetActivityState> {
  AlphabetActivityBloc() : super(AlphabetActivityState.initialState()) {
    var counter = 0;

    on<NextLetterBlocEvent>((event, emit) {
      counter++;

      if (counter == letters.length) counter = 0;

      final nextLetter = letters.entries.elementAt(counter).value;

      final avatarMessage =
          'Parabéns! Continue assim. Vamos fazer agora a letra: ${letters.entries.elementAt(counter).key}.';

      return emit(
        AlphabetActivityState(
          letter: nextLetter,
          avatarMessage: avatarMessage,
        ),
      );
    });
  }
}
