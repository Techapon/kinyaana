import 'profile_error_type.dart';

class ProfileFailure implements Exception {
  final ProfileErrorType type;
  final String message;

  const ProfileFailure({
    required this.type,
    required this.message,
    this.debugMessage,
  });

  final String? debugMessage;

  factory ProfileFailure.sessionExpired() => const ProfileFailure(
        type: ProfileErrorType.sessionExpired,
        message: 'เซสชันหมดอายุ กรุณาเข้าสู่ระบบใหม่',
      );

  factory ProfileFailure.databaseError([String? debugMessage]) => ProfileFailure(
        type: ProfileErrorType.databaseError,
        message: 'เกิดข้อผิดพลาดในการดึงข้อมูล กรุณาลองใหม่',
        debugMessage: debugMessage,
      );

  factory ProfileFailure.network([String? debugMessage]) => ProfileFailure(
        type: ProfileErrorType.network,
        message: 'เกิดข้อผิดพลาดด้านเครือข่าย กรุณาตรวจสอบการเชื่อมต่อ',
        debugMessage: debugMessage,
      );

  factory ProfileFailure.unknown([String? debugMessage]) => ProfileFailure(
        type: ProfileErrorType.unknown,
        message: 'เกิดข้อผิดพลาด กรุณาลองใหม่อีกครั้ง',
        debugMessage: debugMessage,
      );

  @override
  String toString() => message;
}