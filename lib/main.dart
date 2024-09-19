import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/di/injection.dart';
import 'logic/bloc/product_bloc.dart';
import 'logic/bloc/product_event.dart';
import 'presentation/screens/product_list_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getIt<ProductBloc>()..add(ProductLoadEvent()),
        child: const ProductListScreen(),
      ),
    );
  }
}
