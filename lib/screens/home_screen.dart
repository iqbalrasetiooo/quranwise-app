import 'package:quranwise/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SurahBloc surahBloc = context.read<SurahBloc>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topBar(),
                info(),
                textSurah(),
                //Get All Surah
                BlocBuilder<SurahBloc, SurahState>(
                  bloc: surahBloc..add(GetAllSurahEvent()),
                  buildWhen: (previous, current) {
                    if (current is SurahSuccess) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  builder: (context, state) {
                    if (state is SurahSuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          var item = state.data[index];
                          return GestureDetector(
                            onTap: () => Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: item.nomor,
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 16),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 18,
                                  vertical: 8,
                                ),
                                leading: CircleAvatar(
                                  foregroundColor: whiteColor,
                                  backgroundColor: primaryColor,
                                  child: Text(
                                    '${index + 1}',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  item.namaLatin.toString(),
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: semibold,
                                  ),
                                ),
                                subtitle: Text(
                                  item.nama.toString(),
                                ),
                                trailing: Text(
                                  '${item.jumlahAyat} Ayat',
                                  style: blackTextStyle.copyWith(
                                      fontSize: 14, fontWeight: regular),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget topBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
        onPressed: () {},
        icon: Image.asset(
          'assets/Menu.png',
          width: 30,
          height: 30,
          color: primaryColor,
        ),
      ),
      Text(
        'Quranwise',
        style: primaryTextStyle.copyWith(
          fontSize: 22,
          fontWeight: semibold,
        ),
      ),
      Image.asset(
        'assets/logo.png',
        width: 27,
        height: 30,
      ),
    ],
  );
}

Widget info() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
    height: 130,
    width: double.infinity,
    margin: const EdgeInsets.only(
      top: 50,
    ),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [
          primaryColor,
          Color(0xff6ED9B6),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(32),
      color: primaryColor,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              '30',
              style: whiteTextStyle.copyWith(
                fontSize: 40,
                fontWeight: bold,
              ),
            ),
            Text(
              'Juz',
              style: whiteTextStyle.copyWith(
                fontWeight: regular,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              '114',
              style: whiteTextStyle.copyWith(
                fontSize: 40,
                fontWeight: bold,
              ),
            ),
            Text(
              'Surah',
              style: whiteTextStyle.copyWith(
                fontWeight: regular,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              '6.666',
              style: whiteTextStyle.copyWith(
                fontSize: 40,
                fontWeight: bold,
              ),
            ),
            Text(
              'Ayat',
              style: whiteTextStyle.copyWith(
                fontWeight: regular,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget textSurah() {
  return Container(
    margin: const EdgeInsets.only(
      top: 35,
      bottom: 16,
    ),
    child: Text(
      'Daftar Surah',
      style: primaryTextStyle.copyWith(
        fontSize: 22,
        fontWeight: regular,
      ),
    ),
  );
}
