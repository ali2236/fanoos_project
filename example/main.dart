import 'package:fanoos_project/fanoos_project.dart';
import 'package:flutter/material.dart';

ServiceContainer serviceContainer = ServiceContainer({
  LoggerService(),
});

void main() async {
  await serviceContainer.runAll();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FlatButton(
            onPressed: () {
              Services.get<LoggerService>(context).log('button pressed');
            },
            child: Text('just a normal button'),
          ),
        ),
      ),
    );
  }
}

class LoggerService extends AppService {
  @override
  Future<void> run(ServiceContainer services) async{
    print('Logger service initiated!');
  }

  void log(String s) {
    print(s);
  }
}
