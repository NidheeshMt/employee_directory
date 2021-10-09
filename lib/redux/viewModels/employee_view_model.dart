import 'package:employee_directory/model/employee_model.dart';
import 'package:employee_directory/redux/actions/employee_action.dart';
import 'package:employee_directory/redux/app_redux.dart';
import 'package:flutter/cupertino.dart';

class EmployeesViewModel extends BaseViewModel {
  final List<EmployeeModel> employees;
  final VoidCallback fetchEmployees;
  final ValueSetter<String> onSearch;

  EmployeesViewModel({
    required LoadingModel loadingStatus,
    required this.employees,
    required this.fetchEmployees,
    required this.onSearch,
  }) : super(loadingStatus);

  factory EmployeesViewModel.fromStore(Store<AppState> store) {
    var employeeState = store.state.employeeState;
    return EmployeesViewModel(
        loadingStatus: employeeState.loadingStatus,
        employees: employeeState.employees,
        onSearch: (filter) => store.dispatch(SearchForEmployeeAction(filter)),
        fetchEmployees: () =>  store.dispatch(fetchEmployeesFromNetworkAction()));
  }
}


