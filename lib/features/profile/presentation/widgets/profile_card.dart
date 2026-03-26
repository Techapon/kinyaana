import 'package:flutter/material.dart';

import '../../../../shared/theme/app_color.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsGeometry.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppMainColor.grey2,
          width: 2,
        )
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            height: 65,
            child: Image.asset(
              'assets/icons/history.png',
              color: AppMainColor.grey5,
            ),
          ),

          SizedBox(width: 22),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ประวัติของฉัน',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black
                  ),
                ),
                Text(
                  "ชื่อจริง,นามสกุล,เพศ,อายุ,นํ้าหนัก,ส่วนสูง,โรคประจำตัว,ประวัติการแพ้ยา,ประวัติการแพ้อาหาร,ประวัติการรักษา",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppMainColor.grey4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}