// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';

class SurahDetailsHeader extends StatelessWidget {
  final String surahName;

  final int verseCount;

  final String revelation;

  const SurahDetailsHeader({
    Key? key,
    required this.surahName,
    required this.verseCount,
    required this.revelation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 178, 148, 231),
            context.primaryColor
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            surahName,
            style: context.headlineMedium!.bold.copyWith(color: Colors.white),
          ),
          const Divider(
            color: Colors.white,
          ),
          Text(
            "$revelation • $verseCount آية",
            style: context.bodyLarge!.bold.copyWith(color: Colors.white),
          ),
          8.heightBox,
          Image.asset('assets/basmala.png')
        ],
      ),
    );
  }
}
