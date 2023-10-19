import 'package:get/get.dart';

mixin ValidatorsMixin {
  String? emailValidador(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Este campo não pode estar vazio!';
      } else if (!value.isEmail) {
        return 'Digite seu email corretamente.';
      }
    }

    return null;
  }

  String? passwordValidador(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Este campo não pode estar vazio!';
      } else if (value.length < 8) {
        return 'Sua senha deve conter no mínimo 08 caracteres.';
      }
    }

    return null;
  }

  String? nameValidador(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return 'Este campo não pode estar vazio!';
      } else if (value.length < 3) {
        return 'O nome deve ter ao menos 3 caracteres!';
      }
    }

    return null;
  }

  String? equalValidador(String? value1, String? value2) {
    if (value1 != null && value2 != null) {
      if (value1.isEmpty || value2.isEmpty) {
        return 'Este campo não pode estar vazio!';
      } else if (value1 != value2) {
        return 'Os campos não conferem!';
      }
    }

    return null;
  }
}
