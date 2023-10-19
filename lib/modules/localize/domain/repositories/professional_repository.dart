import 'package:projeto_crianca/core/domain/entities/professional_entity.dart';

abstract class ProfessionalRepository {
  Future<List<ProfessionalEntity?>?> getProfessionals();
}
