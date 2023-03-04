import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/bloc/alphabet_activity_bloc_events.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/bloc/alphabet_activity_bloc_states.dart';

class AlphabetActivityBloc
    extends Bloc<AlphabetActivityBlocEvent, AlphabetActivityState> {
  AlphabetActivityBloc() : super(AlphabetActivityState.initialState()) {
    on<NextLetterBlocEvent>((event, emit) {
      final currentLetter = state.letter;
      final nextLetter = String.fromCharCode(currentLetter.codeUnitAt(0) + 1);

      return emit(
        AlphabetActivityState(letter: nextLetter),
      );
    });
  }
}
