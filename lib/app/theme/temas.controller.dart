import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TemasController extends GetxController {
  final box = GetStorage();

  RxBool _temaOscuro = false.obs;
  bool get temaOscuro => this._temaOscuro.value;

  set temaOscuro(value) {
    this._temaOscuro.value = value;
    box.write('isOscuro', value);

    if (temaOscuro) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0xff176067),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xff176067),
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    }
  }

  @override
  void onInit() {
    super.onInit();

    temaOscuro = box.read('isOscuro') ?? false;
  }
}
