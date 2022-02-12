import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

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
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Adicione uma tarefa',
                        hintText: 'Ex.: Estudar para prova',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
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
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    color: Colors.red,
                    height: 50,
                  ),
                  Container(
                    color: Colors.green,
                    height: 50,
                  ),
                ],
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
