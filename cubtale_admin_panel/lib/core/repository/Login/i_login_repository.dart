

import 'package:cubtale_admin_panel/core/failure/login/login_repository_failure.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchRepository {
  Future<Either<LoginRepositoryFailure, bool>> login({
    required String email,
    required String password,
  });
}
