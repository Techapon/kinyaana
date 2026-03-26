import 'package:flutter/widgets.dart';
import 'package:kinyaana/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:kinyaana/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:kinyaana/features/profile/domain/entities/profile_entity.dart';
import 'package:kinyaana/features/profile/domain/usecase/get_profile_usecase.dart';

class ProfileProvider extends ChangeNotifier {
  final getProfileUsecase = 
      GetProfileUsecase(ProfileRepositoryImpl(ProfileRemoteDatasource()));

  bool isLoading  = false;
  String? errorr;
  ProfileEntity? profile;
 
  Future<void> getProfile() async {
    isLoading = true;
    notifyListeners();
    try {
      profile = await getProfileUsecase.call();
      errorr = null;
    } catch (e) {
      errorr = e.toString();
      
    }

    isLoading = false;
    notifyListeners();
  }

}