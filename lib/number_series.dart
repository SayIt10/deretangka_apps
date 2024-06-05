class NumberSeries {
  // 1. Deret angka 1 -> N
  List<int> generateSeries(int N) {
    return List<int>.generate(N, (i) => i + 1);
  }

  // 2. Deret angka 1 -> N -> 1
  List<int> generateSeriesReverse(int N) {
    List<int> series = List<int>.generate(N, (i) => i + 1);
    return series + series.reversed.skip(1).toList();
  }

  // 3. Deret angka 1 -> N dengan hasil 10, 21, 32, ...
  List<int> generateSeriesPlus(int N) {
    return List<int>.generate(N, (i) => (i + 1) * 10 + (i + 1));
  }

  // 4. Deret angka 1 -> N dengan kelipatan 5 diganti dengan LIMA dan kelipatan 7 dengan TUJUH
  List<String> generateSeriesWithWords(int N) {
    return List<String>.generate(N, (i) {
      int number = i + 1;
      if (number % 5 == 0) return 'LIMA';
      if (number % 7 == 0) return 'TUJUH';
      return number.toString();
    });
  }
}
