import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/repositories/todo_repository.dart';

final todoListProvider = FutureProvider((ref) {
  final todoRepository = ref.watch(todoRepositoryProvider);
  return todoRepository.todoList();
});

final homeControllerProvider = Provider((ref) {
  final todoRepository = ref.watch(todoRepositoryProvider);
  return HomeController(ref: ref, todoRepository: todoRepository);
});

class HomeController {
  final ProviderRef ref;
  final TodoRepository todoRepository;

  HomeController({required this.ref, required this.todoRepository});

  void addTodo(String title, String description, String date) {
    todoRepository.addTodo(title, description, date);
    ref.refresh(todoListProvider);
  }
}
