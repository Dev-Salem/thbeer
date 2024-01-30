import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart';
import 'package:thbeer/data/shared_preferences.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  final _bookmarks = BookmarksManager().getBookmarks();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
      itemCount: _bookmarks.length,
      itemBuilder: (context, index) {
        final verse = getVerse(
            _bookmarks[index].surahCount, _bookmarks[index].verseNumber,
            verseEndSymbol: true);
        return ListTile(
          trailing: Text(
            getSurahNameArabic(_bookmarks[index].surahCount),
          ),
          // isThreeLine: true,
          subtitle: const Text("طريقة الأداء والاساليب القرانية هنا"),
          leading:
              const IconButton(onPressed: null, icon: Icon(Icons.play_arrow)),
          title: Text(
            verse,
            textAlign: TextAlign.right,
            style: GoogleFonts.amiri(fontSize: 24),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        thickness: 2,
      ),
    ));
  }
}
