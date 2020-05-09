import 'package:fanoos_project/src/app_service.dart';
import 'package:fanoos_project/src/service_container.dart';
import 'package:flutter/material.dart';

class Services extends InheritedWidget {

  final ServiceContainer container;

  Services({
    @required this.container,
    @required Widget child,
  }): assert(child != null),
        super(child: child);

  static Services of<S extends AppService>(BuildContext context){
    var services = context.dependOnInheritedWidgetOfExactType<Services>();
    return services;
  }

  static S get<S extends AppService>(BuildContext context) {
    var services = of<S>(context);
    var _services = services.container.services.whereType<S>();
    if(_services.isEmpty) throw 'no service of type $S found';
    return _services.first;
  }

  static Future<void> run<S extends AppService>(BuildContext context){
    return get<S>(context).run(of<S>(context).container);
  }

  @override
  bool updateShouldNotify(Services old) {
    return false;
  }
}