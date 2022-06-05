class GCDFinder {
  static int findGCD(int a, int b) {
    int b1;

    do {
      b1 = a % b;
      a = b;
      b = b1;
    } while (b1 > 0);

    return a;
  }
}