import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_1/cubit/app_cubit.dart';
import 'package:new_app_1/cubit/app_cubit_state.dart';
import 'package:new_app_1/pages/detail_page.dart';
import 'package:new_app_1/pages/navpages/home_page.dart';
import 'package:new_app_1/pages/main_page.dart';
import 'package:new_app_1/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return WelcomePage();
          }
          if (state is LoaddingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadedState) {
            return MainPage();
          }
          if (state is DetailState) {
            return DetailPage();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
