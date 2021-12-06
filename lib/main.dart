import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:todo_app_mobx/src/modules/todo/todo.dart';
import 'package:todo_app_mobx/todo_app_mobx.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter<HiveTodoObject>(
    HiveTodoObjectAdapter(),
    override: true,
  );

  runApp(
    const TodoAppMobx(),
  );
}
