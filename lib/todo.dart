class Todo {
  int id;
  String title;
  bool isDone;

  Todo({required this.id, required this.title}) : isDone = false;
  void complete(){
    isDone = true;
  }

  @override 
  String toString() {
    String status = isDone ? '[x]' : '[ ]';
    return '$status $id. $title';
    }
}
// import 'dart:io';
// void main(){
//   stdout.write('что то:');
//   String? input = stdin.readLineSync();
//   print('вы ввели: $input');
// }

 