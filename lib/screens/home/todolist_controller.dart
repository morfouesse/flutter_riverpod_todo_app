import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/models/todo.dart';
import 'package:flutter_riverpod_todo_app/repositories/todo_repository.dart';

/// on crée un provider qui permetra de lire dans l'UI une liste de todo
final FutureProvider<List<Todo>?> todoListControllerProvider =
    FutureProvider((ref) {
  /// on obtient la valeur (instance de TodoRepository)
  /// grace à ref. Watch permet de voir en direct
  /// une nouvelle valeur qui arrive depuis un provider,
  /// ce qui fait qu'on aura forcement la derniere valeur recu.
  ///
  /// c'est donc le meilleur moyen de lire un provider, meme
  /// si un provider est tout aussi immutable.
  /// immutable = après qu'une variable est initialisé
  /// elle ne changera jms
  final TodoRepository todoRepository = ref.watch(todoRepositoryProvider);

  /// on récupere la liste des todos en tant réel grace à watch
  return todoRepository.todoList();
});

/// on crée un provider qui permetra de lire dans l'UI un ajout de todo
/// ou une suppression
final Provider<TodolistController> handleTodoControllerProvider =
    Provider((ref) {
  final TodoRepository todoRepository = ref.watch(todoRepositoryProvider);
  return TodolistController(ref: ref, todoRepository: todoRepository);
});

class TodolistController {
  final ProviderRef ref;
  final TodoRepository todoRepository;

  TodolistController({required this.ref, required this.todoRepository});

  void addTodo(String title, String description, String date) {
    todoRepository.addTodo(title, description, date);
    ref.refresh(todoListControllerProvider);
  }

  void removeTodo(String id) {
    todoRepository.removeTodo(id);
    ref.refresh(todoListControllerProvider);
  }
}
