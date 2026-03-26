import 'package:kinyaana/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:kinyaana/features/profile/domain/entities/profile_entity.dart';
import 'package:kinyaana/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl  implements ProfileRepository {
  final ProfileRemoteDatasource remoteDatasource;

  ProfileRepositoryImpl(this.remoteDatasource);

  @override
  Future<ProfileEntity> getProfile() {
    return remoteDatasource.getProfile();
  }
}