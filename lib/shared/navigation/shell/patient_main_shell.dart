import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/appointment/appointment.dart';
import '../../../features/chat/chat.dart';
import '../../../features/discover/discover.dart';
import '../../../features/prescription/prescription.dart';
import '../../../features/profile/presentation/controller/profile_provider.dart';
import '../../../features/profile/presentation/pages/profile_patient.dart';
import '../../theme/app_color.dart';
import '../items/patient_bav_items.dart';

class PatientMainShell extends StatefulWidget {
  const PatientMainShell({super.key});

  @override
  State<PatientMainShell> createState() => _PatientMainShellState();
}

class _PatientMainShellState extends State<PatientMainShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    PrescriptionPage(),
    AppointmentPage(),
    ChatPage(),
    DiscoverPage(),
    ProfilePatientPage(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileProvider>().getProfile();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index:  _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        
        padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 5),
        decoration: BoxDecoration(
          color: AppMainColor.base,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            items: patientNavItems,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            selectedItemColor: AppMainColor.green4,
            unselectedItemColor: AppMainColor.grey4,
            selectedIconTheme: IconThemeData(
              color: AppMainColor.green4,
              size: 35,
            ),
            unselectedIconTheme: IconThemeData(
              color: AppMainColor.grey4,
              size: 35,
            ),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            elevation: 0,
            enableFeedback: false,
            onTap: (index) => setState(() {
              _currentIndex = index;
            }),
          ),
        ),
      ),
    );
  }
}