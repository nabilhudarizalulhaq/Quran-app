import 'dart:convert';

import 'package:al_quran/globals.dart';
import 'package:al_quran/models/ayat_page.dart';
import 'package:al_quran/models/surah_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatelessWidget {
  final int noSurat;
  const DetailScreen({super.key, required this.noSurat});

  Future<Surah> _getDetailSurah() async {
    var data = await Dio().get("https://equran.id/api/surat/$noSurat");
    return Surah.fromJson(json.decode(data.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Surah>(
        future: _getDetailSurah(),
        initialData: null,
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.background,
              body: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 24,
                ),
              ),
            );
          }
          Surah surah = snapshot.data!;
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: _appBar(context: context, surah: surah),
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: _details(surah: surah),
                )
              ],
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) => _ayatItem(
                      context: context,
                      ayat: surah.ayat!
                          .elementAt(index + (noSurat == 1 ? 1 : 0))),
                  itemCount: surah.jumlahAyat + (noSurat == 1 ? -1 : 0),
                  separatorBuilder: (context, index) => Container(),
                ),
              ),
            ),
          );
        }));
  }

  Widget _ayatItem({required BuildContext context, required Ayat ayat}) =>
      Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: primary,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(27 / 2)),
                    child: Center(
                        child: Text(
                      '${ayat.nomor}',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                        // color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    )),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.share_outlined,
                    color: Color(0XFF863ED5),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.play_arrow_outlined,
                    color: Color(0XFF863ED5),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(
                    Icons.bookmark_outline,
                    color: Color(0XFF863ED5),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              ayat.ar,
              style: GoogleFonts.amiri(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              ayat.idn,
              // style: GoogleFonts.poppins(
              //   fontSize: 16,
              //   fontWeight: medium,
              //   color: Theme.of(context).colorScheme.primary,
              // ),
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
                color: grey,
              ),
            ),
          ],
        ),
      );

  Widget _details({required Surah surah}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: [
            Container(
              height: 257,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [
                        0,
                        .6,
                        1
                      ],
                      colors: [
                        Color(0xFFDF98FA),
                        Color(0xFFB070FD),
                        Color(0xFF9055FF)
                      ])),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Opacity(
                    opacity: .2,
                    child: SvgPicture.asset(
                      'assets/svgs/quran.svg',
                      width: 324 - 55,
                    ))),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              child: Column(
                children: [
                  Text(
                    surah.namaLatin,
                    style: whiteTextStyle.copyWith(
                      fontSize: 26,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    surah.arti,
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: bold,
                    ),
                  ),
                  Divider(
                    color: Colors.white.withOpacity(.35),
                    thickness: 2,
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        surah.tempatTurun.name,
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: Colors.white),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${surah.jumlahAyat} Ayat",
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SvgPicture.asset('assets/svgs/bismillah.svg')
                ],
              ),
            ),
          ],
        ),
      );

  AppBar _appBar({required BuildContext context, required Surah surah}) =>
      AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              onPressed: (() => Navigator.of(context).pop()),
              icon: SvgPicture.asset(
                'assets/svgs/back-icon.svg',
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Text(
              surah.namaLatin,
              style: primaryTextStyle.copyWith(
                fontSize: 26,
                fontWeight: bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset(
                'assets/svgs/search-icon.svg',
              ),
            ),
          ],
        ),
      );
}
