import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginregisterController extends GetxController {
  RxDouble _ancho = (0.0).obs;

  RxDouble _ancho1 = (0.0).obs;
  get ancho1 => this._ancho1.value;
  set ancho1(value) => this._ancho1.value = value;

  RxDouble _ancho2 = (0.0).obs;
  get ancho2 => this._ancho2.value;
  set ancho2(value) => this._ancho2.value = value;

  get ancho => this._ancho.value;
  set ancho(value) => this._ancho.value = value;

  RxDouble _alto = (0.0).obs;
  get alto => this._alto.value;
  set alto(value) => this._alto.value = value;

  List<Widget> _screens = <Widget>[];
  List<Widget> get screens => this._screens.toList();
  set screens(value) => this._screens.assignAll(value);

  RxInt _index = 0.obs;
  get index => this._index.value;
  set index(value) {
    this._index.value = value;
    Future.delayed(Duration(milliseconds: 20)).then((value) {
      if (index == 0) {
        ancho1 = _ancho.value * 1.15;
        ancho2 = _ancho.value;
      } else {
        ancho1 = _ancho.value;
        ancho2 = _ancho.value * 1.15;
      }
    });
  }

  RxBool _isCargando = false.obs;
  get isCargando => this._isCargando.value;
  set isCargando(value) => this._isCargando.value = value;

  @override
  void onInit() {
    super.onInit();
    this.ancho = Get.width * 0.8;
    this.alto = Get.height * 0.5;
    this.index = 0;
  }

  @override
  void onReady() {
    super.onReady();
  }
}
