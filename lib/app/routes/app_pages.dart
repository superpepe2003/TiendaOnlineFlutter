import 'package:get/get.dart';

import 'package:tienda_online_flutter/app/modules/categorias/categorias_binding.dart';
import 'package:tienda_online_flutter/app/modules/categorias/categorias_page.dart';
import 'package:tienda_online_flutter/app/modules/categoriastiendas/categoriastiendas_binding.dart';
import 'package:tienda_online_flutter/app/modules/categoriastiendas/categoriastiendas_view.dart';
import 'package:tienda_online_flutter/app/modules/home/home_pages.dart';
import 'package:tienda_online_flutter/app/modules/login/login_binding.dart';
import 'package:tienda_online_flutter/app/modules/login/login_page.dart';
import 'package:tienda_online_flutter/app/modules/miProductos/miproductos.dart';
import 'package:tienda_online_flutter/app/modules/miProductos/miproductos_binding.dart';
import 'package:tienda_online_flutter/app/modules/miTienda/mitienda_binding.dart';
import 'package:tienda_online_flutter/app/modules/miTienda/mitienda_page.dart';
import 'package:tienda_online_flutter/app/modules/perfil/perfil_binding.dart';
import 'package:tienda_online_flutter/app/modules/perfil/perfil_pages.dart';
import 'package:tienda_online_flutter/app/modules/producto/producto_binding.dart';
import 'package:tienda_online_flutter/app/modules/producto/producto_page.dart';
import 'package:tienda_online_flutter/app/modules/register/register_binding.dart';
import 'package:tienda_online_flutter/app/modules/register/register_page.dart';
import 'package:tienda_online_flutter/app/modules/root/root.dart';
import 'package:tienda_online_flutter/app/modules/splahScreen/splash_screen_page.dart';
import 'package:tienda_online_flutter/app/modules/tienda/tienda_binding.dart';
import 'package:tienda_online_flutter/app/modules/tienda/tienda_page.dart';
import 'package:tienda_online_flutter/app/modules/tiendas/tiendas_binding.dart';
import 'package:tienda_online_flutter/app/modules/tiendas/tiendas_page.dart';

import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.HOME, page: () => HomePage()),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.REGISTER,
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
        name: AppRoutes.PERFIL,
        page: () => PerfilPage(),
        binding: PerfilBinding()),
    GetPage(
        name: AppRoutes.TIENDAS,
        page: () => TiendasPage(),
        binding: TiendasBinding()),
    GetPage(
        name: AppRoutes.TIENDA,
        page: () => TiendaPage(),
        binding: TiendaBinding()),
    GetPage(
        name: AppRoutes.PRODUCTO,
        page: () => ProductoPage(),
        binding: ProductoBinding()),
    GetPage(
        name: AppRoutes.MITIENDA,
        page: () => MitiendaPage(),
        binding: MiTiendaBinding()),
    GetPage(
        name: AppRoutes.MIPRODUCTOS,
        page: () => MiProductoPage(),
        binding: MiProductosBinding()),
    GetPage(name: AppRoutes.ROOT, page: () => RootPage()),
    GetPage(name: AppRoutes.SPLASHSCREEN, page: () => SplashScreenPage()),
    GetPage(
      name: AppRoutes.CATEGORIAS,
      page: () => CategoriasPage(),
      binding: CategoriasBinding(),
    ),
    GetPage(
      name: AppRoutes.CATEGORIASTIENDAS,
      page: () => CategoriastiendasView(),
      binding: CategoriastiendasBinding(),
    ),
  ];
}
