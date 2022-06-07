class MySuperException implements Exception{
  String toString() => 'MySuperException';

  static void findException (List list) {
    if (list.contains(4))
      throw MySuperException();
  }
}