import 'package:flutter/material.dart';

import '../../../../shared/theme/app_color.dart';

class EditBtn extends StatefulWidget {
  final VoidCallback onTap;

  const EditBtn({
    super.key,
    required this.onTap
  });

  @override
  State<EditBtn> createState() => _EditBtnState();
}

class _EditBtnState extends State<EditBtn> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppMainColor.green3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsetsGeometry.all(18),
      ),
      onPressed: widget.onTap,
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.edit_outlined,
            size: 24,
            color: AppMainColor.base,
          ),
          Text(
            'แก้ไขข้อมูล/ประวัติของฉัน',
            style: TextStyle(
              fontSize: 16,
              color: AppMainColor.base,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      )
    );
  }
}