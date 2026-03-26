import 'package:flutter/material.dart';

import '../../../../shared/theme/app_color.dart';

class Auth_Btn extends StatefulWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onTap;
  const Auth_Btn({
    super.key, 
    required this.text, 
    required this.onTap, 
    required this.isLoading
  });

  @override
  State<Auth_Btn> createState() => _Auth_BtnState();
}

class _Auth_BtnState extends State<Auth_Btn> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: widget.onTap,
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppMainColor.green4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Center(
        child: widget.isLoading 
        ? SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2.5,
          ),
        ) 
        : SizedBox(
          height: 20,
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}