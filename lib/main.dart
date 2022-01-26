import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kriya_test/core/services/product_service.dart';
import 'package:kriya_test/core/viewmodels/views/product_viewmodel.dart';
import 'package:kriya_test/service_locator.dart';
import 'package:kriya_test/ui/kriya_router.dart';
import 'package:kriya_test/ui/shared/shared_color.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductViewModel>(
            create: (_) =>
                ProductViewModel(productService: locator<ProductService>()))
      ],
      child: MaterialApp(
        locale: Locale('id'),
        title: 'Kriya Test',
        theme: ThemeData(
          primaryColor: SharedColors.primaryColor,
          accentColor: SharedColors.accentColor,
          appBarTheme: const AppBarTheme(
            brightness: Brightness.light,
            color: SharedColors.primaryColor,
            elevation: 0
          )
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutePaths.product,
        onGenerateRoute: KriyaRouter.generateRoute,
      ),
    );
  }
}
