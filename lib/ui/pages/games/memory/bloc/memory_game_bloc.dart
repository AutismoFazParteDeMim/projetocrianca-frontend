import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc_events.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc_states.dart';

class MemoryGameBloc extends Bloc<MemoryGameBlocEvent, MemoryGameState> {
  MemoryGameBloc() : super(MemoryGameState.initialState()) {
    on<OpenCardBlocEvent>((event, emit) {
      List<CardModel> cards = state.cards.toList();
      List<CardModel> opened = state.openedCards.toList();

      final index = cards.indexOf(event.card);

      for (var card in cards) {
        print(card);
      }
      print(index);
      cards[index].isFaceUp = true;

      return emit(
        MemoryGameState(
          cards: cards,
          openedCards: opened,
        ),
      );
    });
  }
}
