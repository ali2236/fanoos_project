import 'dart:async';

import 'package:fanoos_project/fanoos_project.dart';

abstract class AppService {

  bool get isSupported => true;
  Future<void> run(ServiceContainer services);

}