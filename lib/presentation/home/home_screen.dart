import 'package:employee_project/presentation/home/home-bloc/home_bloc.dart';
import 'package:employee_project/presentation/home/home-bloc/home_event.dart';
import 'package:employee_project/presentation/home/home-bloc/home_state.dart';
// import 'package:employee_project/presentation/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/color/my_color.dart';
import '../../utils/typography/my_typography.dart';
import '../detail/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late final HomeViewModel homeViewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
      // homeViewModel.getAllEmployee();
      context.read<HomeBloc>().add(ReadEmployee());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Karyawan"),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       homeViewModel.getAllEmployee();
        //     },
        //     icon: const Icon(Icons.refresh),
        //   ),
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInitial) {
              return const Text("Andi Stevenli");
            } else if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: MyColor.primaryColor,
                  strokeWidth: 2,
                ),
              );
            } else if (state is HomeLoaded) {
              if (state.employeeListState.isEmpty) {
                return const Center(
                  child: Text("Yah Data nya Kosong Nih"),
                );
              } else {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      tileColor: MyColor.neutral,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      title: MyTypography(
                          title: true,
                          text: state.employeeListState[index].title),
                      subtitle: MyTypography(
                        title: false,
                        text: state.employeeListState[index].body,
                      ),
                      onTap: () => Navigator.pushNamed(
                        context,
                        DetailScreen.routeName,
                        arguments: DetailArguments(
                          id: state.employeeListState[index].id,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 16.0,
                      width: double.infinity,
                    );
                  },
                  itemCount: 100,
                );
              }
            } else {
              return const Center(
                child: Text('Yah gagal ngambil data nih'),
              );
            }
          },
        ),
        // riverpod
        // child: Consumer(
        //   builder: (context, ref, child) => ref.watch(homeProvider).when(
        //         data: (data) {
        //           if (data.isEmpty) {
        //             return const Center(
        //               child: Text("Yah Datanya Kosong Nih :("),
        //             );
        //           } else {
        // return ListView.separated(
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       tileColor: MyColor.neutral,
        //       shape: const RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(
        //           Radius.circular(12),
        //         ),
        //       ),
        //       title: MyTypography(
        //           title: true, text: data[index].title),
        //       subtitle: MyTypography(
        //         title: false,
        //         text: data[index].body,
        //       ),
        //       onTap: () => Navigator.pushNamed(
        //         context,
        //         DetailScreen.routeName,
        //         arguments: DetailArguments(
        //           id: data[index].id,
        //         ),
        //       ),
        //     );
        //   },
        //   separatorBuilder: (context, index) {
        //     return const SizedBox(
        //       height: 16.0,
        //       width: double.infinity,
        //     );
        //   },
        //   itemCount: 100,
        // );
        //           }
        //         },
        //         error: (error, stackTrace) => const Center(
        //           child: Text("Yah Error Nih :("),
        //         ),
        //         loading: () => const Center(
        //           child: CircularProgressIndicator(
        //             color: MyColor.primaryColor,
        //             strokeWidth: 2,
        //           ),
        //         ),
        //       ),
        // ),
        // provider
        // child: Consumer<HomeViewModel>(
        //   builder: (context, homeViewModel, _) {
        //     if (homeViewModel.myState == MyState.loading) {
        // return const Center(
        //   child: CircularProgressIndicator(
        //     color: MyColor.primaryColor,
        //     strokeWidth: 2,
        //   ),
        //       );
        //     } else {
        //       if (homeViewModel.employeeList.isEmpty) {
        //         return const SizedBox(
        //           height: double.infinity,
        //           width: double.infinity,
        //           child: MyTypography(
        //             title: true,
        //             text: "Yah, Datanya Kosong Nih :)",
        //           ),
        //         );
        //       } else {
        // return ListView.separated(
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       tileColor: MyColor.neutral,
        //       shape: const RoundedRectangleBorder(
        //         borderRadius: BorderRadius.all(
        //           Radius.circular(12),
        //         ),
        //       ),
        //       title: MyTypography(
        //           title: true,
        //           text: homeViewModel.employeeList[index].title),
        //       subtitle: MyTypography(
        //         title: false,
        //         text: homeViewModel.employeeList[index].body,
        //       ),
        //       onTap: () => Navigator.pushNamed(
        //         context,
        //         DetailScreen.routeName,
        //         arguments: DetailArguments(
        //           id: homeViewModel.employeeList[index].id,
        //         ),
        //       ),
        //     );
        //   },
        //   separatorBuilder: (context, index) {
        //     return const SizedBox(
        //       height: 16.0,
        //       width: double.infinity,
        //     );
        //   },
        //   itemCount: 100,
        // );
        //       }
        //     }
        //   },
        // ),
      ),
    );
  }
}
