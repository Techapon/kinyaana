import 'auth_error_type.dart';

class AuthFailure implements Exception {
  final AuthErrorType type;
  final String message;

  const AuthFailure({
    required this.type,
    required this.message,
    this.debugMessage,
  });

  final String? debugMessage;

  factory AuthFailure.invalidCredentials() => const AuthFailure(
        type: AuthErrorType.invalidCredentials,
        message: 'อีเมลหรือรหัสผ่านไม่ถูกต้อง',
      );

  factory AuthFailure.rateLimit() => const AuthFailure(
        type: AuthErrorType.rateLimit,
        message: 'คุณทำรายการบ่อยเกินไป กรุณารอสักครู่',
      );

  factory AuthFailure.emailNotConfirmed() => const AuthFailure(
        type: AuthErrorType.emailNotConfirmed,
        message: 'กรุณายืนยันอีเมลก่อนเข้าสู่ระบบ',
      );

  factory AuthFailure.emailAlreadyInUse() => const AuthFailure(
        type: AuthErrorType.emailAlreadyInUse,
        message: 'อีเมลนี้ถูกใช้งานแล้ว',
      );

  factory AuthFailure.sessionExpired() => const AuthFailure(
        type: AuthErrorType.sessionExpired,
        message: 'เซสชันหมดอายุ กรุณาเข้าสู่ระบบใหม่',
      );

  factory AuthFailure.databaseError([String? debugMessage]) => AuthFailure(
        type: AuthErrorType.databaseError,
        message: 'เกิดข้อผิดพลาดในการบันทึกข้อมูล กรุณาลองใหม่',
        debugMessage: debugMessage,
      );

  factory AuthFailure.network([String? debugMessage]) => AuthFailure(
        type: AuthErrorType.network,
        message: 'เกิดข้อผิดพลาดด้านเครือข่าย กรุณาตรวจสอบการเชื่อมต่อ',
        debugMessage: debugMessage,
      );

  factory AuthFailure.unknown([String? debugMessage]) => AuthFailure(
        type: AuthErrorType.unknown,
        message: 'เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง',
        debugMessage: debugMessage,
      );

  @override
  String toString() => message;
}