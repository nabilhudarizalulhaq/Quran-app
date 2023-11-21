import 'package:al_quran/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

BottomNavigationBar bottomNavigationBar() => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _bottomBarItem(icon: "assets/svgs/quran-icon.svg", label: "Quran"),
        _bottomBarItem(icon: "assets/svgs/lamp-icon.svg", label: "Tips"),
        _bottomBarItem(icon: "assets/svgs/pray-icon.svg", label: "Prayer"),
        _bottomBarItem(icon: "assets/svgs/doa-icon.svg", label: "Doa"),
        _bottomBarItem(
            icon: "assets/svgs/bookmark-icon.svg", label: "Bookmark"),
      ],
    );

BottomNavigationBarItem _bottomBarItem(
        {required String icon, required String label}) =>
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        // ignore: deprecated_member_use
        color: grey,
      ),
      activeIcon: SvgPicture.asset(
        icon,
        // ignore: deprecated_member_use
        color: primary,
      ),
      label: label,
    );
