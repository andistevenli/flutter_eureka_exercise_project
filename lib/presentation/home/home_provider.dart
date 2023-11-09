import 'package:employee_project/domain/model/employee_model.dart';
import 'package:employee_project/presentation/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Provider<HomeViewModel> homeViewModel = Provider<HomeViewModel>(
  (ref) => HomeViewModel(),
);

FutureProvider<List<EmployeeModel>> homeProvider =
    FutureProvider<List<EmployeeModel>>(
  (ref) => ref.watch(homeViewModel).getAllEmployee(),
);
