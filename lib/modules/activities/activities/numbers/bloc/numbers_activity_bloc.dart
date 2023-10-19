// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_crianca/modules/activities/activities/numbers/bloc/numbers_activity_bloc_events.dart';
import 'package:projeto_crianca/modules/activities/activities/numbers/bloc/numbers_activity_bloc_states.dart';

class NumbersActivityBloc
    extends Bloc<NumbersActivityBlocEvent, NumbersActivityState> {
  NumbersActivityBloc() : super(NumbersActivityState.initialState()) {
    var counter = 0;

    on<NextNumberBlocEvent>((event, emit) {
      counter++;

      if (counter == numbers.length) counter = 0;

      final nextNumber = numbers.entries.elementAt(counter).value;

      final avatarMessage =
          'Parabéns! Continue assim. Vamos fazer agora o número: ${numbers.entries.elementAt(counter).key}.';

      return emit(
        NumbersActivityState(
          number: nextNumber,
          avatarMessage: avatarMessage,
        ),
      );
    });
  }
}
