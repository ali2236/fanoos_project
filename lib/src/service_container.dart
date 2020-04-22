import 'package:fanoos_project/src/app_service.dart';

class ServiceContainer {
  Map<Type, AppService> _services;
  final Set<AppService> services;

  ServiceContainer(this.services) {
    _services = Map.fromIterable(
      services,
      key: (service) => service.runtimeType,
      value: (service) => service,
    );
  }

  T get<T extends AppService>() {
    final service = _services[T];
    if (service == null) {
      throw "service of type $T is not registered in this service container";
    }
    return service;
  }

  Future<void> initAll() {
    return Future.forEach<AppService>(
      _services.values,
      (service) => service.init(this),
    );
  }
}
