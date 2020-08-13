import 'dart:async';

import 'package:fanoos_project/fanoos_project.dart';
///
/// [fanoos_project]'s Singleton blocks
///
/// Example:
/// ```dart
/// class LogService extends AppService {
///
///   Future<void> run(services) async{
///     print('run from printService called');
///   }
///
///   void log(String s){
///     print(s);
///   }
///
/// }
/// ```
///
abstract class AppService {

  ///
  /// This can control if the [run] function is called.
  /// If your [AppService] doesn't support all environments,
  /// this can be really useful.
  ///
  /// Example:
  /// ```dart
  ///
  /// bool get isSupported => Platform.isAndroid;
  ///
  /// ```
  ///
  bool get isSupported => true;


  Future<void> run(ServiceContainer services);
}