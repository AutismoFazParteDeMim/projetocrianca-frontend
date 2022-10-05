import 'package:projeto_crianca/data/models/profissional_model.dart';
import 'package:projeto_crianca/data/repositorys/register_repository.dart';

import 'package:projeto_crianca/data/providers/profissional_provider.dart';

class LocalizeRepository {
  final ProfissionalProvider profissionalProvider;

  LocalizeRepository(this.profissionalProvider);

  Future<List<ProfissionalModel?>?> getProfissionals() async {
    return await profissionalProvider.getProfissionals();
  }
}