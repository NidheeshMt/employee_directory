import 'dart:convert';
import 'dart:io';

import 'package:employee_directory/constants/app_constants.dart';
import 'package:employee_directory/model/employee_model.dart';
import 'package:http/http.dart' as http;

import 'app_exceptions.dart';

typedef OnSuccess<T> = Function(T);
typedef OnFailure = Function(AppException);

class EmployeeService {
  void saveToDb(List<EmployeeModel> employees) {
    // DatabaseHelper helper = DatabaseHelper();
    // helper.db
  }

  void fetchEmployees({
    required OnFailure onException,
    required OnSuccess<List<EmployeeModel>> onSuccess,
  }) async {
    String service;
    Map<String, dynamic> params = {};

    String url = AppConstants.baseUrl + "?";

    String formBody = "";
    params.forEach((key, value) => {
          formBody +=
              key + '=' + Uri.encodeQueryComponent(value.toString()) + '&'
        });

    final headers = {
      HttpHeaders.contentTypeHeader: "application/json; charset=UTF-8",
    };

    // try {
    final response = await http.get(
      Uri.parse(url + formBody),
      headers: headers,
    );
    print("request : $url$formBody");

    var result = _parseResponse(response);
    if (result is AppException) {
      onException(result);
    } else {
      if (result is List) {
        var employees = result.map((e) => EmployeeModel.fromJson(e)).toList();
        onSuccess(employees);
      } else {
        onException(FetchDataException('Error caused on our side'));
      }
    }
    // } on SocketException {
    //   onException(FetchDataException('No Internet connection'));
    // } catch (e) {
    //   onException(FetchDataException(e.toString()));
    // }
  }

  dynamic _parseResponse(http.Response response) {
    print("response ${response.body}");

    switch (response.statusCode) {
      case 200:
        // try {
        return json.decode(response.body.toString());
        // } catch (e) {
        //   throw FetchDataException(
        //       'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
        // }
        break;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
