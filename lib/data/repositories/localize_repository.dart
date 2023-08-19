import 'package:projeto_crianca/data/models/profissional_model.dart';

import 'package:projeto_crianca/data/providers/profissional_provider.dart';

class LocalizeRepository {
  LocalizeRepository(this.profissionalProvider);

  final ProfessionalProvider profissionalProvider;

  Future<List<ProfessionalModel?>?> getProfessionals() async {
    return profissionalProvider.getProfessionals();
  }
}
