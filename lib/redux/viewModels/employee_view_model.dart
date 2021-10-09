import 'package:employee_directory/model/employee_model.dart';
import 'package:employee_directory/redux/actions/employee_action.dart';
import 'package:employee_directory/redux/app_redux.dart';
import 'package:flutter/cupertino.dart';

class EmployeesViewModel extends BaseViewModel {
  final List<EmployeeModel> employees;
  final VoidCallback fetchEmployees;
  final ValueSetter<String> onSearch;
  final String searchQuery;

  EmployeesViewModel({
    required LoadingModel loadingStatus,
    required this.employees,
    required this.fetchEmployees,
    required this.onSearch,
    required this.searchQuery,
  }) : super(loadingStatus);

  factory EmployeesViewModel.fromStore(Store<AppState> store) {
    var employeeState = store.state.employeeState;
    return EmployeesViewModel(
        loadingStatus: employeeState.loadingStatus,
        searchQuery: employeeState.queryString,
        employees: employeeState.employees.where((element) {
          return element.name.toLowerCase().contains(employeeState.queryString.toLowerCase());
        }).toList(),
        onSearch: (filter) => store.dispatch(SearchForEmployeeAction(filter)),
        fetchEmployees: () =>
            store.dispatch(fetchEmployeesFromNetworkAction()));
  }
}
