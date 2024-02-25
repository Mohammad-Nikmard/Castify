import 'package:castify/model/category.dart';
import 'package:castify/model/ebook.dart';
import 'package:castify/model/most_listened.dart';
import 'package:castify/service/category/category_list.dart';
import 'package:castify/service/ebook/ebook_list.dart';
import 'package:castify/service/mostListened/mostlistened_list.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ViewModel extends ChangeNotifier {
  final CategoryList _localList = GetIt.I.get<CategoryList>();
  final MostListenedList _localistenedList = GetIt.I.get<MostListenedList>();
  final EBookList _seasonal = GetIt.I.get<EBookList>(instanceName: "1");
  final EBookList _othersPodcast = GetIt.I.get<EBookList>(instanceName: "2");

  List<Category> category_list = [];
  List<MostListenedWeekly> listened_list = [];
  List<EBook> seasonal = [];
  List<EBook> others = [];

  void getCategoryList() {
    category_list = _localList.getCategory();
    notifyListeners();
  }

  void getListenedList() {
    listened_list = _localistenedList.getList();
    notifyListeners();
  }

  void getSeasonalList() {
    seasonal = _seasonal.getBooksList();
    notifyListeners();
  }

  void getOthersPodcast() {
    others = _othersPodcast.getBooksList();
    notifyListeners();
  }
}
