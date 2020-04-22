import 'dart:collection';

import 'package:fanoos_project/src/app_service.dart';
import 'package:fanoos_project/src/service_container.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Services extends StatefulWidget {

  final ServiceContainer container;
  final Widget child;

  const Services({Key key, @required this.container,@required this.child}) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();

  static ServiceContainer getContainer(BuildContext context){
    return context.findAncestorStateOfType<_ServicesState>().widget.container;
  }


  static AppService get<T extends AppService>(BuildContext context,{bool bind}){
    return ScopedModel.of<T>(context, rebuildOnChange: bind);
  }
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return builder(widget.child, Queue.of(widget.container.services));
  }

  Widget builder(Widget child, Queue<Model> models) {
    var model = models.removeLast();
    return ScopedModel(model: model, child: models.isEmpty ? child : builder(child, models));
  }
}