import 'package:employee_directory/model/models.dart';
import 'package:employee_directory/redux/app_redux.dart';
import 'package:flutter/foundation.dart';

@immutable
class EmployeeState {
  final List<EmployeeModel> employees;
  final LoadingModel loadingStatus;
  final String queryString;

  const EmployeeState({
    required this.employees,
    required this.loadingStatus,
    required this.queryString,
  });

  EmployeeState copyWith({
    List<EmployeeModel>? employees,
    LoadingModel? loadingStatus,
    String? searchQuery,
  }) {
    return EmployeeState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      employees: employees ?? this.employees,
      queryString: searchQuery ?? queryString
    );
  }

  factory EmployeeState.initial() {
    return EmployeeState(
      employees: const [],
      loadingStatus: LoadingModel.initial(),
      queryString: ""
    );
  }
}
