import 'package:castify/service/category/category_list.dart';
import 'package:castify/service/category/local_category_list.dart';
import 'package:castify/service/ebook/ebook_list.dart';
import 'package:castify/service/ebook/others_podcast.dart';
import 'package:castify/service/ebook/seasonal_podcast.dart';
import 'package:castify/service/mostListened/local_listened_list.dart';
import 'package:castify/service/mostListened/mostlistened_list.dart';
import 'package:castify/view_model/view_model.dart';
import 'package:get_it/get_it.dart';

void initServiceLocator() {
  GetIt.I.registerSingleton<CategoryList>(LocalCategoryList());
  GetIt.I.registerSingleton<MostListenedList>(LocalListenedList());
  GetIt.I.registerFactory<ViewModel>(() => ViewModel());
  GetIt.I.registerSingleton<EBookList>(SeasonalPodcast(), instanceName: "1");
  GetIt.I.registerSingleton<EBookList>(OthersPodcast(), instanceName: "2");
}
