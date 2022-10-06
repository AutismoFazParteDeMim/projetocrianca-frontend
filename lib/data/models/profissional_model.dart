class ProfissionalModel {
  int? profissionalId;
  String? nome;
  double? latitude;
  double? longitude;

  ProfissionalModel(
      {this.profissionalId, this.nome, this.latitude, this.longitude});

  ProfissionalModel.formJson(Map<String, dynamic> json) {
    profissionalId = json["id"];
    nome = json["nome"];
    latitude = json["latitude"];
    longitude = json["longitude"];
  }
}
