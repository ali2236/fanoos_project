import 'package:fanoos_project/src/app_service.dart';
import 'package:fanoos_project/src/service_container.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Services extends InheritedModel<AppService> {

  final ServiceContainer container;
  //_ServiceType _activeType;
  //_Pointer _changedType;

  Services({
    @required this.container,
    @required Widget child,
  }): assert(child != null),
        super(child: child);

  static Services of<S extends AppService>(BuildContext context){
    var services = InheritedModel.inheritFrom<Services>(context, aspect: S);
    //services._activeType = _ServiceType<S>();
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

  @override
  bool updateShouldNotifyDependent(InheritedModel<AppService> oldWidget, Set<AppService> dependencies) {
    return false;
  }
}
/*
class _ServiceType<T extends AppService>{
  bool check(AppService other) => other is T;
}

class _Pointer<T extends AppService>{
  final AppService service;
  _Pointer(this.service);

  bool check(AppService other) => other is T;
  @override
  bool operator ==(other) {
    return service == other;
  }
}*/
