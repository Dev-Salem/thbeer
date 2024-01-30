import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SurahCount extends StatelessWidget {
  final int surahNumber;
  const SurahCount({super.key, required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset('assets/surah_icon.svg'),
        Text(surahNumber.toString(), style: context.bodySmall!.semiBold)
      ],
    );
  }
}
