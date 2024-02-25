import 'package:castify/model/most_listened.dart';
import 'package:castify/service/mostListened/mostlistened_list.dart';

class LocalListenedList implements MostListenedList {
  @override
  List<MostListenedWeekly> getList() {
    var list = [
      MostListenedWeekly(
        "دورهمی 4 دیزاینر",
        "کستیفای",
        "listened_cover1.png",
      ),
      MostListenedWeekly(
        "خلاقیت برتر",
        "ایوان ریچ گوینده : صالح احمدی",
        "listened_cover2.png",
      ),
      MostListenedWeekly(
        "برنامه نویس خوشحال",
        "کستیفای",
        "listened_cover3.png",
      ),
      MostListenedWeekly(
        "ذخیره مهارت",
        "کستیفای",
        "listened_cover4.png",
      ),
      MostListenedWeekly(
        "تصمیمات رو هوا",
        "پابلو کوییلو  گوینده : ابراهیم اسدی",
        "listened_cover5.png",
      ),
      MostListenedWeekly(
        "طلسم",
        "استفان چک گوینده : ابراهیم اسدی",
        "listened_cover6.png",
      ),
    ];
    return list;
  }
}
