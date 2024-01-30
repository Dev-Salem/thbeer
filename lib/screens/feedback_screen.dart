import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart';

class FeedbackScreen extends StatelessWidget {
  final int surahCount;
  const FeedbackScreen({super.key, required this.surahCount});

  @override
  Widget build(BuildContext context) {
    final surahName = getSurahNameArabic(surahCount);
    return Scaffold(
      appBar: AppBar(
        title: Text('مراجعة $surahName '),
      ),
      body: ListView.separated(
        itemCount: 2,
        itemBuilder: (context, index) {
          final verse = getVerse(surahCount, index + 1, verseEndSymbol: true);
          return ListTile(
            // isThreeLine: true,
            subtitle: Text(
              "⭕️🔉 النغم مع انتقال  الصوت",
              style: context.bodyLarge!.bold,
            ),
            leading:
                const IconButton(onPressed: null, icon: Icon(Icons.play_arrow)),
            title: Text(
              verse,
              textAlign: TextAlign.right,
              style: GoogleFonts.amiri(fontSize: 24, color: Colors.red),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          thickness: 2,
        ),
      ),
    );
  }
}
