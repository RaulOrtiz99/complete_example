import 'package:complete_example/app/domain/repositories/authentication_repository.dart';
import 'package:complete_example/app/presentation/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier {
  SplashController() {
    _init();
  }
  //
  final _auth = Get.find<AuthenticationRepository>();
  String? _routename;
  String? get routeName => _routename;

  Future<void> _init() async {
    if (await _auth.accesToken != null) {
      _routename = Routes.HOME;
    }

    _routename = Routes.HOME;
    notify();
  }
}
