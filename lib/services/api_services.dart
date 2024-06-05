import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_apps/models/catatatan_model.dart';
import 'package:todo_apps/models/task.dart';
import 'package:todo_apps/models/signup_model.dart';
import 'package:todo_apps/models/login_model.dart';

class ApiServices {
  final Dio dio = Dio();
  final String _baseUrl2 = 'https://catatan-445ccfdeac7e.herokuapp.com';
  final String _baseUrl =
      'https://asia-southeast2-peak-equator-402307.cloudfunctions.net';

  Future<LoginResponse?> login(LoginInput login) async {
    try {
      final response = await dio.post(
        '$_baseUrl/Loginn',
        data: login.toJson(),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is Map<String, dynamic>) {
          return LoginResponse.fromJson(responseData);
        } else if (responseData is String) {
          final parsedData = json.decode(responseData);
          return LoginResponse.fromJson(parsedData);
        }

        return null;
      }
      return null;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<SignupResponse?> signup(SignupInput signup) async {
    try {
      final response = await dio.post(
        '$_baseUrl/Signup_note',
        data: signup.toJson(),
      );

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is Map<String, dynamic>) {
          return SignupResponse.fromJson(responseData);
        } else if (responseData is String) {
          final parsedData = json.decode(responseData);
          return SignupResponse.fromJson(parsedData);
        }

        return null;
      }
      return null;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<Iterable<Task>?> getAllCatatan() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString('email') ?? '';
      var response = await dio.get('$_baseUrl2/catatans/$email');

      if (response.statusCode == 200) {
        final catatanList = (response.data['data'] as List)
            .map((catatan) => Task.fromJson(catatan))
            .toList();

        return catatanList;
      }
      return null;
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode != 200) {
        debugPrint(
          'Client error - the request contains bad syntax or cannot be fulfilled',
        );
        return null;
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future postContact(Task input) async {
    try {
      final response =
          await dio.post('$_baseUrl2/insertcatatan', data: input.toJson());
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<Task?> putCatatan(Task task) async {
    try {
      final Dio dio = Dio();

      dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print('Dio Request: ${options.uri}');
          print('Dio Request Headers: ${options.headers}');
          print('Dio Request Data: ${options.data}');

          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> response, ResponseInterceptorHandler handler) {
          print('Dio Response: ${response}');

          if (response.data is Map<String, dynamic> &&
              response.data.containsKey('status') &&
              response.data.containsKey('message')) {
            if (response.data['status'] == 200) {
              print('Data berhasil diupdate: ${response.data['message']}');
              return;
            } else {
              print('Server returned error: ${response.data['message']}');
              return null;
            }
          } else {
            print('Unexpected response format: ${response.data}');
            return null;
          }
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          print('Dio Error: ${error}');
          return handler.next(error);
        },
      ));

      final response = await dio.put(
        '$_baseUrl2/editcatatan/${task.id ?? ""}',
        data: task.toJson(),
      );

      return null;
    } catch (e) {
      print('Error during Dio request: $e');
      rethrow;
    }
  }

  Future<void> putStatusCatatan(int taskId, bool isCompleted) async {
    try {
      int check = isCompleted ? 1 : 0;
      final response = await dio.put(
        '$_baseUrl2/setstatus/$taskId',
        data: {
          'isCompleted': check,
          'completedAt': DateTime.now().toIso8601String()
        },
      );

      if (response.statusCode == 200) {
        print('Data berhasil diupdate: ${response.data['message']}');
      } else {
        print('Gagal mengupdate data: ${response.data['message']}');
      }
    } catch (e) {
      print('Error during Dio request: $e');
    }
  }

  Future<void> deleteCatatan(int id) async {
    try {
      final response = await Dio().delete('$_baseUrl2/deletecatatan/$id');
      if (response.statusCode == 200) {
        return;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      rethrow;
    }
  }
}
