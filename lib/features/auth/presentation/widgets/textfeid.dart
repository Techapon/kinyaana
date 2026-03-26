
import 'package:flutter/material.dart';

import '../../../../shared/theme/app_color.dart';

class Custom_Textfeild extends StatefulWidget {
  final String hint;
  final TextInputType type;
  final bool obscureText;

  final TextEditingController controller;
  final String? errorText;

  const Custom_Textfeild({
    super.key, 
    required this.hint, 
    required this.type, 
    required this.obscureText,
    required this.controller,
    this.errorText,
  });

  @override
  State<Custom_Textfeild> createState() => _Custom_TextfeildState();
}

class _Custom_TextfeildState extends State<Custom_Textfeild> {
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _isPasswordVisible = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Feild
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: AppMainColor.grey3,
            ),
            filled: true,
            fillColor: AppMainColor.green0,
            contentPadding:  EdgeInsets.symmetric(
                horizontal: 16.0 * 1.5, vertical: 16.0),
        
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.errorText != null ? AppMainColor.error : AppMainColor.base,
                width: 2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.errorText != null ? AppMainColor.error : AppMainColor.base,
                width: widget.errorText != null ? 2 : 0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            //--------
        
            suffixIcon: widget.obscureText
            ? IconButton(
              highlightColor: Colors.transparent,
                icon: Icon(
                  _isPasswordVisible
                      ? Icons.lock_rounded
                      : Icons.lock_open_rounded,
                  color: AppMainColor.green3,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
            
          ),
          keyboardType: widget.type,
        
          obscureText: _isPasswordVisible ,
        ),

        // Error warnign
        widget.errorText != null 
        ? Text(
          widget.errorText ?? "",
          style: TextStyle(
            color: AppMainColor.error,
            fontSize: 12,
            height: 1.65
          ),
        ) 
        : SizedBox.shrink(),

      ],
    );
  }
}