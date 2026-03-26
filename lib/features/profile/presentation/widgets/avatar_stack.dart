import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/theme/app_color.dart';

class AvatarStack extends StatelessWidget {
  const AvatarStack({super.key});
  

  @override
  Widget build(BuildContext context) {

    final List<String> user = [
    'assets/img/user1.png',
    'assets/img/doctor1.png',
    'assets/img/doctor1.png',
    'assets/img/doctor1.png',
    'assets/img/doctor1.png',
  ];

  int length = 0;
  if (user.length > 3) {
    length = 3;
  } else {
    length = user.length;
  }
  
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        SizedBox(
          height: 58,
          width: 200,
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(
              length+1, (index) {
        
                if (index == length) {
                  return Positioned(
                    left: index * 28.5,
                    child: CircleAvatar(
                      backgroundColor: AppMainColor.base,
                      radius: 25,
                      child: CircleAvatar(
                        backgroundColor: AppMainColor.grey2,
                        radius: 21,
                        child: Icon(
                          Icons.more_horiz_outlined,
                          size: 35,
                          color: AppMainColor.base,
                        ),
                      ),
                    )
                  );
                }
        
                return Positioned(
                  left: index * 28.5,
                  child: CircleAvatar(
                    backgroundColor: AppMainColor.base,
                    radius: 26,
                    child: CircleAvatar(
                      radius: 21,
                      backgroundImage: AssetImage(user[index]),
                    ),
                  )
                );
              }).reversed.toList()
          ),
        ),

        Icon(
          Icons.arrow_forward_ios_rounded,
          size: 26,
          color: Colors.black87,
        ),
      ],
    );
  }
}