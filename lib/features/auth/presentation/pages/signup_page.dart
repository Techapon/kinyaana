import 'package:flutter/material.dart';
import 'package:kinyaana/features/auth/presentation/controller/auth_provider.dart';
import 'package:provider/provider.dart';

import '../../../../config/routes.dart';
import '../../../../shared/theme/app_color.dart';
import '../../../../shared/widgets/dialog/error/dialog_error.dart';
import '../../../../shared/widgets/dialog/success/dialog_success.dart';
import '../widgets/authbtn.dart';
import '../widgets/textfeid.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final confirmPasswordC = TextEditingController();

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    confirmPasswordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    // Dialog
    if (auth.error != null) {
      final errorMsg = auth.error!;
      auth.error = null;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showErrorDialog(
          context: context,
          message: errorMsg,
        );
      });
    }

    return Scaffold(
      backgroundColor: AppMainColor.base,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Green header with back button and illustration
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                // right: 36,
                // bottom: 36,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppMainColor.green2,
                    AppMainColor.green3,
                  ],
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(36),
                ),
              ),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                
                    SizedBox(height: 16),
                
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                      
                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "สร้างบัญชีใหม่",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "กรอกข้อมูลด้านล่างเพื่อสมัครสมาชิก",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.85),
                                  fontSize: 14,
                                ),
                              ),
                            SizedBox(height: 36)
                            ],
                          ),
                      
                          // Logo fixed at top-right
                          Positioned(
                            right: 20,
                            top: 0,
                            child: Container(
                              height:75,
                              child: Image.asset(
                                'assets/logo/only_logo.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          ],
                        ),
                      ),
                    ),
                
                  ],
                ),
              ),
            ),
      
            // Form content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
                  // Email field
                  Text(
                    "อีเมล",
                    style: TextStyle(
                      color: AppMainColor.green5,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Custom_Textfeild(
                    hint: 'กรอกอีเมล',
                    type: TextInputType.emailAddress,
                    obscureText: false,
                    controller: emailC,
                    errorText: auth.errorEmail,
                  ),
      
                  SizedBox(height: 24),
      
                  // Password field
                  Text(
                    "รหัสผ่าน",
                    style: TextStyle(
                      color: AppMainColor.green5,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Custom_Textfeild(
                    hint: 'กรอกรหัสผ่าน',
                    type: TextInputType.text,
                    obscureText: true,
                    controller: passwordC,
                    errorText: auth.errorPassword,
                  ),
      
                  SizedBox(height: 24),
      
                  // Confirm password field
                  Text(
                    "ยืนยันรหัสผ่าน",
                    style: TextStyle(
                      color: AppMainColor.green5,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 6),
                  Custom_Textfeild(
                    hint: 'กรอกรหัสผ่านอีกครั้ง',
                    type: TextInputType.text,
                    obscureText: true,
                    controller: confirmPasswordC,
                    errorText: auth.errorConfirmPassword,
                  ),
      
                  SizedBox(height: 24),
      
                  // Sign up button
                  Auth_Btn(
                    text: 'สมัครสมาชิก',
                    isLoading: auth.isLoading,
                    onTap: () {
                      if (auth.isLoading) return;
                      auth.signup(
                        emailC.text.trim(),
                        passwordC.text.trim(),
                        confirmPasswordC.text.trim(),
                      );

                      if (auth.isLoggedIn) {
                        showSuccessDialog(
                          context: context,
                          message: "สมัครสมาชิกสำเร็จ กรุณายืนยันอีเมล",
                        );
                      }
                    },
                  ),
      
                  SizedBox(height: 12),
      
                  // Navigate to login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "มีบัญชีอยู่แล้ว?",
                        style: TextStyle(
                          color: AppMainColor.grey3,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          if (auth.isLoading) return;
                          Navigator.pop(context);
                          auth.clearError();
                        },
                        child: Text(
                          "เข้าสู่ระบบ",
                          style: TextStyle(
                            color: AppMainColor.green4,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}