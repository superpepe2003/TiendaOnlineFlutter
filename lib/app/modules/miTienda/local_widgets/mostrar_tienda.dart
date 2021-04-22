import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tienda_online_flutter/app/global_widgets/menu_principal.dart';
import 'package:tienda_online_flutter/app/modules/miTienda/local_widgets/categoria_seleccion.dart';
import 'package:tienda_online_flutter/app/modules/miTienda/mitienda_controller.dart';
import 'package:tienda_online_flutter/app/routes/app_routes.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import 'boton_guardar_crear.dart';
import 'foto_tienda.dart';

class MostrarTienda extends GetView<MiTiendaController> {
  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Mi Tienda',
          style: TextStyle(
              color: Colors.black, fontFamily: 'Samantha', fontSize: 40),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Obx(() => (controller.hayTienda)
              ? IconButton(
                  icon: FaIcon(FontAwesomeIcons.productHunt),
                  onPressed: () {
                    Get.toNamed(AppRoutes.MIPRODUCTOS,
                        arguments: controller.miTienda.id);
                  },
                )
              : Container())
        ],
      ),
      drawer: MenuPrincipal(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //EMPECE
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            Obx(() => (controller.hayTienda)
                ? SliverToBoxAdapter(child: FotoTienda())
                : SliverToBoxAdapter(
                    child: Container(
                      height: _responsive.hp(30),
                    ),
                  )),
            SliverToBoxAdapter(
              child: Obx(
                () => TextFormField(
                    initialValue: controller.miTienda.nombre,
                    decoration: InputDecoration(
                        hintText: 'Nombre Tienda',
                        errorText: controller.errorNombre,
                        labelText: 'Nombre',
                        icon: Icon(Icons.storefront)),
                    onChanged: (value) {
                      controller.miTienda.nombre = value;
                      controller.nombre = value;
                    }),
              ),
            ),
            SliverToBoxAdapter(
              child: Obx(
                () => TextFormField(
                  initialValue: controller.miTienda.direccion,
                  decoration: InputDecoration(
                      hintText: 'Direccion de la Tienda',
                      labelText: 'Direccion',
                      icon: Icon(Icons.directions)),
                  onChanged: (value) => controller.miTienda.direccion = value,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Obx(
                () => TextFormField(
                    initialValue: controller.miTienda.telefono,
                    decoration: InputDecoration(
                        hintText: 'Telefono de la Tienda',
                        errorText: controller.errorTelefono,
                        labelText: 'Telefono',
                        icon: Icon(Icons.phone)),
                    onChanged: (value) {
                      controller.miTienda.telefono = value;
                      controller.telefono = value;
                    }),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            CategoriasSeleccion(),
            BotonGuardar(),
          ],
        ),
      ),
    );
  }
}
