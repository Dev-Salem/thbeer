import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran/quran.dart';
import 'package:thbeer/data/shared_preferences.dart';

class HomeScreenHeader extends StatelessWidget {
  final bookmarks = BookmarksManager().getBookmarks();

  HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final lastSurahBookmakred = bookmarks.isEmpty
        ? "..."
        : getSurahNameArabic(bookmarks.last.surahCount);
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 178, 148, 231),
            context.primaryColor
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          24.widthBox,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.bookOpen,
                    color: Colors.white,
                    size: 16,
                  ),
                  label: Text(
                    'آخر قراءة',
                    style: context.bodyMedium!.semiBold
                        .copyWith(color: Colors.white),
                  )),
              Text(
                'سورة $lastSurahBookmakred',
                style:
                    context.headlineSmall!.bold.copyWith(color: Colors.white),
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset("assets/Quran.svg"),
        ],
      ),
    );
  }
}
