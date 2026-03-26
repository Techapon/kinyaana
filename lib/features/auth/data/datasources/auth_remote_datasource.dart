import 'package:kinyaana/core/error/auth/auth_error_mapper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/auth/auth_failure.dart';
import '../models/usere_model.dart';

class AuthRemoteDataSource {
  final supabase = Supabase.instance.client;

  Future<UserModel> login(String email, String password) async {
    try {
      final res = await supabase.auth.signInWithPassword(
        email: email,
        password: password
      );

      final user = res.user;

      if (user == null) throw AuthFailure.unknown("เข้าสู่ระบบล้มเหลว! ไม่พบข้อมูลผู้ใช้");

      return UserModel(
        id: user.id,
        email: user.email!,
      );

    } 
    on AuthException  catch (e) {
      throw AuthErrorMapper.fromAuthException(e);
    } catch (_) {
      throw AuthFailure.network();
    }
  }

  Future<UserModel> signup(String email, String password) async {
    try {
      final respone = await supabase.auth.signUp(
        email: email,
        password: password
      );

      final user = respone.user;

      if (user == null) throw AuthFailure.unknown("สมัครสมาชิกไม่สำเร็จ! ลองใหม่อีกครั้ง");

      if (user.identities != null && user.identities!.isEmpty) {
        throw AuthFailure.emailAlreadyInUse();
      }

      final userId = user.id;

      try {
        // insert profiles 
        await supabase.from("profiles").insert({
          "id" : userId,
          "role" : "patient",
          "title" : null,
          "first_name" : null,
          "last_name" : null,
          "gender" : null,
          "age" : null,
          "number" : null
        });

        //  insert patient
        await supabase.from("patient").insert({
          "id" : userId,
          "weight" : null,
          "height" : null,
          "ud" : null,
          "dah" : null,
          "fah" : null,
          "pmh" : null,
        });

      } on PostgrestException  catch(e) {
        await supabase.auth.admin.deleteUser(userId);
        throw AuthFailure.databaseError(e.message);
      }
    
      return UserModel(
        id: user.id,
        email: user.email!,
      );

    } on AuthFailure {
      rethrow;
    } on AuthException  catch (e) {
      print(e.message);
      throw AuthErrorMapper.fromAuthException(e);
    } catch (_) {
      throw AuthFailure.network();
    }
  }

  // Future<void> signout() async {
  //   try {
  //     await supabase.auth.signOut();
  //   } on AuthException  catch (e) {
  //     throw AuthErrorMapper.fromAuthException(e);
  //   } catch (_) {
  //     throw AuthFailure.network();
  //   }
  // }

  // Future<UserModel> getCurrentUser() async {
  //   try {
  //     final user = supabase.auth.currentUser;

  //     if (user == null) {
  //       throw AuthFailure.sessionExpired();
  //     }

  //     return UserModel(
  //       id: user.id,
  //       email: user.email!
  //     );

  //   } on AuthFailure {
  //     rethrow;
  //   } on AuthException catch (e) {
  //     throw AuthErrorMapper.fromAuthException(e);
  //   } catch (_) {
  //     throw AuthFailure.network();
  //   }
  // }

}