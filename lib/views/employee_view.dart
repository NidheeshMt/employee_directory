import 'package:employee_directory/model/employee_model.dart';
import 'package:employee_directory/redux/actions/common_actions.dart';
import 'package:employee_directory/redux/app_redux.dart';
import 'package:employee_directory/redux/viewModels/employee_view_model.dart';
import 'package:employee_directory/views/partials/loading_mask.dart';
import 'package:flutter/material.dart';

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text("Employee Directory", textAlign: TextAlign.center),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return StoreConnector<AppState, EmployeesViewModel>(
            converter: (store) => EmployeesViewModel.fromStore(store),
            onInitialBuild: (viewModel) => viewModel.fetchEmployees(),
            onWillChange: (old, viewModel) {
              if ((old?.isLoading ?? false) && viewModel.hasError) {
                final snackBar =
                    SnackBar(content: Text(viewModel.loadingError));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            onDispose: (store) => store.dispatch(OnClearAction()),
            builder: (context, viewModel) {
              if (viewModel.isLoading) return const AppLoadingMask();
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: TextField(
                      onChanged: viewModel.onSearch,
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        suffixIcon:  Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RefreshIndicator(
                        onRefresh: () => Future.delayed(
                            Duration.zero, () => viewModel.fetchEmployees()),
                        child: ListView.builder(
                            itemCount: viewModel.employees.length,
                            itemBuilder: (cont, position) {
                              // return Container();
                              return EmployeeTile(
                                employee:
                                    viewModel.employees.elementAt(position),
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class EmployeeTile extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeTile({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ConversationScreen(
        //               name: userName,
        //               profilePicPath: userPicAssetPath,
        //             )
        //     ));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 70.0,
              height: 70.0,
              decoration: BoxDecoration(
                color: const Color(0xff213A50),
                image: DecorationImage(
                  image: NetworkImage(employee.profileImage ?? ""),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(40.0)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          employee.name,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          employee.company?.name ?? "",
                        ),
                        const SizedBox(height: 16),
                        Divider()
                      ],
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.phone))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
