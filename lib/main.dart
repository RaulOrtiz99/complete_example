import 'package:complete_example/app/domain/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'app/data/repositories_impl/authentication_repository_impl.dart';
import 'app/my_app.dart';

void main() {
  Get.put<AuthenticationRepository>(AuthenticationRepositoryImpl());
  runApp(const MyApp());
}
