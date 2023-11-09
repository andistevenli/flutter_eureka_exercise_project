import 'package:employee_project/presentation/detail/detail-bloc/detail_bloc.dart';
import 'package:employee_project/presentation/detail/detail-bloc/detail_event.dart';
import 'package:employee_project/presentation/detail/detail-bloc/detail_state.dart';
// import 'package:employee_project/presentation/detail/detail_provider.dart';
// import 'package:employee_project/presentation/home/home-bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/color/my_color.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  static const String routeName = '/detail_screen';

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // late final DetailViewModel detailViewModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final args =
          ModalRoute.of(context)!.settings.arguments as DetailArguments;
      // detailViewModel = Provider.of<DetailViewModel>(context, listen: false);
      // detailViewModel.getEmployeeDetail(args.id);
      context.read<DetailBloc>().add(ReadEmployeeDetail(id: args.id));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as DetailArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Karyawan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state is DetailInitial) {
              return const Text("Andi Stevenli");
            } else if (state is DetailLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: MyColor.primaryColor,
                  strokeWidth: 2,
                ),
              );
            } else if (state is DetailLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.employeeModelState.title),
                  const SizedBox(
                    height: 16,
                    width: double.infinity,
                  ),
                  Text(state.employeeModelState.body),
                ],
              );
            } else {
              return const Center(
                child: Text('Yah gagal ngambil data nih'),
              );
            }
          },
        ),
        // child: Consumer(
        //   // riverpod
        //   builder: (context, ref, child) =>
        //       ref.watch(detailProvider(args.id)).when(
        // data: (data) => Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(data.title),
        //     const SizedBox(
        //       height: 16,
        //       width: double.infinity,
        //     ),
        //     Text(data.body),
        //   ],
        // ),
        //             error: (error, stackTrace) => const Center(
        //               child: Text("Yah Error Nih :("),
        //             ),
        //             loading: () => const Center(
        //               child: CircularProgressIndicator(
        //                 color: MyColor.primaryColor,
        //                 strokeWidth: 2,
        //               ),
        //             ),
        //           ),
        //provider
        // child: Consumer<DetailViewModel>(
        //   builder: (context, detailViewModel, _) {
        //     if (detailViewModel.myState == MyState.loading) {
        //       return const Center(
        //         child: CircularProgressIndicator(
        //           color: MyColor.primaryColor,
        //           strokeWidth: 2,
        //         ),
        //       );
        //     } else {
        // return Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(detailViewModel.employeeModel.title),
        //     const SizedBox(
        //       height: 16,
        //       width: double.infinity,
        //     ),
        //     Text(detailViewModel.employeeModel.body),
        //   ],
        // );
        //     }
        //   },
        // ),
      ),
    );
  }
}

class DetailArguments {
  final int id;

  DetailArguments({required this.id});
}
