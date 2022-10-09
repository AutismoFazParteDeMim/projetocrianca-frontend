class ProfissionalModel {
  int profissionalId;
  String nome;
  double latitude;
  double longitude;
  String endereco;
  String? email;
  String? telefone;
  String horario;
  String diasFuncionamento;
  String descricao;

  ProfissionalModel({
    required this.profissionalId,
    required this.nome,
    required this.latitude,
    required this.longitude,
    required this.email,
    required this.endereco,
    required this.telefone,
    required this.descricao,
    required this.diasFuncionamento,
    required this.horario,
  });

}
