import 'package:complete_example/app/presentation/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier {
  SplashController() {
    print("EMOJI");
    _init();
  }

  String? _routename;
  String? get routeName => _routename;

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 1));
    _routename = Routes.HOME;
    notify();
  }
}
