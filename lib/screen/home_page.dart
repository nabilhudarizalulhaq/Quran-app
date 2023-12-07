import 'package:al_quran/globals.dart';
import 'package:al_quran/tabs/hijb_tab_oage.dart';
import 'package:al_quran/tabs/page_tab_page.dart';
import 'package:al_quran/tabs/para_tab_page.dart';
import 'package:al_quran/tabs/surah_tab_page.dart';
import 'package:al_quran/widgets/app_bar_page.dart';
import 'package:al_quran/widgets/bottom_navigation_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: appBar(context: context),
      bottomNavigationBar: bottomNavigationBar(context: context),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxScrolled) => [
              SliverToBoxAdapter(
                child: _greeting(context: context),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                backgroundColor: Theme.of(context).colorScheme.background,
                automaticallyImplyLeading: false,
                shape: Border(
                  bottom: BorderSide(
                    width: 3,
                    color: const Color(0xFFAAAAAA).withOpacity(.1),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: tab(context: context),
                ),
              ),
            ],
            body: const TabBarView(
              children: [
                SurahTabPage(),
                ParaTabPage(),
                PageTabPage(),
                HijbTabPage()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TabBar tab({required BuildContext context}) {
  return TabBar(
    unselectedLabelColor: grey,
    labelColor: Theme.of(context).colorScheme.primary,
    indicatorColor: primary,
    indicatorWeight: 3,
    tabs: [
      tabItem(context: context, label: "Surah"),
      tabItem(context: context, label: "Para"),
      tabItem(context: context, label: "Page"),
      tabItem(context: context, label: "Hijb"),
    ],
  );
}

Tab tabItem({required BuildContext context, required String label}) {
  return Tab(
    child: Text(
      label,
      style: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    ),
  );
}

Column _greeting({required BuildContext context}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Assalamualaikum',
        style: greyTextStyle.copyWith(
          fontSize: 18,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        'Nabil Huda Rizalul H.',
        style: whiteTextStyle.copyWith(
          fontSize: 24,
          fontWeight: bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      const SizedBox(
        height: 24,
      ),
      _lastRead(),
    ],
  );
}

Stack _lastRead() {
  return Stack(
    children: [
      Container(
        height: 131,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, .6, 1],
            colors: [
              Color(0xFFDF98FA),
              Color(0xFFB070FD),
              Color(0xFF9055FF),
            ],
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: SvgPicture.asset(
          'assets/svgs/quran.svg',
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/svgs/book.svg'),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Last Read',
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Al-Fatihah',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Ayat No: 1',
              style: GoogleFonts.poppins(
                color: Colors.white,
              ),
            ),
          ],
        ),
      )
    ],
  );
}
