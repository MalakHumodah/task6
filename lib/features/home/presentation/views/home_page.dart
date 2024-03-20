import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task6/features/home/presentation/bloc/home_bloc.dart';
import 'package:task6/features/home/presentation/bloc/home_state.dart';
import '../widgets/home_view_success.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state.homeStatus == HomeStatus.loading) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return HomeViewSuccess();
      }
    });
  }
}
