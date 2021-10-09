import 'package:flutter/widgets.dart';


typedef Json = Map<String, dynamic>;

typedef AppValueGetter<T> = Future<T?> Function();


typedef AppWidgetBuilder<T> = Widget Function(BuildContext context,T data);

