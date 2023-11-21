import 'package:al_quran/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar appBar() => AppBar(
      backgroundColor: backgroundLight,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svgs/menu-icon.svg',
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Text(
            'Quran App',
            style: primaryTextStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/svgs/search-icon.svg',
            ),
          ),
        ],
      ),
    );
