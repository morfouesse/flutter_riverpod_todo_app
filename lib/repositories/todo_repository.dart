import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/constants/constants.dart';
import 'package:flutter_riverpod_todo_app/models/todo.dart';

/// on va lire l'objet TodoRepository
/// immutable = après qu'une variable est initialisé
/// elle ne changera jms
final todoRepositoryProvider = Provider((_) => TodoRepository());

/// Pour tout ce qui touche aux données en BDD
class TodoRepository {
  static final CollectionReference<Map<String, dynamic>> _todoListCollection =
      FirebaseFirestore.instance.collection(todoCollection);

  Future<bool> addTodo(String title, String description, String date) async {
    try {
      await _todoListCollection.add({
        'title': title,
        'description': description,
        'date': date,
      }).then((value) => value.id);

      return true;
    } on FirebaseFirestore catch (e) {
      if (kDebugMode) {
        print('ERREUR todoRepository : ' + e.toString());
      }
      return false;
    }
  }

  Future<bool> removeTodo(String id) async {
    try {
      await _todoListCollection.doc(id).delete();

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
