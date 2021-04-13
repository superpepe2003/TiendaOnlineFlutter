

import 'dart:io';

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/categoria_model.dart';
import 'package:tienda_online_flutter/app/data/model/tienda_model.dart';
import 'package:tienda_online_flutter/app/data/repository/categoria_repository.dart';
import 'package:tienda_online_flutter/app/data/repository/tienda_repository.dart';
import 'package:tienda_online_flutter/app/data/service/user_service.dart';

class MiTiendaController extends GetxController{

  TiendaRepository _repository = Get.find<TiendaRepository>();
  CategoriaRepository _repositoryCategoria = Get.find<CategoriaRepository>();

  Rx<TiendaModel> _miTienda = TiendaModel().obs;
  List<CategoriaModel> categorias = [];
  List<CategoriaModel> categoriasTienda = [];
  RxString _nombre = ''.obs;
  RxString _errorNombre = ''.obs;
  RxString _telefono = ''.obs;
  RxString _errorTelefono = ''.obs;
  RxBool _isLoading = false.obs;
  RxBool _cargandoFoto = false.obs;
  RxBool _guardando = false.obs;
  RxBool _hayTienda = false.obs;

  Rx<File> _fileImagen = Rx<File>( null );

  // GET
  TiendaModel get miTienda => _miTienda.value;
  bool get isLoading => _isLoading.value;
  File get fileImagen => _fileImagen.value;
  bool get cargandoFoto => _cargandoFoto.value;
  bool get guardando => _guardando.value;
  bool get hayTienda => _hayTienda.value;
  String get nombre => _nombre.value;
  String get telefono => _telefono.value;
  String get errorNombre => _errorNombre.value;
  String get errorTelefono => _errorTelefono.value;

  // SET
  set miTienda( TiendaModel value ) => _miTienda.value = value;
  set fileImagen( File value ) => _fileImagen.value = value;
  set nombre( String value ) {
    _nombre.value = value;
    validarCampos();
  }
  set telefono( String value ) {
    _telefono.value = value;
    validarCampos();
  }

  @override
  void onInit() {
    
    getTienda();
    
    super.onInit();
  }

  @override
  void onReady(){
    print('Estoy');
  }

  getTienda() async {

    _isLoading.value = true;
    
    try{
      miTienda = await _repository.getTiendaUser( Get.find<UserService>().user.id );
      categorias = await _repositoryCategoria.getCategoria();
      cargarCategoriasTienda();
      if( miTienda.nombre != null) _hayTienda.value = true;
    } catch(e) {
      print(e);
      Get.snackbar('Error', 'Error al leer la tienda');      
    }

    _isLoading.value = false;

  }

  bool validarCampos() {
    RegExp _numeric = RegExp('\d{2}\d{8}');
    bool valor = true;
    _errorNombre.value = '';
    _errorTelefono.value = '';
    if( nombre.length <=1 ) {
      valor = false;
      _errorNombre.value = 'La longitud del nombre debe ser mayor a 1';
    }
    if( telefono.length <=9 ) {
      valor = false;
      _errorTelefono.value = 'El cel no puede tener menos de 10 digitos';
    }
    if( _numeric.hasMatch(telefono) ) {
      valor = false;
      _errorTelefono.value = 'Debe poner un cel valido';
    }
    return valor;
  }
  

  cargarCategoriasTienda() {

    if( miTienda.categories != null ) {
      for( var idTienda in miTienda.categories){
        CategoriaModel cat = categorias.firstWhere((element) => element.id == idTienda );

        if( cat != null ) {
          categoriasTienda.add( cat );
        }
      }
    }

  }

  void grabarFoto() async {

    _cargandoFoto.value = true;

    try {

      String foto = await _repository.subirImagen( fileImagen, miTienda.id );     
      miTienda.img = foto;
      miTienda = await _repository.updateTienda(miTienda);     
      _miTienda.refresh(); 
    } catch (e) {
      Get.snackbar('Error', 'Error al subir imagen');
    }

    _cargandoFoto.value = false;

  }
  
  void crearTienda() async {
    //if( miTienda.nombre != null) _hayTienda.value = true;

    miTienda.categories = [];


    for( var cat in categoriasTienda) {
      miTienda.categories.add(cat.id);
    }

    miTienda.usuario = Get.find<UserService>().user.id;

    _guardando.value = true;
    try {
      miTienda = await _repository.createTienda(miTienda);
      
    }catch(e) {
      Get.snackbar('Error', 'Error al crear la tienda');
    }
    _guardando.value = false;
    if( miTienda.nombre != null) _hayTienda.value = true;

  }

  void updateTienda() async {
    if( !validarCampos() ) {
      Get.snackbar('Error', 'El nombre o el Telefono tienen errores');
    }

    miTienda.categories = [];
    for( var cat in categoriasTienda) {
      miTienda.categories.add(cat.id);
    }

    _guardando.value = true;
    try {
      await _repository.updateTienda(miTienda);
    }catch(e) {
      Get.snackbar('Error', 'Error al actualizar la tienda');
    }
    _guardando.value = false;

  }
}