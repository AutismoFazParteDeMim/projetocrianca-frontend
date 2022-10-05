import 'dart:developer';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:projeto_crianca/data/models/profissional_model.dart';
class ProfissionalProvider {
  final Dio dio = Dio();
  
  final String baseUrl = "https://b2be-2804-14c-f282-9037-4626-c1e3-265e-2af8.sa.ngrok.io/";

   Future<List<ProfissionalModel?>?> getProfissionals() async {
    // final List<dynamic>? response = await dio.get("$baseUrl/profissionais").then(
    //       (value) => value.data,
    //     );
    final List<Map> response = [{"id": 1, "nome": "O Farol", "latitude": -26.294703, "longitude": -48.848145 }];
    if (response != null) {
      final List<ProfissionalModel?> profissionals = [];

      for (var element in response) {
        profissionals.add(ProfissionalModel(
          profissionalId : element["id"],
          nome : element["nome"],
          latitude : element["latitude"],
          longitude : element["longitude"],
        ));
      }

      return profissionals;
    }

    return null;
  }

}