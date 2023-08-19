import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc_events.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc_states.dart';

class MemoryGameBloc extends Bloc<MemoryGameBlocEvent, MemoryGameState> {
  MemoryGameBloc() : super(MemoryGameState.initialState()) {
    state.cards.shuffle();

    on<OpenCardBlocEvent>((event, emit) {
      final cards = state.cards.toList();
      final opened = state.opened.toList();

      if (opened.length < 2) {
        final index = cards.indexOf(event.card);
        cards[index].isFaceUp = true;

        final condition = opened.firstWhereOrNull(
          (element) => element.id == cards[index].id,
        );

        if (condition == null) {
          opened.add(cards[index]);
        }
      }

      add(CheckIsCorrectBlocEvent());

      return emit(
        MemoryGameState(
          cards: cards,
          opened: opened,
        ),
      );
    });

    on<CheckIsCorrectBlocEvent>((event, emit) async {
      final cards = state.cards.toList();
      var opened = state.opened.toList();

      await Future.delayed(
        const Duration(seconds: 1),
        () {
          if (opened.length == 2) {
            if (opened[0].image == opened[1].image) {
              opened = [];

              const avatarMessage =
                  'Parabéns! Continue assim. Abra as cartas restantes.';

              return emit(
                MemoryGameState(
                  cards: cards,
                  opened: opened,
                  avatarMessage: avatarMessage,
                ),
              );
            } else {
              final index1 = cards.indexOf(opened[0]);
              final index2 = cards.indexOf(opened[1]);
              cards[index1].isFaceUp = false;
              cards[index2].isFaceUp = false;
              opened = [];

              return emit(
                MemoryGameState(
                  cards: cards,
                  opened: opened,
                ),
              );
            }
          }
        },
      );
    });
  }
}
