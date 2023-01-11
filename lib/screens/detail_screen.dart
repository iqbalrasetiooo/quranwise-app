import 'package:quranwise/export.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DetailSurahBloc dSurah = context.read<DetailSurahBloc>();
    var data = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      body: BlocBuilder<DetailSurahBloc, DetailSurahState>(
        bloc: dSurah..add(GetDetailSurahEvent(id: data.toString())),
        buildWhen: (previous, current) {
          if (current is DetailSurahSuccess) {
            return true;
          } else {
            return false;
          }
        },
        builder: (context, state) {
          if (state is DetailSurahSuccess) {
            return ListView.builder(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                var item = state.data[index];
                return Text(item.arti.toString());
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
