// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:projeto_crianca/core/domain/entities/professional_entity.dart';
import 'package:projeto_crianca/modules/localize/infra/datasources/professional_datasource.dart';

class ProfessionalDatasourceImpl implements ProfessionalDatasource {
  final Dio dio = Dio();
  final String baseUrl = 'http://3.94.50.82:8080/autismofazpartedemim';

  @override
  Future<List<ProfessionalEntity?>?> getProfessionals() async {
    final response = await dio
        .get<dynamic>('$baseUrl/profissionais')
        .then((value) => value.data) as List<dynamic>?;

    if (response != null) {
      final professionals = <ProfessionalEntity?>[];
      for (final element in response) {
        professionals.add(
          ProfessionalEntity(
            profissionalId: element['id'] as int,
            nome: element['nome'] as String,
            latitude: element['latitude'] as double,
            longitude: element['longitude'] as double,
            endereco: element['endereço'] as String,
            diasFuncionamento: element['diasFuncionamento'] as String,
            horario: element['horarioFuncionamento'] as String,
            telefone: element['contato'] as String?,
            email: element['email'] as String?,
            descricao: element['descricao'] as String,
          ),
        );
      }

      return professionals;
    }

    return null;
  }
}
