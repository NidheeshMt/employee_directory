import 'package:employee_directory/model/models.dart';
import 'package:employee_directory/redux/app_redux.dart';
import 'package:flutter/foundation.dart';

@immutable
class EmployeeState {
  final List<EmployeeModel> employees;
  final LoadingModel loadingStatus;

  const EmployeeState({required this.employees, required this.loadingStatus});

  EmployeeState copyWith({
    List<EmployeeModel>? employees,
    LoadingModel? loadingStatus,
  }) {
    return EmployeeState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      employees: employees ?? this.employees,
    );
  }

  factory EmployeeState.initial() {
    return EmployeeState(
      employees: const [],
      loadingStatus: LoadingModel.initial(),
    );
  }
}
