import 'package:flutter/material.dart';

import 'dynamic_widget.dart';

///
/// The Interchangeable state for [DynamicWidget]
///
abstract class DynamicLayout<T extends DynamicWidget> extends State<T> {
  ///
  /// the Identifier for this layout.
  /// this is used in searching for the selected layout.
  ///
  String get id;

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(other) {
    if (other == null) return false;
    if (other is DynamicLayout) {
      return id == other.id;
    } else {
      return false;
    }
  }
}
