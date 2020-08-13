import 'package:flutter/material.dart';

import 'dynamic_layout.dart';

abstract class DynamicWidget extends StatefulWidget {

  ///
  /// The Identifier for this Implementation of [DynamicWidget]
  ///
  String get id;

  ///
  /// The Id of the [DynamicLayout] that should be displayed
  ///
  String get selectedLayoutId;

  ///
  ///
  ///
  Set<DynamicLayout> get layouts;

  ///
  /// Optional tag object, if you need to add metadata to your [DynamicWidget]
  ///
  get tag;

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(other) {
    if (other is DynamicWidget) {
      return id == other.id;
    } else {
      return false;
    }
  }

  @override
  State<StatefulWidget> createState() {
    return layouts.firstWhere(
      (layout) => layout.id == selectedLayoutId,
      orElse: () => layouts.first,
    );
  }
}
