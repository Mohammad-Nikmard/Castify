import 'dart:ui';
import 'package:castify/constants/constants.dart';
import 'package:castify/model/playlistEnum.dart';
import 'package:castify/ui/bottomSheet_page/playlist_bottomsheet.dart';
import 'package:castify/widgets/playlist_widget.dart';
import 'package:flutter/material.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({super.key});
  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      backgroundColor: MyColor.midWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Header(),
            Column(
              children: [
                SizedBox(height: 22),
                PlayerPosition(),
                SizedBox(height: 32),
                Player(),
                _getItemHeader("کتاب الکترونیکی"),
                PlayListWidget(
                  image: "podcast1.png",
                  subTitle: "رویای کارآموزی",
                  title: "قسمت 1",
                  pageCounter: "۱۶",
                  type: PlayListType.ebook,
                  passedTime: "۴:۳۵",
                  timerLength: "۱۲:۰۵",
                ),
                _getItemHeader("توضیحات"),
                Description(),
                SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getItemHeader(String name) {
    return Padding(
      padding: EdgeInsets.only(top: 32, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(width: 24),
        ],
      ),
    );
  }

  PreferredSizeWidget _getAppBar() {
    return AppBar(
      toolbarHeight: 68,
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0.0,
      title: Text(
        "پادکست",
        style: TextStyle(
            color: MyColor.orangeColor, fontFamily: "MR", fontSize: 24),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset("images/icon_arrow-circle-right.png"),
        ),
      ],
      leadingWidth: 100,
      leading: Row(
        children: [
          SizedBox(width: 24),
          Image.asset("images/icon_add-circle.png"),
          SizedBox(width: 24),
          Image.asset("images/icon_heart.png"),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("images/poster.png"),
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              height: 463,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x33F5F4F4),
                    Color(0xFFF5F5F5),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              Container(
                height: 26,
                width: 77,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: MyColor.whiteColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        "پرطرفدار",
                        style: TextStyle(
                          color: MyColor.orangeColor,
                          fontSize: 10,
                          fontFamily: "SM",
                        ),
                      ),
                      SizedBox(width: 5),
                      Image.asset("images/icon_hot.png"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 74),
                child: Container(
                  height: 271,
                  width: 279,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/poster.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 34),
              Text(
                "رویای کارآموزی",
                style: TextStyle(
                  fontFamily: "SM",
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "قسمت: 1",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "SM",
                        color: MyColor.greyColor),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "اثر: امیراحمدادیبی",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "SM",
                        color: MyColor.greyColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PlayerPosition extends StatelessWidget {
  const PlayerPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 8,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: MyColor.greyColor,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 8,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        topLeft: Radius.circular(100),
                      ),
                      color: MyColor.orangeColor,
                    ),
                  ),
                  Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MyColor.orangeColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MyColor.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "۱۳:۳۶",
                style: TextStyle(
                    color: MyColor.greyColor, fontSize: 12, fontFamily: "SM"),
              ),
              Spacer(),
              Text(
                "۴۴:۰۰",
                style: TextStyle(
                    color: MyColor.greyColor, fontSize: 12, fontFamily: "SM"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) {
                return DraggableScrollableSheet(
                  initialChildSize: 0.4,
                  maxChildSize: 0.9,
                  minChildSize: 0.2,
                  builder: ((context, scrollController) {
                    return PlayListBottomSheet(
                      controller: scrollController,
                    );
                  }),
                );
              },
            );
          },
          child: Image.asset("images/icon_music-playlist.png"),
        ),
        Image.asset("images/icon_backward-10-seconds.png"),
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColor.orangeColor,
          ),
          child: Center(
            child: Image.asset(
              "images/Play.png",
              height: 28,
              width: 28,
            ),
          ),
        ),
        Image.asset("images/icon_forward-10-seconds.png"),
        Image.asset("images/icon_timer.png"),
      ],
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: double.infinity,
          child: Text(
            "سعی کردم صفر تا صد تجربیاتم در این چند سال فعالیتم رو با شما به اشتراک بذارم و قطعا خیلی میتونه براتون مفید باشه پس ریز به ریزشو با تمرکز و با دقت گوش کنید.",
            style: TextStyle(
              color: MyColor.greyColor,
              fontSize: 14,
              fontFamily: "SM",
            ),
          ),
        ),
      ),
    );
  }
}
