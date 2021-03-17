import 'package:fanoos_project/src/app_service.dart';

///
/// The object that will hold your [AppService]s.
///
class ServiceContainer {
  late Map<Type, AppService> _services;

  ///
  /// Example:
  /// ```dart
  /// final container = ServiceContainer({
  ///   SettingsService(),
  ///   SchedulerService(),
  ///   ShareService(),
  /// });
  /// ```
  ///
  ServiceContainer(Set<AppService> services) {
    _services = Map.fromIterable(
      services,
      key: (service) => service.runtimeType,
      value: (service) => service,
    );
  }

  ///
  /// Returns all registered Services
  ///
  Iterable<AppService> get services => _services.values;

  ///
  /// Returns the first [AppService] with type [T]
  ///
  /// Example:
  /// ```dart
  /// final settingsService = container.get<SettingsService>();
  /// ```
  ///
  T get<T extends AppService>() {
    final service = _services[T];
    if (service == null) {
      throw "service of type $T is not registered in this service container";
    } else {
      return service as T;
    }
  }

  ///
  /// Runs and waits for all [AppService.run()] calls to complete
  ///
  Future<void> runAll() async {
    return await Future.forEach<AppService>(
      _services.values,
      (service) async {
        if (service.isSupported) {
          await service.run(this);
        }
      },
    ).catchError((error) {
      print('$error');
    });
  }
}
