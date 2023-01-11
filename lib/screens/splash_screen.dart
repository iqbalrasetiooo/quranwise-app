import 'package:quranwise/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {});
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 133,
              height: 145,
            ),
            const SizedBox(height: 20),
            Text(
              'Quranwise',
              style: whiteTextStyle.copyWith(
                fontSize: 35,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
