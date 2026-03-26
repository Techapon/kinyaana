import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kinyaana/features/profile/presentation/controller/profile_provider.dart';
import 'package:kinyaana/shared/theme/app_color.dart';
import 'package:provider/provider.dart';

class PatientEditPage extends StatelessWidget {
  const PatientEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();

    return Scaffold(
      backgroundColor: AppMainColor.base,
      body: SafeArea(
        child: Center(
          child: Text(
            "Hello : ${profileProvider.profile == null ? "Loading" : profileProvider.profile!.fullname}"
          ),
        ),
      ),
    );
  }
}