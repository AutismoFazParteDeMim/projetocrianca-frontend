import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:projeto_crianca/ui/pages/games/components/top_container_component.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc_events.dart';
import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc_states.dart';
import 'package:projeto_crianca/ui/pages/games/memory/components/card_game_component.dart';

class MemoryGameEngineContainer extends RectangleComponent
    with FlameBlocListenable<MemoryGameBloc, MemoryGameState> {
  List<CardModel>? cards;
  List<CardModel>? opened;

  @override
  void onNewState(MemoryGameState state) {
    super.onNewState(state);
    cards = state.cards;
    opened = state.opened;
    onLoad();
  }

  void onCardPressed(CardModel card) {
    bloc.add(OpenCardBlocEvent(card: card));
  }

  @override
  void onMount() {
    super.onMount();
    onLoad();
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    if (super.isMounted && cards == null) {
      cards = bloc.state.cards;
    }

    if (cards != null) {
      List<CardGameComponent> cardsComponent = [];

      int index = 0;
      for (var i = 0; i < 4; i++) {
        for (var j = 0; j < 4; j++) {
          const double width = 80;
          const double height = 100;
          const int gap = 16;
          final columns = (size.x / 4) - width / 2;
          final rows = (size.y / 2) - height;

          final CardModel card = cards![index];

          cardsComponent.add(
            CardGameComponent(
              image: card.image,
              isFaceUp: card.isFaceUp,
              onPressed: () => onCardPressed(card),
            )
              ..position = Vector2(
                columns + i * (width + gap),
                rows + j * (height + gap),
              )
              ..anchor = Anchor.center
              ..debugMode = false,
          );

          index++;
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
}
