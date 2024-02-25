import 'package:carousel_slider/carousel_slider.dart';
import 'package:castify/constants/constants.dart';
import 'package:castify/view_model/view_model.dart';
import 'package:castify/widgets/category_widget.dart';
import 'package:castify/widgets/mostListened_weekly.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class AllWidget extends StatefulWidget {
  const AllWidget({super.key});

  @override
  State<AllWidget> createState() => _AllWidgetState();
}

class _AllWidgetState extends State<AllWidget> {
  final viewModel = GetIt.I.get<ViewModel>();
  int _current = 0;
  @override
  void initState() {
    viewModel.getCategoryList();
    viewModel.getListenedList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<ViewModel>(
        builder: (context, provider, child) {
          return Container(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                          height: 140.0,
                        ),
                        items: [1, 2].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: 295,
                                height: 150.0,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "images/boarder_cover$i.png"),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      DotsIndicator(
                        dotsCount: 2,
                        position: _current,
                        decorator: DotsDecorator(
                          activeColor: MyColor.whiteColor,
                          color: MyColor.greyColor,
                          size: Size.square(9.0),
                          activeSize: Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                _getHeader("دسته بندی"),
                _getCategoryList(provider),
                _getHeader("پرطرفدار های هفته"),
                _getMostListenedList(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _getHeader(String title) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "مشاهده بیشتر",
              style: TextStyle(
                  color: MyColor.orangeColor, fontFamily: "SM", fontSize: 12),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCategoryList(ViewModel provider) {
    return SliverToBoxAdapter(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: 92,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.category_list.length,
            itemBuilder: (context, index) {
              return CategoryWidget(
                image: provider.category_list[index].image,
                title: provider.category_list[index].title,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _getMostListenedList() {
    return SliverToBoxAdapter(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          height: 271,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.listened_list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 17),
                child: MostListenedWeeklyWidget(
                  title: viewModel.listened_list[index].title,
                  subTitle: viewModel.listened_list[index].subtitle,
                  image: viewModel.listened_list[index].image,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
