import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/config.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    required this.value,
    required this.onChanged,
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.value == false
            ? widget.onChanged(true)
            : widget.onChanged(false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 56.0.w,
        height: 32.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: !widget.value ? Config.colors.kTextGrey2 : Config.colors.kPrimary,
        ),
        child: Padding(
          padding: EdgeInsets.all(
            4.0.w,
          ),
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            alignment:
                widget.value ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              width: 24.0.w,
              height: 24.0.w,
              decoration:
                 const  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
