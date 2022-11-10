import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:patient_display/model/patient_response.dart';

class ApiDataAndEndPoints {
  static const String _baseUrl = 'https://noteapi.popssolutions.net/';
  static String getPersonsUrl = 'users/getall';
  static String getNotesUrl = 'notes/getall';
  static String addNoteUrl = 'notes/insert';
  static String addUserUrl = 'users/insert';

  static String loginUrl = 'api/Login/Login';
  static String getProductsUrl = 'api/Visit/GetProducts';
  static String uploadFileUrl = 'api/Photo/UploadFile';

  // static String loginPathUrl = 'api/Photo/UploadFile';
  // static String homePathUrl = 'home';
  // static String favoritesPathUrl = 'favorites';
  // static String profilePathUrl = 'profile';
  // static String registerPathUrl = 'register';
  // static String updateProfilePathUrl = 'update-profile';
  // static String searchProductsPathUrl = 'products/search';

  static Map<String, dynamic> _headers({
    String lang = 'en',
    String? token,
  }) =>
      {
        'Content-Type': 'application/json',
        'lang': lang,
        'Authorization': token ?? '',
      };
}

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiDataAndEndPoints._baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
      ),
    );
  }

  /*static Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = ApiDataAndEndPoints._headers(
      token: token,
    );

    return await dio.get(
      path,
      queryParameters: query,
    );
  }*/

 /* static Future<Patients> getPatients({
    required String path,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    List<PatientData> response = [
      PatientData(name: "Ali", age: 27),
      PatientData(name: "Amir", age: 28),
      PatientData(name: "Anas", age: 29),
    ];



    return await response;
  }*/




  static Future<Response> postData({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = ApiDataAndEndPoints._headers(
      lang: lang,
      token: token,
    );
    return await dio.post(
      path,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> postData2({
    required String path,
    required dynamic data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = ApiDataAndEndPoints._headers(
      lang: lang,
      token: token,
    );
    return await dio.post(
      path,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = ApiDataAndEndPoints._headers(
      lang: lang,
      token: token,
    );

    return await dio.put(
      path,
      queryParameters: query,
      data: data,
    );
  }

// static Future<Response> postData2({
//   required String path,
//   required dynamic data,
//   Map<String, dynamic>? query,
//   String lang = 'en',
//   String? token,
// }) async {
//   dio.options.headers = ApiDataAndEndPoints._headers(
//     lang: lang,
//     token: token,
//   );
//   return await dio.post(
//     path,
//     queryParameters: query,
//     data: data,
//   );
// }

// Future<String> uploadImage(File file) async {
//   // String fileName = file.path.split('/').last;
//   FormData formData = FormData.fromMap({
//     "file":
//     await MultipartFile.fromFile(file.path, filename:fileName),
//   });
//   response = await dio.post(path, data: formData);
//   return response.data['id'];
// }

}
