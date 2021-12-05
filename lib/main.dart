import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:todo_app_mobx/src/modules/todo/todo.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(HiveTodoAdapterAdapter());
  Hive.registerAdapter(HiveTodoListAdapterAdapter());

  var datasource = await HiveTodoDatasource.createDatasource();

  // runApp();
}
