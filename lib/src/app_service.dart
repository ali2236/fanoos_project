import 'package:fanoos_project/fanoos_project.dart';
import 'package:scoped_model/scoped_model.dart';

abstract class AppService extends Model {

  bool get isSupported => true;
  Future<void> run(ServiceContainer services);

}