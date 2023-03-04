import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/bloc/alphabet_activity_bloc.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/bloc/alphabet_activity_bloc_states.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/components/canvas_component.dart';
import 'package:projeto_crianca/ui/pages/activities/alphabet/components/hint_component.dart';

class AlphabetActivityEngine extends FlameGame with HasDraggableComponents {
  @override
  FutureOr<void> onLoad() async {
    await add(
      FlameBlocProvider<AlphabetActivityBloc, AlphabetActivityState>(
        create: () => AlphabetActivityBloc(),
        children: [
          HintComponent()..size = size,
        ],
      ),
    );

    return super.onLoad();
  }
}
