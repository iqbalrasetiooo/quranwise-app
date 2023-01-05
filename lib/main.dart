import 'export.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(const MyApp());
}
