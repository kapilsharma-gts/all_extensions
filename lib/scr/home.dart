import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Timer? debouncer;
const String ass = "assest/";
void debounce(
  VoidCallback callback, {
  Duration duration = const Duration(milliseconds: 500),
}) {
  if (debouncer != null) {
    debouncer!.cancel();
  }
  debouncer = Timer(duration, callback);
}

extension GetFlag on String {
  bool parseBool() {
    return toLowerCase() == 'true';
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
  String tocapitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension Unique<E, Id> on List<E> {
  List<E> unique([Id Function(E element)? id, bool inplace = true]) {
    final ids = <dynamic>{};
    var list = inplace ? this : List<E>.from(this);
    list.retainWhere((x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }
}

extension NumDurationExtensions on num {
  Duration get microseconds => Duration(microseconds: round());
  Duration get milliseconds => Duration(microseconds: (this * 1000).round());
  Duration get seconds => Duration(microseconds: (this * 1000 * 1000).round());
  Duration get minutes =>
      Duration(microseconds: (this * 1000 * 1000 * 60).round());
  Duration get hours =>
      Duration(microseconds: (this * 1000 * 1000 * 60 * 60).round());
  Duration get days =>
      Duration(microseconds: (this * 1000 * 1000 * 60 * 60 * 24).round());
  Duration get ms => milliseconds;
}

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}

extension ExtendedString on String {
  /// The string without any whitespace.
  String removeAllWhitespace() {
    // Remove all white space.
    return replaceAll(RegExp(r"\s+"), "");
  }
}

Future<String> getFileData(String path) async {
  return await rootBundle.loadString(path);
}

extension EmptyPadding on num {
  SizedBox get h => SizedBox(
        height: toDouble(),
      );
  SizedBox get w => SizedBox(
        width: toDouble(),
      );
}
