import 'package:flutter/material.dart';
import 'Clauns.dart';

class ClaunsModel extends ChangeNotifier {
  var claunses = [
    Clauns(clue: 'you do this to a fly', answer: 'swat', date: DateTime.now()),
    Clauns(
        clue: 'a toilet that is detached from the house',
        answer: 'outhouse',
        date: DateTime.now()),
    Clauns(
        clue: 'what is the star in mario cart',
        answer: 'swift',
        date: DateTime.now()),
    Clauns(
        clue: 'a worker at a bank that gives you your balance',
        answer: 'teller',
        date: DateTime.now()),
    Clauns(
        clue: 'buildings used to guide ships',
        answer: 'lighthouse',
        date: DateTime.now()),
  ];

  void addClauns({required String clue, required String answer}) {
    var claunsToAdd = Clauns(clue: clue, answer: answer, date: DateTime.now());
    claunses.add(claunsToAdd);
    notifyListeners();
  }

  void deleteClaunsAt(int index) {
    claunses.removeAt(index);
    notifyListeners();
  }

  void sortByClue() {
    List<Clauns> clueSort = claunses.toList();
    sortByClueHelper(clueSort);
    claunses = clueSort;
    notifyListeners();
  }

  void sortByClueHelper(List<Clauns> arr) {
    if (arr.length > 1) {
      List<Clauns> left = arr.sublist(0, arr.length ~/ 2);
      List<Clauns> right = arr.sublist(arr.length ~/ 2, arr.length);

      sortByClueHelper(left);
      sortByClueHelper(right);
      mergeSortByClue(arr, left, right);
    }
  }

  void mergeSortByClue(
      List<Clauns> arr, List<Clauns> left, List<Clauns> right) {
    int as = 0;
    int bs = 0;
    for (int i = 0; i < arr.length; i++) {
      if (bs >= right.length ||
          (as < left.length &&
              left
                      .elementAt(as)
                      .getClue()
                      .compareTo(right.elementAt(bs).getClue()) <
                  0)) {
        arr.removeAt(i);
        arr.insert(i, left.elementAt(as));
        as++;
      } else {
        arr.removeAt(i);
        arr.insert(i, right.elementAt(bs));
        bs++;
      }
    }
  }

  void sortByDate() {
    List<Clauns> dateSort = claunses.toList();
    sortByDateHelper(dateSort);
    claunses = dateSort;
    notifyListeners();
  }

  void sortByDateHelper(List<Clauns> arr) {
    if (arr.length > 1) {
      List<Clauns> left = arr.sublist(0, arr.length ~/ 2);
      List<Clauns> right = arr.sublist(arr.length ~/ 2, arr.length);

      sortByDateHelper(left);
      sortByDateHelper(right);
      mergeSortByDate(arr, left, right);
    }
  }

  void mergeSortByDate(
      List<Clauns> arr, List<Clauns> left, List<Clauns> right) {
    int as = 0;
    int bs = 0;
    for (int i = 0; i < arr.length; i++) {
      if (bs >= right.length ||
          (as < left.length &&
              left
                      .elementAt(as)
                      .getDate()
                      .compareTo(right.elementAt(bs).getDate()) <
                  0)) {
        arr.removeAt(i);
        arr.insert(i, left.elementAt(as));
        as++;
      } else {
        arr.removeAt(i);
        arr.insert(i, right.elementAt(bs));
        bs++;
      }
    }
  }
}
