// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart';
import 'package:star_menu/star_menu.dart';
import 'package:thbeer/data/shared_preferences.dart';
import 'package:thbeer/screens/feedback_screen.dart';
import 'package:thbeer/widgets/surah_details_header.dart';

class SurahDetails extends StatefulWidget {
  final int surahIndex;
  final String surahName;
  final int verseCount;
  final String revelation;
  const SurahDetails({
    Key? key,
    required this.surahIndex,
    required this.surahName,
    required this.verseCount,
    required this.revelation,
  }) : super(key: key);

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  late final FlutterSoundPlayer _player;
  @override
  void initState() {
    _player = FlutterSoundPlayer();
    super.initState();
  }

  Future<void> addToBookmarks(int surahCount, int verseNumber) async {
    final verseAdded =
        await BookmarksManager().addVerse(surahCount, verseNumber);
    if (mounted) {
      if (verseAdded) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("اضيفت للعلامات المرجعية")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("حدث خطأ ما")));
      }
    }
  }

  @override
  void dispose() {
    _player.stopPlayer();
    _player.closePlayer();
    super.dispose();
  }

  Future<void> playVerse(String url) async {
    try {
      await _player.openPlayer();
      await _player.startPlayer(
        fromURI: url,
        codec: Codec.mp3,
        whenFinished: () {
          setState(() {});
        },
      );
      setState(() {});
    } on Exception catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("$e حدث خطأ ما")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => FeedbackScreen(
                      surahCount: widget.surahIndex,
                    )));
          },
          icon: const Icon(FontAwesomeIcons.robot),
          label: const Text(" سّمع")),
      appBar: AppBar(
        title: const Text('تفاصيل السورة'),
      ),
      body: ListView(
        children: [
          SurahDetailsHeader(
              surahName: widget.surahName,
              verseCount: widget.verseCount,
              revelation: widget.revelation),
          SingleChildScrollView(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.verseCount,
                itemBuilder: (_, verseNumber) {
                  return ListTile(
                    subtitle: const Text("طريقة الأداء والاساليب القرانية هنا")
                        .paddingAll(8),
                    title: StarMenu(
                      params: StarMenuParameters.dropdown(context),
                      onItemTapped: (index, controller) async {
                        if (index == 0) {
                          controller.closeMenu!();
                          await playVerse(getAudioURLByVerse(
                              widget.surahIndex, verseNumber + 1));
                        } else if (index == 1) {
                          controller.closeMenu!();
                          await addToBookmarks(
                              widget.surahIndex, verseNumber + 1);
                        }
                      },
                      items: const [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.play_arrow),
                            SizedBox(
                              width: 10,
                            ),
                            Text("اقراء")
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.bookmark),
                            SizedBox(
                              width: 10,
                            ),
                            Text("احفظ")
                          ],
                        )
                      ],
                      child: Text(
                          getVerse(widget.surahIndex, verseNumber + 1,
                              verseEndSymbol: true),
                          textAlign: TextAlign.right,
                          style: GoogleFonts.amiri(fontSize: 24)),
                    ),
                  );
                }),
          )
        ],
      ).paddingSymmetric(horizontal: 8),
    );
  }
}
