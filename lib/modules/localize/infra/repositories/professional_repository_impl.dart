import 'package:projeto_crianca/core/domain/entities/professional_entity.dart';
import 'package:projeto_crianca/modules/localize/domain/repositories/professional_repository.dart';
import 'package:projeto_crianca/modules/localize/infra/datasources/professional_datasource.dart';

class ProfessionalRepositoryImpl implements ProfessionalRepository {
  const ProfessionalRepositoryImpl(this.professionalProvider);

  final ProfessionalDatasource professionalProvider;

  @override
  Future<List<ProfessionalEntity?>?> getProfessionals() async {
    return professionalProvider.getProfessionals();
  }
}
