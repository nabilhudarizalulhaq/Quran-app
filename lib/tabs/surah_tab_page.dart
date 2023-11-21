import 'package:al_quran/globals.dart';
import 'package:al_quran/models/surah_page.dart';
import 'package:al_quran/screen/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SurahTabPage extends StatelessWidget {
  const SurahTabPage({super.key});

  Future<List<Surah>> _getSurahList() async {
    String data = await rootBundle.loadString('assets/datas/list-surah.json');
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
      future: _getSurahList(),
      initialData: const [],
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return ListView.separated(
            itemBuilder: (context, index) => _surahItem(
                context: context, surah: snapshot.data!.elementAt(index)),
            separatorBuilder: (context, index) => Divider(
                  color:
                      const Color.fromARGB(255, 255, 255, 255).withOpacity(.35),
                ),
            itemCount: snapshot.data!.length);
      }),
    );
  }

  Widget _surahItem({required Surah surah, required BuildContext context}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(
                    noSurat: surah.nomor,
                  )));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset('assets/svgs/nomor-surah.svg'),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                      child: Text(
                        "${surah.nomor}",
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      surah.namaLatin,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Text(
                          surah.tempatTurun.name,
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: reguler,
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
                              color: grey),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${surah.jumlahAyat} Ayat",
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                surah.nama,
                style: GoogleFonts.amiri(
                    color: primary, fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
}
