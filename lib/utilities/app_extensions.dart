import 'package:employee_directory/utilities/app_generics.dart';
import 'package:flutter/material.dart';


extension JsonExtensions on Json {
  String? getString(String key) {
    // try {
      return containsKey(key) && this[key] != null
          ? this[key].toString()
          : null;
    // } catch (e) {
    //   print("error in string parser $key : ${e.toString()}");
    //   return null;
    // }
  }

  int? getInt(String key) {
    try {
      return containsKey(key) && this[key] != null
          ? int.parse(this[key].toString())
          : null;
    } catch (e) {
      print("error in int parser $key : ${e.toString()}");
      return null;
    }
  }

  double? getDouble(String key) {
    try {
      return containsKey(key) && this[key] != null
          ? double.parse(this[key].toString())
          : null;
    } catch (e) {
      print("error in double parser $key : ${e.toString()}");
      return null;
    }
  }

  Json getObject(String key) {
    // try {
      return containsKey(key) && this[key] != null && this[key] is Json
          ? this[key]
          : null;
    // } catch (e) {
    //   print("error in Json parser $key : ${e.toString()}");
    //   return {};
    // }
  }

  List getList(String key) {
    try {
      return containsKey(key) && this[key] != null && this[key] is List
          ? this[key] as List
          : [];
    } catch (e) {
      print("error in list parser $key : ${e.toString()}");
      return [];
    }
  }

  bool getBool(String key) {
    try {
      return containsKey(key) && this[key] != null ? this[key] as bool : false;
    } on TypeError {
      return getString(key) == "true";
    } catch (e) {
      print("error in boolean parser $key : ${e.toString()}");
      return false;
    }
  }

  void putIfValueNotNull({String? key, dynamic value}) {
    if (key != null && value != null) putIfAbsent(key, () => value);
  }
}

extension TimeOfDayExtensions on TimeOfDay {
  static TimeOfDay? parse(String? s) {
    if (s == null) return TimeOfDay.now();
    TimeOfDay _time;
    List<String> splits = s.split(" ");
    int hour = int.parse(splits[0].split(":")[0]);
    int minute = int.parse(splits[0].split(":")[1]);

    if (splits[1].toLowerCase() == "am") {
      _time = TimeOfDay(hour: hour, minute: minute);
    } else
      _time = TimeOfDay(hour: hour + 12, minute: minute);
    return _time;
  }
}

extension StringExtensions on String {}

extension ListExtensions<E> on Iterable<E> {
  E? firstIfNotEmpty({VoidCallback? onEmpty}) {
    if (isNotEmpty)
      return first;
    else
      onEmpty?.call();
  }
}
