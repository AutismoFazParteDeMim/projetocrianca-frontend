import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc_events.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc_states.dart';

class MemoryGameBloc extends Bloc<MemoryGameBlocEvent, MemoryGameState> {
  MemoryGameBloc() : super(MemoryGameState.initialState()) {
    on<GetCardsBlocEvent>((event, emit) {
      List<CardModel> newCards = [];

      cards_data.shuffle();
      newCards = cards_data.toList();

      return emit(
        MemoryGameState(cards: newCards),
      );
    });
  }
}
