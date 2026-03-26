import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kinyaana/features/profile/presentation/controller/profile_provider.dart';
import 'package:kinyaana/features/profile/presentation/widgets/avatar_stack.dart';
import 'package:kinyaana/shared/theme/app_color.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../config/routes.dart';
import '../widgets/edit_btn.dart';
import '../widgets/profile_card.dart';

class ProfilePatientPage extends StatefulWidget {
  const ProfilePatientPage({super.key});

  @override
  State<ProfilePatientPage> createState() => _ProfilePatientPageState();
}

class _ProfilePatientPageState extends State<ProfilePatientPage> {

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    
    return Scaffold(
      backgroundColor: AppMainColor.grey1,
      body: SafeArea(
        
        child: Column(
          children: [

            Container(
              color: AppMainColor.grey1,
              height: 153,
            ),

            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  
                  // Main content
                  Container(
                    width: double.infinity,
                    padding: EdgeInsetsGeometry.only(
                      left: 24,
                      right: 24,
                      top: 80,
                    ),
                    decoration: BoxDecoration(
                      color: AppMainColor.base,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(30),
                      ),
                    ),

                    child: Column(
                      spacing: 24,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        // name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profileProvider.profile == null ? 'Loading...' : profileProvider.profile!.fullname,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              profileProvider.profile == null ? 'Loading...' : profileProvider.profile!.email,
                              style: TextStyle(
                                fontSize: 16,
                                color: AppMainColor.grey5,
                              ),
                            ),

                            // Text(
                            //   "อายุรแพทย์โรคหัวใจ (Cardiologist)",
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     color: AppMainColor.blue,
                            //   ),
                            // ),

                            // Row(
                            //   spacing: 5,
                            //   children: [
                            //     Image.asset(
                            //       'assets/icons/location.png',
                            //       width: 20,
                            //       height: 20,
                            //       color: AppMainColor.grey4,
                            //     ),
                            //     Text(
                            //       'โรงพยาบาลกรุงเทพ',
                            //       style: TextStyle(
                            //         fontSize: 16,
                            //         color: AppMainColor.grey4,
                            //       ),
                            //     ),
                            //   ],
                            // )

                          ],
                        ),
                      
                        // AvatarStack(),

                        // Card

                        ProfileCard(),


                        // Edit Btn
                        EditBtn(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.patientEdit);
                          },
                        ),

                      ],
                    ),
                  ),

                  // profile image
                  Positioned(
                    top: -60,
                    left: 24,
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: AppMainColor.base,

                      child: CircleAvatar(
                        radius: 57.5,
                        backgroundColor: AppMainColor.grey2,
                        backgroundImage: profileProvider.profile?.img != null
                            ? NetworkImage(profileProvider.profile!.img!)
                            : null,
                        child: profileProvider.profile?.img == null
                            ? Icon(Icons.image, size: 45, color: Colors.white)
                            : null,
                      )
                    )
                  ),

                ],
              ),
            ),

          ],
        )
      ),
    );
  }
}