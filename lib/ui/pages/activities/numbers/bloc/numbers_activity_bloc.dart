import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_crianca/ui/pages/activities/numbers/bloc/numbers_activity_bloc_events.dart';
import 'package:projeto_crianca/ui/pages/activities/numbers/bloc/numbers_activity_bloc_states.dart';

class NumbersActivityBloc
    extends Bloc<NumbersActivityBlocEvent, NumbersActivityState> {
  NumbersActivityBloc() : super(NumbersActivityState.initialState()) {
    int counter = 0;

    on<NextNumberBlocEvent>((event, emit) {
      counter++;

      if (counter == numbers.length) counter = 0;

      final NumberModel nextNumber = numbers.entries.elementAt(counter).value;

      return emit(
        NumbersActivityState(number: nextNumber),
      );
    });
  }
}
