import 'package:dio/dio.dart';

abstract class IUserService {
  final Dio dio;

  IUserService(this.dio);
}

class UserService extends IUserService {
  UserService(super.dio);
}
