import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:online_shop_mvvm/scr/core/data_sources/networking/api_service.dart';
import 'package:online_shop_mvvm/scr/core/errors/api_failure.dart';

import 'package:online_shop_mvvm/scr/core/errors/failures.dart';
import 'package:online_shop_mvvm/scr/features/auth/data/models/user_model.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);

  @override
  Future<Either<Failure, Unit>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String token,
  }) async {
    try {
      await _apiService.post(
        endpoint: 'change-password',
        data: {
          'old_password': oldPassword,
          'new_password': newPassword,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'lang': 'en',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return const Right(unit);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    try {
      var response = await _apiService.post(
        endpoint: 'login',
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'lang': 'en',
          },
        ),
      );

      if (response.data['status'] == true && response.data['data'] != null) {
        final UserModel userModel = UserModel.fromMap(response.data['data']);
        return Right(userModel);
      } else {
        return Left(ApiFailure(response.data['message'] ?? 'Login failed'));
      }
    } on Exception catch (error) {
      return Left(ApiFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout({required String fcmToken}) async {
    try {
      await _apiService.post(
        endpoint: 'logout',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'lang': 'en',
            'Authorization': 'Bearer $fcmToken',
          },
        ),
      );

      return const Right(unit);
    } on Exception catch (error) {
      return Left(ApiFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> register(
      {required String name,
      required String email,
      required String password,
      required String phone}) async {
    try {
      var response = await _apiService.post(
        endpoint: 'register',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phone': phone,
        },
        options: Options(
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            'lang': 'en',
          },
        ),
      );

      if (response.data['status'] == true && response.data['data'] != null) {
        final UserModel userModel = UserModel.fromMap(response.data['data']);
        return Right(userModel);
      } else {
        return Left(
            ApiFailure(response.data['message'] ?? 'Registration failed'));
      }
    } catch (error) {
      return Left(ApiFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String email}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> verifyEmail({required String email}) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> verifyOtp(
      {required String otp, required String email}) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}
