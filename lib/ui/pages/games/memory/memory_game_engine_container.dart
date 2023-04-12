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
    //cards = state.cards;
    super.onNewState(state);
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    List<Component> data = [];

    for (var i = 0; i < 5; i++) {
      for (var j = 0; j < 4; j++) {
        data.add(
          CardGameComponent(image: cards[j].image)
            ..position = Vector2((size.x / 4) * i - (size.x / 4) / 2,
                (600 / 4) * j - (600 / 4) / 2 + size.y / 1.6),
        );
      }
    }

    data.shuffle();
    addAll([
      TopContainerComponent()
        ..size = Vector2(size.x, size.y)
        ..position = Vector2(0, 0),
      ...data
    ]);
  }
}
