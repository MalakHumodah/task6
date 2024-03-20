import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:task6/features/home/presentation/bloc/home_bloc.dart';
import 'package:task6/features/home/presentation/views/home_page.dart';

import 'core/constants/keys.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(create: (context) => CartBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldGlobalKey,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          ),
          home: HomePage(),
        ));
  }
}
