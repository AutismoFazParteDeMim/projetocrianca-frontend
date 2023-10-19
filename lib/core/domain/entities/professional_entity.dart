import 'package:dart_mappable/dart_mappable.dart';

part 'professional_entity.mapper.dart';

@MappableClass()
class ProfessionalEntity with ProfessionalEntityMappable {
  ProfessionalEntity({
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

  final int profissionalId;
  final String nome;
  final double latitude;
  final double longitude;
  final String endereco;
  final String? email;
  final String? telefone;
  final String horario;
  final String diasFuncionamento;
  final String descricao;
}
