import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/profile/profile_failure.dart';
import '../models/profile_model.dart';

class ProfileRemoteDatasource {
  final supabase = Supabase.instance.client;

  Future<ProfileModel> getProfile() async {
    try {
      final currentUser = supabase.auth.currentUser;
      final userId = currentUser?.id;

      if (userId == null) throw ProfileFailure.sessionExpired();

      final response = await supabase.from("profiles").select().eq("id", userId).single();

      final email = currentUser?.email;
      final createdAt = currentUser?.createdAt;

      return ProfileModel.fromMap(
        response,
        email!,
        DateTime.parse(createdAt!),
      );

    } on PostgrestException catch (e) {
      throw ProfileFailure.databaseError(e.message);
    } catch (e) {
      print("unknown error : ${e.toString()}");
      throw ProfileFailure.unknown(e.toString());
    }
  }
}