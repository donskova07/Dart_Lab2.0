// import '../lib/todo.dart';
// void main(){
//   Todo task1 = Todo(id: 1, title:'купить продукты',);
//   Todo task2 = Todo(id: 2, title:'сделать зарядку',);
//   task1.complete();
//   print(task1);
//   print(task2);
 
// }

import 'dart:io';
import 'package:lab2_todo/todo.dart';
import 'package:ansicolor/ansicolor.dart';

final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen redPen = AnsiPen()..red();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen yellowPen = AnsiPen()..yellow();

void printMenu() {
  print('');
  print(yellowPen(('ToDo список')));
  print('add  - добавить задачу');
  print('list - показать все задачи');
  print('done - отменять выполненной');
  print('delete - удалить задачу');
  print('exit - выйти');
}
void addTodo(List<Todo> todos) {
  stdout.write('Название задачи: ');
  String? input = stdin.readLineSync();
  if (input == null || input.trim().isEmpty) {
    print(redPen(('Ошибка: название не может быть пустым')));
    return;
  }
  // int newId = todos.isEmpty ? 1 : todos.last.id + 1;
  todos.add(Todo(title: input.trim()));
  print(bluePen(('задача добавлена!')));
}
void listTodos(List<Todo> todos) {
  if (todos.isEmpty) {
    print(blackPen(('Список задач пуст')));
    return;
  }
  print('');
  for (var todo in todos) {
    print(todo);
  }
}
void completeTodo(List<Todo> todos) {
  stdout.write('ID задачи: ');
  String? input = stdin.readLineSync();
  if (input == null) return;
  int? id = int.tryParse(input.trim());
  if (id == null) {
    print(greenPen(('Ошибка: введите число')));
    return;
  }

  for (var todo in todos) {
    if (todo.id == id) {
      todo.complete();
      print(yellowPen(('Задача отмечена выполненной!')));
      return;
    }
  }
  print(pinkPen(('задача с ID $id не найдена')));
}
void deleteTodo(List<Todo> todos) {
  stdout.write('ID задачи: ');
  String? input = stdin.readLineSync();
  if (input == null) return;
  int? id = int.tryParse(input.trim());
  if (id == null) {
    print('Ошибка: введите число');
    return;
  }
  for (int i = 0; i < todos.length; i++){
    if (todos[i].id == id){
      todos.removeAt(i);
      print('задача удалена!');
      return;
    }
  }
  print('задача с ID $id не найдена');
}
void main() {
  List<Todo> todos = [];
  printMenu();

  while (true) {
    stdout.write('> ');
    String? input = stdin.readLineSync();
    if (input == null) continue;
    String command = input.trim().toLowerCase();
    if (command.isEmpty) continue;
    switch (command) {
      case 'add': addTodo(todos); break;
      case 'list': listTodos(todos); break;
      case 'done': completeTodo(todos); break;
      case 'delete': deleteTodo (todos); break;
      case 'exit': print(orangePen(('До свидания!'))); return;
      default: printMenu(); print(bluePen(('Неизвестная команда.')));
    }
  }
}

