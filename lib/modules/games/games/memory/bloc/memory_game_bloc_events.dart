import 'package:projeto_crianca/modules/games/games/memory/bloc/memory_game_bloc_states.dart';

abstract class MemoryGameBlocEvent {}

class CheckIsCorrectBlocEvent extends MemoryGameBlocEvent {}

class OpenCardBlocEvent extends MemoryGameBlocEvent {
  OpenCardBlocEvent({required this.card});

  final CardModel card;
}

class NextLevelBlocEvent extends MemoryGameBlocEvent {}
