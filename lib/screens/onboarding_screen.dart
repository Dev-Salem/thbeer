import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart'
    hide NumDurationExtensions;
import 'package:thbeer/screens/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("هاكاثون التطبيقات القرآنية"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/logo.png'),
          Text('تعلم القراءة التفسيرية واساليبها عن طريق طبقات الصوت والنغم',
              textAlign: TextAlign.center,
              style: context.headlineSmall!.semiBold),
          Container(
            margin: const EdgeInsets.only(top: 32, left: 20, right: 20),
            child: FilledButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      maintainState: false,
                      builder: (_) => const HomeScreen()));
                },
                child: Text(
                  'التالي',
                  style: context.headlineSmall!.semiBold,
                ).paddingSymmetric(vertical: 15)),
          )
        ]
            .animate(interval: 200.milliseconds)
            .scaleXY(
                duration: 1.seconds,
                curve: Curves.fastOutSlowIn,
                begin: 0,
                end: 1)
            .fadeIn(begin: 0),
      ).paddingSymmetric(horizontal: 10),
    );
  }
}
