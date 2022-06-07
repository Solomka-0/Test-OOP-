class WordFinder {
  String str;

  WordFinder(this.str);

  bool findWord(String word) {
    if (str.indexOf(word) != -1) {
      return true;
    } else {
      throw WordFinderException();
    }
  }
}

class WordFinderException implements Exception {
  String toString() => 'WordFinderException';
}