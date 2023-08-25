import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wts_test_app/bloc/catalog/catalog_bloc.dart';
import 'package:wts_test_app/bloc/products/products_bloc.dart';
import 'package:wts_test_app/router/app_router.dart';
import 'package:wts_test_app/services/api_client.dart';

Future main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    final dio = Dio();
    final apiClient = ApiClient(dio: dio, appKey: dotenv.env['APP_KEY']!);

    return MultiBlocProvider(
      providers: [
        BlocProvider<CatalogBloc>(
          create: (_) => CatalogBloc(
            apiClient: apiClient,
          )..add(FetchCatalog()),
        ),
        BlocProvider<ProductsBloc>(
          create: (_) => ProductsBloc(
            apiClient: apiClient,
          ),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        ),
        routerConfig: appRouter.goRouter,
      ),
    );
  }
}
