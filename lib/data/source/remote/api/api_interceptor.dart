import 'package:employee_project/utils/constant.dart';
import 'package:employee_project/utils/key/navigator_key.dart';
import 'package:employee_project/presentation/widgets-feat/typography/my_typography.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ApiInterceptor {
  final Dio _dio = Dio();

  Dio get dio => _dio;

  ApiInterceptor() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onResponse: (response, handler) => handler.next(response),
        onError: (DioException de, handler) {
          if (de.response!.statusCode == 400) {
            showDialog(
              context: navigatorKey.currentContext!,
              barrierDismissible: false,
              builder: (context) {
                return const AlertDialog(
                  title: MyTypography(
                    title: true,
                    text: gagalMengambilData,
                    mySystem: MySystem.error,
                  ),
                  content: MyTypography(
                    title: false,
                    text: gagal,
                    mySystem: MySystem.error,
                  ),
                  actions: [
                    TextButton(
                      onPressed: null,
                      child: Text("Oke"),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
