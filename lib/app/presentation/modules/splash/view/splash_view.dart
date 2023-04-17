import 'package:complete_example/app/presentation/modules/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import '../controller/splash_provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider,
      onChange: (_, controller) {
        final routeName = controller.routeName;
        if (controller.routeName != null) {
          //este es un navigator con base al nombre es propio de meedu
          router.pushReplacementNamed(
            routeName!,
            transition: Transition.fadeIn,
          );
        }
      },
      builder: (_, __) => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
