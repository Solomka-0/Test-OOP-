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
    'authorName' : authorsName,
    'authorFirstName' : authorsFirstName,
    'description' : description
  };

  static Book fromJson(Map<String, dynamic> map) =>
      Book(map['title'],
          map['authorName'],
          map['authorFirstName'],
          map['description']);
}

class IsolatesMessage<T> {
  final SendPort sender;
  final T message;
  IsolatesMessage({required this.sender, required this.message});
}

late SendPort isolateSendPort;
late Isolate isolate;

Future<void> createFileIsolate() async {
  var receivePort = ReceivePort();
  isolate = await Isolate.spawn(
    IsolateFileFunction,
    receivePort.sendPort,
  );
  isolateSendPort = await receivePort.first;
}

void IsolateFileFunction(SendPort sendPort){
  List<Book> books = [
    Book('Мастер и маргарита', 'Михаил', 'Булгаков', '''Роман Михаила Афанасьевича Булгакова, работа над которым началась в декабре 1928 года и продолжалась вплоть до смерти писателя. 
  Роман относится к незавершённым произведениям; редактирование и сведение воедино черновых записей осуществляла после смерти мужа вдова писателя - Елена Сергеевна. 
  Первая версия романа, имевшая названия «Копыто инженера», «Чёрный маг» и другие, была уничтожена Булгаковым в 1930 году. 
  В последующих редакциях среди героев произведения появились автор романа о Понтии Пилате и его возлюбленная. 
  Окончательное название - «Мастер и Маргарита» - оформилось в 1937 году.'''),
    Book('1984', 'Джордж', 'Оруэлл', 'Роман-антиутопия Джорджа Оруэлла, изданный в 1949 году. Как отмечает членкор РАН М. Ф. Черныш, это самое главное и последнее произведение писателя.'),
    Book('451 градус по Фаренгейту', 'Рей', 'Брэдберри', 'Научно-фантастический роман-антиутопия Рэя Брэдбери, изданный в 1953 году. Роман описывает американское общество близкого будущего, в котором \nкниги находятся под запретом; «пожарные», к числу которых принадлежит и главный герой Гай Монтэг, сжигают')
  ];
  var receivePort = ReceivePort();
  var myFile = File('books.json');

  void writeFile() {
    var encoder = JsonEncoder.withIndent(' ');
    myFile.writeAsStringSync(encoder.convert(books));
  }

  void readFile() {
    List<Book> receiveBooks = [];
    var a = json.decode(myFile.readAsStringSync());
    for (Map<String, dynamic> map in a) { receiveBooks.add(Book.fromJson(map)); }
    print(receiveBooks);
  }

  writeFile();
  readFile();

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
  await createFileIsolate();
  print('Next');
}

List<int> getFibonacci(int number) {
  List<int> fibonacciList = [0, 1];
  while (fibonacciList.length < number)
    fibonacciList.add(fibonacciList[fibonacciList.length - 2] + fibonacciList[fibonacciList.length - 1]);

  return fibonacciList;
}

void fibonacciNumbers() async {
  var list = await getFibonacci(40);
  print("Асинхронная функция:\n$list");
}

Future<void> createIsolate() async {
  var receivePort = ReceivePort();
  isolate = await Isolate.spawn(
    IsolateFunction,
    receivePort.sendPort,
  );
  isolateSendPort = await receivePort.first;
}

void IsolateFunction(SendPort sendPort) {
  var receivePort = ReceivePort();

  var list = getFibonacci(40);
  print("Изолят:\n$list");

  sendPort.send(receivePort.sendPort);
}

void main() async{
  var recievePort = ReceivePort();
  print('start');
  fibonacciNumbers();
  createIsolate();
  print('end');
}