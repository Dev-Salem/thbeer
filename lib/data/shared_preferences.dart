import 'package:shared_preferences/shared_preferences.dart';
import 'package:thbeer/core/constatns.dart';

typedef Bookmarks = List<({int surahCount, int verseNumber})>;

class BookmarksManager {
  late final SharedPreferences _prefers;
  static final BookmarksManager _instance = BookmarksManager._internal();
  factory BookmarksManager() {
    return _instance;
  }
  BookmarksManager._internal();
  Future<void> init() async {
    _prefers = await SharedPreferences.getInstance();
  }

  Future<bool> addVerse(int surahCount, int verseNumber) async {
    final oldBookmarks = _prefers.getStringList(Constants.bookmarks) ?? [];
    final List<String> newBookmarks = [
      ...oldBookmarks,
      "$surahCount:$verseNumber",
    ];
    final isAdded =
        await _prefers.setStringList(Constants.bookmarks, newBookmarks);
    return isAdded;
  }

  Future<bool> removeVerse(int surahCount, int verseNumber) async {
    final oldBookmarks = _prefers.getStringList(Constants.bookmarks) ?? [];
    final List<String> newBookmarks = [...oldBookmarks];
    newBookmarks.remove("$surahCount:$verseNumber");
    final isRemoved =
        await _prefers.setStringList(Constants.bookmarks, newBookmarks);
    return isRemoved;
  }

  Bookmarks getBookmarks() {
    final bookmarks = _prefers.getStringList(Constants.bookmarks) ?? [];
    final Bookmarks bookmarksList = [];
    for (var i = 0; i < bookmarks.length; i++) {
      List<String> surahAndVerse = bookmarks[i].split(":");
      bookmarksList.add((
        surahCount: int.parse(surahAndVerse[0]),
        verseNumber: int.parse(surahAndVerse[1])
      ));
    }
    return bookmarksList;
  }
}
