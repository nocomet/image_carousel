import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      print('timer');
      int currentPage = pageController.page!.toInt();
      int nextPage = (currentPage + 1) % 5;
      pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.linear,
      );
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    if (pageController != null) {
      pageController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: PageView(
          controller: pageController,
          children: [1, 2, 3, 4, 5]
              .map((e) => Image.asset(
                    'asset/img/image_$e.jpeg',
                    fit: BoxFit.cover,
                  ))
              .toList()),
    );
  }
}
