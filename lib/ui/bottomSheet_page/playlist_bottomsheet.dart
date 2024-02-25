import 'package:castify/constants/constants.dart';
import 'package:castify/model/playlistEnum.dart';
import 'package:castify/view_model/view_model.dart';
import 'package:castify/widgets/playlist_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class PlayListBottomSheet extends StatefulWidget {
  PlayListBottomSheet({super.key, required this.controller});
  ScrollController? controller;

  @override
  State<PlayListBottomSheet> createState() => _PlayListBottomSheetState();
}

class _PlayListBottomSheetState extends State<PlayListBottomSheet> {
  ScrollController? controller;
  final ViewModel view_model = GetIt.I.get<ViewModel>();
  @override
  void initState() {
    controller = widget.controller;
    view_model.getSeasonalList();
    view_model.getOthersPodcast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => view_model,
      child: Consumer<ViewModel>(
        builder: (context, provider, child) {
          return _getBody(provider);
        },
      ),
    );
  }

  Widget _getBody(ViewModel provider) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: Container(
        color: MyColor.midWhiteColor,
        child: CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 130, right: 130),
                child: Container(
                  height: 7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: MyColor.greyColor,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 30),
            ),
            _getHeader("فصل ۱"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 15),
                    child: PlayListWidget(
                      image: provider.seasonal[index].image,
                      subTitle: provider.seasonal[index].subTitle,
                      title: provider.seasonal[index].title,
                      pageCounter: provider.seasonal[index].pageCounter,
                      type: PlayListType.playlist,
                      passedTime: provider.seasonal[index].toMinute,
                      timerLength: provider.seasonal[index].fromMinute,
                    ),
                  );
                },
                childCount: provider.seasonal.length,
              ),
            ),
            _getHeader("آنهایی که گوش دادید"),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 9, right: 9, top: 15),
                    child: PlayListWidget(
                      image: provider.others[index].image,
                      subTitle: provider.others[index].subTitle,
                      title: provider.others[index].title,
                      pageCounter: provider.others[index].pageCounter,
                      type: PlayListType.playlist,
                      passedTime: provider.others[index].toMinute,
                      timerLength: provider.others[index].fromMinute,
                    ),
                  );
                },
                childCount: provider.others.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getHeader(String title) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
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
}
