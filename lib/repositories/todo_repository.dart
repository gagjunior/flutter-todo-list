import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/Todo.dart';

class TodoRepository{

  TodoRepository(){
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }

  late SharedPreferences sharedPreferences;

  void saveTodoList(List<Todo> todos){
    final String jsonString =  json.encode(todos);
    sharedPreferences.setString('todo_list', jsonString);
    print(jsonString);
  }
}