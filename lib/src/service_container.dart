import 'package:fanoos_project/src/app_service.dart';

class ServiceContainer {
  Map<Type, AppService> _services;

  ServiceContainer(Set<AppService> services) {
    _services = Map.fromIterable(
      services,
      key: (service) => service.runtimeType,
      value: (service) => service,
    );
  }

  Iterable<AppService> get services => _services.values;

  T get<T extends AppService>() {
    final service = _services[T];
    if (service == null) {
      throw "service of type $T is not registered in this service container";
    }
    return service;
  }

  Future<void> runAll() {
    return Future.forEach<AppService>(
      _services.values,
      (service) async {
        if (service.isSupported) {
          await service.run(this);
        }
      },
    );
  }
}
