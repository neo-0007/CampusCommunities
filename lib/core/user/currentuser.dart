import 'package:CampusCommunities/features/auth/model/usermodel.dart';
import 'package:CampusCommunities/features/auth/repository/auth_repository.dart';

class Currentuser {
  AuthRepository authRepository = AuthRepository();

  Future<UserModel?> getCurrentUser() async {
    UserModel? currentUser = await authRepository.getCurrentUser();

    return currentUser;
  }
}
