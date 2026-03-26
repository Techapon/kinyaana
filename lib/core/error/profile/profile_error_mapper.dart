import 'package:supabase_flutter/supabase_flutter.dart';
 
import 'profile_failure.dart';
 
class ProfileErrorMapper {
  ProfileErrorMapper._();
 
  static ProfileFailure fromAuthException(AuthException e) {
    final msg = e.message.toLowerCase();
 
    if (msg.contains('session_not_found') ||
        msg.contains('refresh_token_not_found') ||
        msg.contains('token is expired')) {
      return ProfileFailure.sessionExpired();
    }
   
    // ── Fallback ────────────────────────────────────────────────────────────
    return ProfileFailure.unknown(e.message);
  }
 
  /// แปลง error ทั่วไป (non-AuthException)
  static ProfileFailure fromUnknown(Object e) {
    return ProfileFailure.unknown(e.toString());
  }
}