import 'package:employee_project/domain/model/employee_model.dart';
import 'package:employee_project/presentation/employee/detail/detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Provider<DetailViewModel> detailViewModel = Provider<DetailViewModel>(
  (ref) => DetailViewModel(),
);

AutoDisposeFutureProviderFamily<EmployeeModel, int> detailProvider =
    FutureProvider.autoDispose.family<EmployeeModel, int>(
  //jika ingin setiap kali provider ga dipake, maka akan dihapus dari memori
  (ref, id) => ref.watch(detailViewModel).getEmployeeDetail(id),
  //sebaliknya, jika ingin provider tetap dipake
  // (ref, id) async {
  //   Future<EmployeeModel> detail =
  //       ref.watch(detailViewModel).getEmployeeDetail(id);
  //   ref.keepAlive();
  //   return detail;
  // },
);
