class CardModel {
  final int id;
  final String image;

  CardModel({
    required this.id,
    required this.image,
  });
}

final cards_data = [
  CardModel(id: 0, image: "memoryGame/abelha.png"),
  CardModel(id: 1, image: "memoryGame/cabra.png"),
  CardModel(id: 2, image: "memoryGame/camaleao.png"),
  CardModel(id: 3, image: "memoryGame/coelho.png"),
  CardModel(id: 4, image: "memoryGame/coruja.png"),
  CardModel(id: 5, image: "memoryGame/elefante.png"),
  CardModel(id: 6, image: "memoryGame/gata.png"),
  CardModel(id: 7, image: "memoryGame/hipopotamo.png"),
  CardModel(id: 8, image: "memoryGame/largaticha.png"),
  CardModel(id: 9, image: "memoryGame/papagaio.png"),
  CardModel(id: 10, image: "memoryGame/pato.png"),
  CardModel(id: 11, image: "memoryGame/porco.png"),
];

class MemoryGameState {
  final List<CardModel> cards;

  MemoryGameState({required this.cards});

  MemoryGameState.initialState() : cards = cards_data;
}
