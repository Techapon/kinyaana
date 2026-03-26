
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

List<BottomNavigationBarItem> patientNavItems = [
  BottomNavigationBarItem(
    icon:   HugeIcon(icon: HugeIcons.strokeRoundedPrescription,size: 30,),
    label: 'Prescription',
  ),
  BottomNavigationBarItem(
    icon:   HugeIcon(icon: HugeIcons.strokeRoundedCalendar03, size: 30,),
    label: 'Appointment',
  ),
  BottomNavigationBarItem(
    icon:   HugeIcon(icon: HugeIcons.strokeRoundedBubbleChat, size: 30,),
    label: 'Chat',
  ),
  BottomNavigationBarItem(
    icon:   HugeIcon(icon: HugeIcons.strokeRoundedDiscoverCircle, size: 30,),
    label: 'Discover',
  ),
  BottomNavigationBarItem(
    icon:   HugeIcon(icon: HugeIcons.strokeRoundedUser, size: 30,),
    label: 'Profile',
  ),
];