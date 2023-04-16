import 'dart:developer';

class CardModel {
  final int id;
  final String image;
  late bool isFaceUp = false;

  CardModel({
    required this.id,
    required this.image,
    required this.isFaceUp,
  });
}

final List<CardModel> cards_data = [
  CardModel(id: 0, image: "memoryGame/abelha.png", isFaceUp: false),
  CardModel(id: 1, image: "memoryGame/cabra.png", isFaceUp: false),
  CardModel(id: 2, image: "memoryGame/camaleao.png", isFaceUp: false),
  CardModel(id: 3, image: "memoryGame/coelho.png", isFaceUp: false),
  CardModel(id: 4, image: "memoryGame/coruja.png", isFaceUp: false),
  CardModel(id: 5, image: "memoryGame/elefante.png", isFaceUp: false),
  CardModel(id: 6, image: "memoryGame/gata.png", isFaceUp: false),
  CardModel(id: 7, image: "memoryGame/hipopotamo.png", isFaceUp: false),
  CardModel(id: 0, image: "memoryGame/abelha.png", isFaceUp: false),
  CardModel(id: 1, image: "memoryGame/cabra.png", isFaceUp: false),
  CardModel(id: 2, image: "memoryGame/camaleao.png", isFaceUp: false),
  CardModel(id: 3, image: "memoryGame/coelho.png", isFaceUp: false),
  CardModel(id: 4, image: "memoryGame/coruja.png", isFaceUp: false),
  CardModel(id: 5, image: "memoryGame/elefante.png", isFaceUp: false),
  CardModel(id: 6, image: "memoryGame/gata.png", isFaceUp: false),
  CardModel(id: 7, image: "memoryGame/hipopotamo.png", isFaceUp: false),
  //CardModel(id: 8, image: "memoryGame/largaticha.png", isFaceUp: false),
  //CardModel(id: 9, image: "memoryGame/papagaio.png", isFaceUp: false),
  //CardModel(id: 10, image: "memoryGame/pato.png", isFaceUp: false),
  //CardModel(id: 11, image: "memoryGame/porco.png", isFaceUp: false),
];

class MemoryGameState {
  final List<CardModel> cards;
  final List<CardModel> openedCards;

  set setCards(List<CardModel> cards) => cards = cards;

  MemoryGameState({
    required this.cards,
    required this.openedCards,
  });

  MemoryGameState.initialState()
      : cards = cards_data,
        openedCards = [];
}
