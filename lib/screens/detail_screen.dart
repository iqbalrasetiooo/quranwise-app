import 'package:quranwise/export.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DetailSurahBloc dSurah = context.read<DetailSurahBloc>();
    dynamic data = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_sharp,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                      BlocBuilder<DetailSurahBloc, DetailSurahState>(
                        builder: (context, state) {
                          if (state is DetailSurahSuccess) {
                            return Text(
                              "${state.data.namaLatin}",
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                              ),
                            );
                          } else {
                            return const Text('');
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 16,
                  ),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                ),
                BlocBuilder<DetailSurahBloc, DetailSurahState>(
                  bloc: dSurah..add(GetDetailSurahEvent(id: data.toString())),
                  builder: (context, state) {
                    if (state is DetailSurahSuccess) {
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        itemCount: state.data.ayat!.length,
                        itemBuilder: (context, index) {
                          var item = state.data.ayat![index];
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Column(
                              children: [
                                ListTile(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: greyColor,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  leading: SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CircleAvatar(
                                      backgroundColor: primaryColor,
                                      foregroundColor: whiteColor,
                                      child: Text(
                                        '${index + 1}',
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  // trailing: IconButton(
                                  //   onPressed: () {},
                                  //   icon: const Icon(Icons.play_circle),
                                  // ),
                                ),
                                ListTile(
                                  // shape: RoundedRectangleBorder(
                                  //   side: const BorderSide(
                                  //     color: greyColor,
                                  //     width: 0.5,
                                  //   ),
                                  //   borderRadius: BorderRadius.circular(5),
                                  // ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),

                                  title: Text(
                                    item.ar.toString(),
                                    style: arabTextStyle.copyWith(
                                      fontSize: 30,
                                      fontWeight: regular,
                                    ),
                                  ),
                                  subtitle: Text(
                                    item.tr!,
                                    style: greyTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: regular,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 0,
                                  ),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Divider(
                                        thickness: 0.5,
                                        color: greyColor,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        item.idn.toString(),
                                        style: blackTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
        ],
      ),
    );
  }
}
