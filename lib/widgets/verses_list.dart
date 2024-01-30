import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'
    hide NumDurationExtensions;
import 'package:quran/quran.dart';
import 'package:thbeer/screens/surah_details.dart';
import 'package:thbeer/widgets/home_screen_header.dart';
import 'package:thbeer/widgets/surah_count.dart';

class VersesList extends StatelessWidget {
  const VersesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomeScreenHeader(),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                ),
            itemCount: totalSurahCount,
            itemBuilder: (context, index) {
              final surahIndex = index + 1;
              final surahName = getSurahNameArabic(surahIndex);
              final versesCount = getVerseCount(surahIndex);
              final revelation = getPlaceOfRevelation(surahIndex) == "Madinah"
                  ? 'مدنية'
                  : 'مكية';
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return SurahDetails(
                        surahIndex: surahIndex,
                        surahName: surahName,
                        verseCount: versesCount,
                        revelation: revelation);
                  }));
                },
                child: ListTile(
                  leading: SurahCount(surahNumber: index + 1),
                  subtitle: Text("$revelation • $versesCount آية"),
                  trailing: Text(
                    surahName,
                    style: context.headlineSmall!.semiBold
                        .copyWith(color: context.primaryColor),
                  ),
                ).animate(delay: 400.milliseconds).fadeIn(),
              );
            }),
      ],
    ).animate().fadeIn();
  }
}
