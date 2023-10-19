import 'package:projeto_crianca/core/domain/entities/professional_entity.dart';

abstract class ProfessionalDatasource {
  Future<List<ProfessionalEntity?>?> getProfessionals();
}
