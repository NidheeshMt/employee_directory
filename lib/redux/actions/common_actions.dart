import 'package:employee_directory/redux/models/loading_status.dart';
import 'package:flutter/cupertino.dart';

class OnClearAction {
  final type;

  OnClearAction({this.type});
}

class LoadingAction {
  final type;
  final LoadingStatus status;
  final String message;
  final String? action;
  final VoidCallback? onAction;

  LoadingAction({
    required this.status,
    required this.message,
    this.action,
    this.onAction,
    this.type,
  });
}

