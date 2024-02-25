import 'package:castify/model/category.dart';
import 'package:castify/service/category/category_list.dart';

class LocalCategoryList implements CategoryList {
  @override
  List<Category> getCategory() {
    var list = [
      Category(
        "icon_gallery.png",
        "همه",
      ),
      Category(
        "icon_sports.png",
        "ورزش",
      ),
      Category(
        "icon_dollar-circle.png",
        "ثروت",
      ),
      Category(
        "icon_landscape.png",
        "طبیعت",
      ),
      Category(
        "icon_monitor.png",
        "تکنولوژی",
      ),
      Category(
        "icon_console.png",
        "'گیمینگ",
      ),
      Category(
        "icon_health.png",
        "سلامتی",
      ),
      Category(
        "icon_briefcase.png",
        "کسب و کار",
      ),
      Category(
        "icon_family.png",
        "خانواده",
      ),
      Category(
        "icon_mosque.png",
        "مذهبی",
      ),
    ];
    return list;
  }
}
