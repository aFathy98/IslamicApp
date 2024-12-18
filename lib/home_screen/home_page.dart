import 'package:flutter/material.dart';
import 'package:islamie/app_colors.dart';
import 'package:islamie/home_screen/tabs/hadith/hadith_tab.dart';
import 'package:islamie/home_screen/tabs/prayers/prayers_tab.dart';
import 'package:islamie/home_screen/tabs/quran/quran_tab.dart';
import 'package:islamie/home_screen/tabs/radio/radio_tab.dart';
import 'package:islamie/home_screen/tabs/sebha/sebha_tab.dart';
import 'package:islamie/intro_screen/intro_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<String> backGroundImage =
  [
    'assets/images/islami-bg.png',
    'assets/images/Background-book.png',
    'assets/images/Background-sebha.png',
    'assets/images/Background-radio.png',
    'assets/images/Backgroundprayers.png',
  ];
  List<Widget> tabs =
  [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    PrayersTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Image.asset(
            backGroundImage[selectedIndex],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Scaffold(
            bottomNavigationBar: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: AppColors.primaryDark),
              child: BottomNavigationBar(
                currentIndex: selectedIndex,
                onTap: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                // type: BottomNavigationBarType.fixed,
                // backgroundColor: AppColors.primaryDark,
                items: [
                  BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(index: 0, imageName: 'Icon-qoraan-1'),
                    label: 'Al-Quran',
                  ),
                  BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(index: 1, imageName: 'Icon-book'),
                    label: 'Hadeth',
                  ),
                  BottomNavigationBarItem(
                    icon:builtItemInBottomNavBar(index: 2, imageName: 'Icon-necklace'),
                    label: 'Sebha',
                  ),
                  BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(index: 3, imageName: 'Icon-radio'),
                    label: 'Radio',
                  ),
                  BottomNavigationBarItem(
                    icon: builtItemInBottomNavBar(index: 4, imageName: 'Icon-sala'),
                    label: 'Prayers',
                  ),
                ],
              ),
            ),
            body: tabs[selectedIndex],
          ),
        ],
      ),
    );
  }

  Widget builtItemInBottomNavBar(
      {required int index, required String imageName}) {
    return selectedIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(66),
                color: AppColors.blackBgColor),
            child: ImageIcon(
              AssetImage('assets/images/$imageName.png'),
            ),
          )
        : ImageIcon(
            AssetImage('assets/images/$imageName.png'),
          );
  }
}
