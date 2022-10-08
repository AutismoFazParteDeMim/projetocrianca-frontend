class ProfissionalModel {
  int? profissionalId;
  String? nome;
  double? latitude;
  double? longitude;
  String? endereco;
  String? email;
  String? telefone;
  String? horario;
  String? diasFuncionamento;
  String? descricao;
  Uri? rotaLink;

  ProfissionalModel({
    this.profissionalId,
    this.nome,
    this.latitude,
    this.longitude,
    this.email,
    this.endereco,
    this.telefone,
    this.descricao,
    this.diasFuncionamento,
    this.horario,
    this.rotaLink,
  });

  ProfissionalModel.formJson(Map<String, dynamic> json) {
    profissionalId = json["id"];
    nome = json["nome"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    endereco = json["endereço"];
    email = json["email"];
    telefone = json["telefone"];
    horario = json["horario"];
    diasFuncionamento = json["dias"];
    descricao = json["descricao"];
  }
}
