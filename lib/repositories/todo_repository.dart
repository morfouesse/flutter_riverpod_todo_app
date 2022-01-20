import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/constants/constantes.dart';
import 'package:flutter_riverpod_todo_app/models/todo.dart';

final todoRepositoryProvider = Provider((_) => TodoRepository());

class TodoRepository {
  static final CollectionReference<Map<String, dynamic>> _todoListCollection =
      FirebaseFirestore.instance.collection(todoCollection);

  /// la prestation aura forcément une valeur après qu'il soit crée
  static String _idTodoString = "";

 // final List<Todo> _entries = [];

  Future<bool> addTodo(String title, String description, String date) async {
    try {
      await _todoListCollection.add({
        'title': title,
        'description': description,
        'date': date,
      }).then((value) => _idTodoString = value.id);
     // _entries.add(Todo(_idTodoString, title, description, date));
      return true;
    } on FirebaseFirestore catch (e) {
      if (kDebugMode) {
        print('ERREUR todoRepository : ' + e.toString());
      }
      return false;
    }
  }

  Future<List<Todo>?> todoList() async {
    try {
      return await _todoListCollection.get().then<List<Todo>>((querySnapshot) {
          return querySnapshot.docs.map((queryDocumentSnapshot) {
            Map<String, dynamic> data = queryDocumentSnapshot.data();
            return Todo(
              queryDocumentSnapshot.id,
              data['title'],
              data['description'],
              data['date'],
            );
          }).toList();
      });
    } on FirebaseFirestore catch (e) {
      if (kDebugMode) {
        print('ERREUR benefitService : ' + e.toString());
      }
      return null;
    }
  }
}
