import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController todosController = TextEditingController();

  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                        todos.add(text);
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
                    for(String todo in todos)
                    ListTile(
                      title: Text(todo),
                      onTap: (){
                        print('tarefa: $todo');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text('Você possui 0 tarefas pendentes'),
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
    );
  }
}
