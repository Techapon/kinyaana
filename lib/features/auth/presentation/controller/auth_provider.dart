import 'package:flutter/material.dart';
import 'package:kinyaana/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:kinyaana/features/auth/data/repositoties/auth_repository_impl.dart';
import 'package:kinyaana/features/auth/domain/entities/user_entity.dart';

import '../../domain/usecase/login_usecase.dart';
import '../../domain/usecase/signup_usecase.dart';

class AuthProvider  extends ChangeNotifier {
    final loginUseCase = 
        LoginUseCase(AuthRepositoryImpl(AuthRemoteDataSource()));

    final signupUseCase = 
        SignupUseCase(AuthRepositoryImpl(AuthRemoteDataSource()));

    bool _isLoading = false;
    bool _isLoggedIn = false;
    String? error;

    String? errorEmail;
    String? errorPassword;
    String? errorConfirmPassword;
    UserEntity? _user;

    // Getter
    bool get isLoading => _isLoading;
    bool get isLoggedIn => _isLoggedIn;
    String? get userId => _isLoggedIn ? _user!.id : null;

    // Validate
    String? validateEmail(String email) {
        if (email.isEmpty) {
            return "กรุณากรอกอีเมล";
        }
        if (!email.contains("@")) {
            return "กรุณากรอกอีเมลให้ถูกต้อง";
        }
        return null;
    }

    String? validatePassword(String password) {
        if (password.isEmpty) {
            return "กรุณากรอกรหัสผ่าน";
        }
        if (password.length < 6) {
            return "รหัสผ่านต้องมีความยาวอย่างน้อย 6 ตัวอักษร";
        }
        return null;
    }

    String? validateConfirmPassword(String password, String confirmPassword) {
        if (confirmPassword.isEmpty) {
            return "กรุณากรอกรหัสผ่านอีกครั้ง";
        }
        if (password != confirmPassword) {
            return "รหัสผ่านไม่ตรงกัน";
        }
        return null;
    }

    //  Usecase
    Future<void> login(String email, String password) async {
        errorEmail = validateEmail(email);
        errorPassword = validatePassword(password);

        if (errorEmail != null || errorPassword != null) {
            notifyListeners();
            return;
        }
        

        _isLoading = true;
        notifyListeners();

        try {
            _user = await loginUseCase.call(email, password);
            error = null;
            _isLoggedIn = true;
        }catch (e) {
            error = e.toString();
        }

        _isLoading = false;
        notifyListeners();
    }


    Future<void> signup(
        String email,
        String password,
        String confirmPassword
    ) async {
        errorEmail = validateEmail(email);
        errorPassword = validatePassword(password);
        errorConfirmPassword = validateConfirmPassword(password, confirmPassword);

        if (errorEmail != null || errorPassword != null || errorConfirmPassword != null) {
            notifyListeners();
            return;
        }

        _isLoading = true;
        notifyListeners();

        try  {
            _user = await signupUseCase.call(email, password);
            error = null;
        }catch (e) {
            error = e.toString();
        }

        _isLoading = false;
        notifyListeners();
    }

    void clearError() {
        error = null;
        errorEmail = null;
        errorPassword = null;
        errorConfirmPassword = null;
        // notifyListeners();
    }

    
}