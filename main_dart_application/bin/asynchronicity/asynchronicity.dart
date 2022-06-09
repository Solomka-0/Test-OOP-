import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

class FileWorker {
  late String fullname;
  String name;
  late File file;

  FileWorker(this.name) {
    fullname = '$name.txt';
    file = File(fullname);
  }

  void writeTo(String str) async => await file.writeAsString(str).then((value) => print('Была сделана запись в файл (ассинхронно)'));

  void readFile() async => await file.readAsString().then((value) => print('\nДанные в файле: \n$value'));

}

class Book {
  String title;
  String authorsName;
  String authorsFirstName;

  String description;

  Book(this.title, this.authorsName, this.authorsFirstName, this.description);

  Map<String, dynamic> toJson() => {
    'title' : title,
    'authorsName' : authorsName,
    'authorFirstName' : authorsFirstName,
    'description' : description
  };
}

class IsolatesMessage<T> {
  final SendPort sender;
  final T message;
  IsolatesMessage({
    required this.sender,
    required this.message,
  });
}
late SendPort isolateSendPort;
late Isolate isolate;
Future<void> createIsolate() async {
  var receivePort = ReceivePort();
  isolate = await Isolate.spawn(
    IsolateFunction,
    receivePort.sendPort,
  );
  isolateSendPort = await receivePort.first;
}

void IsolateFunction(SendPort sendPort){
  var receivePort = ReceivePort();
  List<Book> books = [
    Book('Мастер и маргарита', 'Михаил', 'Булгаков', '''Роман Михаила Афанасьевича Булгакова, работа над которым началась в декабре 1928 года и продолжалась вплоть до смерти писателя. 
  Роман относится к незавершённым произведениям; редактирование и сведение воедино черновых записей осуществляла после смерти мужа вдова писателя - Елена Сергеевна. 
  Первая версия романа, имевшая названия «Копыто инженера», «Чёрный маг» и другие, была уничтожена Булгаковым в 1930 году. 
  В последующих редакциях среди героев произведения появились автор романа о Понтии Пилате и его возлюбленная. 
  Окончательное название - «Мастер и Маргарита» - оформилось в 1937 году.'''),
    Book('1984', 'Джордж', 'Оруэлл', 'Роман-антиутопия Джорджа Оруэлла, изданный в 1949 году. Как отмечает членкор РАН М. Ф. Черныш, это самое главное и последнее произведение писателя.'),
    Book('451 градус по Фаренгейту', 'Рей', 'Брэдберри', 'Научно-фантастический роман-антиутопия Рэя Брэдбери, изданный в 1953 году. Роман описывает американское общество близкого будущего, в котором \nкниги находятся под запретом; «пожарные», к числу которых принадлежит и главный герой Гай Монтэг, сжигают')
  ];
  var myFile = File('books.json');
  var encoder = JsonEncoder.withIndent(' ');
  myFile.writeAsStringSync(encoder.convert(books));
  print(myFile.readAsStringSync());
  sendPort.send(receivePort.sendPort);
}

void task_1_2() {
  var fileWorker = FileWorker('new_file');
  fileWorker.writeTo('str');
  fileWorker.readFile();
  print('Основной поток закончился');
}

void task_3() async {
  print('Main');
  await createIsolate();
  print('Next');
}

void main() {
  task_3();
}