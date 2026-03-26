import 'package:flutter/material.dart';
import 'package:kinyaana/features/profile/presentation/pages/patient_edit.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/signup_page.dart';
import '../features/profile/presentation/pages/profile_patient.dart';
import '../shared/navigation/shell/patient_main_shell.dart';

class AppRoutes {
  static const login = "/login";
  static const signup = "/signup";
  static const profile = "/profile";

  // edit
  static const patientEdit = "/patient_edit";

  // shell
  static const patientMainShell = "/patient_main_shell";

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginPage(),
    signup: (context) => SignupPage(),
    profile: (context) => ProfilePatientPage(),
    patientEdit: (context) => PatientEditPage(),

    patientMainShell: (context) => PatientMainShell(),
  };
}