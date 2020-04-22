import 'package:fanoos_project/src/app_service.dart';

class ServiceContainer {
  final Map<Type, AppService> _services;
  List<AppService> get services => _services.values.toList(growable: false);

  ServiceContainer(Map<Type, AppService> services)
      : assert(services != null),
        _services = services;

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
          (service) => service.init(),
    );
  }
}
