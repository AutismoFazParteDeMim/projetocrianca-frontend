import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/mixins/storage_mixin.dart';

class SettingsPageController extends GetxController with StorageMixin {
  final Rx<ThemeMode> _currentTheme = Rx(ThemeMode.light);

  //getters
  ThemeMode get getCurrentTheme => _currentTheme.value;

  @override
  void onReady() {
    super.onReady();

    _currentTheme.value = ThemeMode.values.firstWhereOrNull(
          (element) =>
              element.name ==
              storageRead(
                container: "settings",
                key: "theme",
              ),
        ) ??
        ThemeMode.light;
  }

  void changeTheme({required bool isDark}) {
    if (isDark == true) {
      _currentTheme.value = ThemeMode.dark;
    } else {
      _currentTheme.value = ThemeMode.light;
    }

    Get.changeThemeMode(_currentTheme.value);
    storageWrite(
      container: "settings",
      key: "theme",
      value: _currentTheme.value.name,
    );
  }
}
