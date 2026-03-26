import 'package:flutter/material.dart';
import 'package:kinyaana/shared/theme/app_color.dart';
import 'package:provider/provider.dart';

import '../../../../config/routes.dart';
import '../controller/auth_provider.dart';
import '../widgets/authbtn.dart';
import '../../../../shared/widgets/dialog/error/dialog_error.dart';
import '../widgets/textfeid.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvi = context.watch<AuthProvider>();

    // Dialog
    if (authProvi.error != null) {
      final errorMsg = authProvi.error!;
      authProvi.error = null;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showErrorDialog(
          context: context,
          message: errorMsg,
        );
      });
    }

    return Scaffold(
      backgroundColor: AppMainColor.green1,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              
              // App logo
              Container(
                width: double.infinity,
                height: 275,
                child: Image.asset(
                  'assets/logo/logo.png',
                  fit: BoxFit.contain,
                ),
              ),

              // App content
              
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(
                    top: 36,
                    left: 36,
                    right: 36,
                  ),

                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(36),
                    ),
                  ),

                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "เข้าสู่ระบบ",
                          style: TextStyle(
                            color: AppMainColor.green4,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 24,),

                        // Main content

                        Custom_Textfeild(
                          hint: 'อีเมล',
                          type: TextInputType.text,
                          obscureText: false,
                          controller: emailC,
                          errorText: authProvi.errorEmail,
                        ),

                        SizedBox(height: 12,),

                        Custom_Textfeild(
                          hint: 'รหัสผ่าน',
                          type: TextInputType.text,
                          obscureText: true,
                          controller: passwordC,
                          errorText: authProvi.errorPassword,
                        ),

                        // ---------

                        SizedBox(height: 24,),

                        Auth_Btn(
                          text: 'เข้าสู่ระบบ',
                          isLoading: authProvi.isLoading,
                          onTap: () async {
                            if (authProvi.isLoading) return;
                            await authProvi.login(
                              emailC.text.trim(),
                              passwordC.text.trim(),
                            );

                            if (authProvi.isLoggedIn) {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.patientMainShell,
                              );
                            }
                          },
                        ),

                        SizedBox(height: 12,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text("ยังไม่มีบัญชี?สมัครได้ที่นี่", style: TextStyle(
                              color: AppMainColor.grey3,
                              fontSize: 14,
                            ),),

                            TextButton(
                              onPressed: () {
                                if (authProvi.isLoading) return;
                                Navigator.pushNamed(
                                  context,
                                  AppRoutes.signup,
                                );
                                authProvi.clearError();
                              },
                              child: Text("สมัครสมาชิก", style: TextStyle(
                                color: AppMainColor.green4,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}