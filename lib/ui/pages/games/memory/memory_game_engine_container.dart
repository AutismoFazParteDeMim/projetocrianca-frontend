import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:projeto_crianca/ui/pages/games/components/top_container_component.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc_events.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc_states.dart';
import 'package:projeto_crianca/ui/pages/games/memory/components/card_game_component.dart';

class MemoryGameEngineContainer extends RectangleComponent
    with FlameBlocListenable<MemoryGameBloc, MemoryGameState> {
  List<CardModel> cards = cards_data;

  @override
  void onNewState(MemoryGameState state) {
    super.onNewState(state);
    cards = state.cards;
    print(cards[0].isFaceUp);
    print(cards[1].isFaceUp);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    List<Component> cardsComponent = [];

    List<int> randoms = [];

    int getCardIndex() {
      int rand = Random().nextInt(cards.length);
      if (!randoms.contains(rand)) {
        randoms.add(rand);
        return rand;
      }

      return getCardIndex();
    }

    for (var i = 0; i < 4; i++) {
      for (var j = 0; j < 4; j++) {
        const double width = 80;
        const double height = 100;
        const int gap = 16;
        final columns = (size.x / 4) - width / 2;
        final rows = (size.y / 2) + 50 - height / 2;

        final card = cards[getCardIndex()];

        cardsComponent.add(
          CardGameComponent(
            image: card.image,
            isFaceUp: card.isFaceUp,
            onPressed: () => bloc.add(
              OpenCardBlocEvent(card: card),
            ),
          )
            ..size = Vector2(width, height)
            ..position = Vector2(
              columns + i * (width + gap),
              rows + j * (height + gap),
            )
            ..anchor = Anchor.center
            ..debugMode = false,
        );
      }
    }

    addAll([
      TopContainerComponent()
        ..size = Vector2(size.x, size.y)
        ..position = Vector2(0, 0),
      ...cardsComponent
    ]);
  }
}
