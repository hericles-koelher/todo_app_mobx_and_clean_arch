import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_mobx/src/modules/todo/infra/datasources/todo_datasource.dart';
import 'package:todo_app_mobx/src/modules/todo/todo.dart';

class TodoAppMobx extends StatefulWidget {
  const TodoAppMobx({Key? key}) : super(key: key);

  @override
  _TodoAppMobxState createState() => _TodoAppMobxState();
}

class _TodoAppMobxState extends State<TodoAppMobx> {
  late final ITodoDatasource datasource;
  bool ready = false;

  @override
  void initState() {
    super.initState();

    HiveTodoDatasource.createDatasource().then((value) {
      setState(() {
        datasource = value;
        ready = true;
      });
    });
  }

  @override
  void dispose() {
    datasource.close().whenComplete(() => debugPrint("Fechou o datasource"));

    super.dispose();
    debugPrint("Fez o dispose");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TodoX",
      debugShowCheckedModeBanner: false,
      home: ready
          ? Provider<ITodoDatasource>.value(
              value: datasource,
              child: const TodoScreen(),
            )
          : const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
