import 'package:fanoos_project/src/service.dart';

class ServiceContainer {
  final Map<Type, Service> _services;
  List<Service> get services => _services.values.toList(growable: false);

  ServiceContainer(Map<Type, Service> services)
      : assert(services != null),
        _services = services;

  T get<T extends Service>() {
    final service = _services[T];
    if (service == null) {
      throw "service of type $T is not registered in this service container";
    }
    return service;
  }

  Future<void> initAll() {
    return Future.forEach<Service>(
      _services.values,
          (service) => service.init(),
    );
  }
}
