import 'package:complete_example/app/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  @override
  Future<String?> get accesToken async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    return null;
  }
}
