import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class TacInputField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? nextFocusNode;
  final FocusNode? previousFocusNode;
  final FocusNode? currentFocusNode;
  final TextInputAction textInputAction;
  final Function(String)? onSubmitted;
  final Function() onChanged;
  final bool hasError;
  final Color activeColor;
  const TacInputField({ Key? key,
    required this.controller,
    this.currentFocusNode,
    this.nextFocusNode,
    this.previousFocusNode,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    required this.onChanged,
    this.hasError = false,
    this.activeColor = Colors.black, }) : super(key: key);

  @override
  State<TacInputField> createState() => _TacInputFieldState();
}

class _TacInputFieldState extends State<TacInputField> {
  late bool filled;
  @override
  void initState() {
    filled = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      child: TextField(
        style: widget.hasError
            ? Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Config.colors.kTextError)
            : Theme.of(context).textTheme.headline2!.copyWith(
                  color: widget.activeColor,
                ),
        controller: widget.controller,
        focusNode: widget.currentFocusNode,
        textInputAction: widget.textInputAction,
        maxLength: 1,
        textAlign: TextAlign.center,
        showCursor: false,
        onChanged: (String text) {
          widget.onChanged();
          if (text != '') {
            setState(() {
              filled = true;
            });
            FocusScope.of(context).requestFocus(widget.nextFocusNode);
          } else {
            setState(() {
              filled = false;
            });
            FocusScope.of(context).requestFocus(widget.previousFocusNode);
          }
        },
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget.activeColor,
            ),
          ),
          enabledBorder: filled
              ? widget.hasError
                  ? UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Config.colors.kTextError,
                      ),
                    )
                  : UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.activeColor,
                      ),
                    )
              : UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Config.colors.kTextGrey3,
                  ),
                ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: widget.activeColor,
            ),
          ),
          hintText: '0',
          hintStyle: Theme.of(context).textTheme.headline2!.copyWith(
                color: Config.colors.kTextGrey3,
              ),
          counterText: '',
        ),
      ),
    );
  }
}
