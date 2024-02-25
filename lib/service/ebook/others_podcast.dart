import 'package:castify/model/ebook.dart';
import 'package:castify/service/ebook/ebook_list.dart';

class OthersPodcast implements EBookList {
  @override
  List<EBook> getBooksList() {
    List<EBook> list = [
      EBook(
        title: "شلوغی گوش",
        subTitle: "اثر: ارلون وودز",
        image: "podcast2.png",
        pageCounter: "0",
        fromMinute: "۶:۱۲",
        toMinute: "۴:۱۴",
      ),
      EBook(
        title: "پرونده",
        subTitle: "اثر: مارتین یانوزای",
        image: "podcast3.png",
        pageCounter: "0",
        fromMinute: "۱۰:۰۰",
        toMinute: "۹:۳۴",
      ),
      EBook(
        title: "آهسته سوختن",
        subTitle: "اثر: پابلو مکنزی",
        image: "podcast4.png",
        pageCounter: "0",
        fromMinute: "۱۳:۳۳",
        toMinute: "۱:۱۶",
      ),
      EBook(
        title: "زندگی در لس آنجلس",
        subTitle: "اثر: چارلز داروین ",
        image: "podcast5.png",
        pageCounter: "0",
        fromMinute: "۵۱:۰۰",
        toMinute: "۲۵:۵۳",
      ),
      EBook(
        title: "صحبت خودمونی",
        subTitle: "اثر: کستیفای",
        image: "podcast6.png",
        pageCounter: "0",
        fromMinute: "۱:۳۳:۵۷",
        toMinute: "۱۷:۴۰",
      ),
      EBook(
        title: "آدمک های پیچیده",
        subTitle: "اثر: پابلو مکنزی",
        image: "podcast7.png",
        pageCounter: "0",
        fromMinute: "۱:۴۰:۰۰",
        toMinute: "۳۸:۱۲",
      ),
      EBook(
        title: "عادت",
        subTitle: "اثر: جیملت",
        image: "podcast8.png",
        pageCounter: "0",
        fromMinute: "۲:۱۰:۰۰",
        toMinute: "۱:۳۰:۱۰",
      ),
    ];

    return list;
  }
}
