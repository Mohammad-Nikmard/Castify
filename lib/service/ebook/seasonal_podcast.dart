import 'package:castify/model/ebook.dart';
import 'package:castify/service/ebook/ebook_list.dart';

class SeasonalPodcast implements EBookList {
  @override
  List<EBook> getBooksList() {
    List<EBook> list = [
      EBook(
        title: "قسمت ۱",
        subTitle: "رویای کارآموزی",
        image: "podcast1.png",
        pageCounter: "16",
        fromMinute: "۱۰:۱۳",
        toMinute: "۰۰:۰۰",
      ),
      EBook(
        title: "قسمت ۲",
        subTitle: "اشتیاق فراوان",
        image: "podcast1.png",
        pageCounter: "16",
        fromMinute: "۳۲:۳۰",
        toMinute: "۰۰:۰۰",
      ),
      EBook(
        title: "قسمت ۳",
        subTitle: "تجربیات نو",
        image: "podcast1.png",
        pageCounter: "16",
        fromMinute: "۵۶:۰۰",
        toMinute: "۰۰:۰۰",
      ),
      EBook(
        title: "قسمت ۴",
        subTitle: "اعتماد به نفس",
        image: "podcast1.png",
        pageCounter: "16",
        fromMinute: "۲۵:۴۷",
        toMinute: "۰۰:۰۰",
      ),
    ];

    return list;
  }
}
