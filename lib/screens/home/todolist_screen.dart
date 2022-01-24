import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/models/todo.dart';
import 'package:flutter_riverpod_todo_app/screens/home/todolist_controller.dart';

class Todolist extends ConsumerWidget {
  const Todolist({Key? key}) : super(key: key);

  /// ajoute une todo
  addTodo(WidgetRef ref, String title, String description, String date) {
    /// on lit une donnée dans le provider sans l'écouter
    ref.read(handleTodoControllerProvider).addTodo(title, description, date);
  }

   removeTodo(WidgetRef ref, String id) {
    /// on lit une donnée dans le provider sans l'écouter
    ref.read(handleTodoControllerProvider).removeTodo(id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entries Management'),
      ),
      /// on affiche en temps réel les changements sur la liste des todo
      /// en utilisant when pour avoir acces à ces différentes options
      body: ref.watch(todoListControllerProvider).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, trace) => Center(child: Text(error.toString())),
            data: (data) => ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                if (data?[index] != null) {
                  final Todo todo = data![index];

                  return ListTile(
                    title: Text(
                      todo.title,
                    ),
                    subtitle: Text(
                      '${todo.description}\n${todo.date}',
                      
                    ),
                    onTap: () => removeTodo(ref, todo.idTodo),
                  );
                }

                return Text('erreur du serveur');
              },
              
            ),
          ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => addTodo(ref, "title3", "desc3", "02/06/2021"),
      ),
    );
  }
}
