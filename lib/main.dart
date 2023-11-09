import 'package:employee_project/di/injector.dart';
import 'package:employee_project/presentation/detail/detail-bloc/detail_bloc.dart';
import 'package:employee_project/presentation/detail/detail_screen.dart';
import 'package:employee_project/presentation/home/home-bloc/home_bloc.dart';
import 'package:employee_project/presentation/home/home_screen.dart';
import 'package:employee_project/utils/key/navigator_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  setup();
  runApp(const MyEmployee());
  // runApp(
  //   const ProviderScope(
  //     child: MyEmployee(),
  //   ),
  // );
}

class MyEmployee extends StatelessWidget {
  const MyEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => DetailBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Employee",
        navigatorKey: navigatorKey,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          DetailScreen.routeName: (context) => const DetailScreen(),
        },
      ),
    );
  }
}
