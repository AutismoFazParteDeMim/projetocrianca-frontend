import 'package:projeto_crianca/ui/pages/games/memory/bloc/memory_game_bloc_states.dart';

abstract class MemoryGameBlocEvent {}

class CheckIsCorrectBlocEvent extends MemoryGameBlocEvent {}

class OpenCardBlocEvent extends MemoryGameBlocEvent {
  final CardModel card;

  OpenCardBlocEvent({required this.card});
}

class NextLevelBlocEvent extends MemoryGameBlocEvent {}
