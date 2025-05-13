import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/core/http/http.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  Get.put(DioClient.create());
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    GetMaterialApp(initialRoute: AppPages.INITIAL, getPages: AppPages.routes),
  );
}
