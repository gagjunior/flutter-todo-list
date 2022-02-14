import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/models/Todo.dart';

import '../widgets/todo_list_item.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  final TextEditingController todosController = TextEditingController();

  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicione uma tarefa',
                          hintText: 'Ex.: Estudar para prova',
                        ),
                        controller: todosController,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        String text = todosController.text;
                        setState(() {
                          Todo newTodo = Todo(
                              title: text,
                              dateTime: DateTime.now()
                          );
                          todos.add(newTodo);
                        });
                        todosController.clear();
                      },
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00b4cc),
                        padding: EdgeInsets.all(14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Todo todo in todos)
                       TodoListItem(
                         todo: todo,
                         onDelete: onDelete,
                       ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text('Você possui ${todos.length} tarefas pendentes'),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Limpar tudo'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00b4cc),
                        padding: EdgeInsets.all(14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelete(Todo todo){
    setState(() {
      todos.remove(todo);
    });
  }
}
