import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/models/todo.dart';
import 'package:flutter_riverpod_todo_app/pages/home/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  addTodo(WidgetRef ref, String title, String description, String date) {
    ref.read(homeControllerProvider).addTodo(title, description, date);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entries Management'),
      ),
      body: ref.watch(todoListProvider).when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, trace) => Center(child: Text(error.toString())),
            data: (data) => ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                if (data?[index] != null) {
                  final Todo todo = data![index];

                  return ListTile(
                    title: Text(
                        todo.title + ' ' + todo.description + '\n' + todo.date),
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
