import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/Todo.dart';

const todoListkey = 'todo_list';

class TodoRepository{
  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getTodoList() async{
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListkey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;

    return jsonDecoded.map((e) => Todo.fromJson(e)).toList();
  }

  void saveTodoList(List<Todo> todos){
    final String jsonString =  json.encode(todos);
    sharedPreferences.setString(todoListkey, jsonString);
  }
}