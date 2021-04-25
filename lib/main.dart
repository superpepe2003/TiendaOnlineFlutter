import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/loginregister_binding.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/loginregister_view.dart';
import 'package:tienda_online_flutter/app/modules/root/root.dart';
import 'package:tienda_online_flutter/app/routes/app_routes.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';
import 'package:tienda_online_flutter/app/utils/dependency_injection.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //initialBinding: DependencyInjection.init,
      debugShowCheckedModeBanner: false,
      //initialBinding: BindingsBuilder(() => LoginregisterBinding()),
      title: 'Tienda Online',
      theme: miTema(),
      initialRoute: AppRoutes.LOGINREGISTER, //RootPage(),
      getPages: AppPages.pages,
    );
  }
}
