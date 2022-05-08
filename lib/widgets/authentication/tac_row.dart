import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'tac_input_field.dart';
class TacRow extends StatefulWidget {
  final bool hasError;
  final Function() onChanged;
  final Function() successCallback;
  final Function() failCallback;
  final Function(String) setTacCode;
  final String tacCode;
  final Color activeColor;
  const TacRow({ Key? key,
    required this.hasError,
    required this.onChanged,
    required this.tacCode,
    required this.successCallback,
    required this.failCallback,
    required this.setTacCode,
    this.activeColor = Colors.black, }) : super(key: key);

  @override
  State<TacRow> createState() => _TacRowState();
}

class _TacRowState extends State<TacRow> {
  late TextEditingController tac1;
  late TextEditingController tac2;
  late TextEditingController tac3;
  late TextEditingController tac4;
  late FocusNode tac1Node;
  late FocusNode tac2Node;
  late FocusNode tac3Node;
  late FocusNode tac4Node;

  @override
  void initState() {
    tac1 = TextEditingController();
    tac1Node = FocusNode();
    tac2 = TextEditingController();
    tac2Node = FocusNode();
    tac3 = TextEditingController();
    tac3Node = FocusNode();
    tac4 = TextEditingController();
    tac4Node = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    tac1.dispose();
    tac2.dispose();
    tac3.dispose();
    tac4.dispose();
    tac1Node.dispose();
    tac2Node.dispose();
    tac3Node.dispose();
    tac4Node.dispose();
    super.dispose();
  }

  void Function()? checkTacCode() {
    String text1 = tac1.text;
    String text2 = tac2.text;
    String text3 = tac3.text;
    String text4 = tac4.text;

    FocusScope.of(context).unfocus();

    if ('$text1$text2$text3$text4' == widget.tacCode) {
      widget.successCallback();
    } else {
      widget.failCallback();
    }
  }

  void Function()? updateTac() {
    String text1 = tac1.text;
    String text2 = tac2.text;
    String text3 = tac3.text;
    String text4 = tac4.text;
    widget.setTacCode('$text1$text2$text3$text4');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TacInputField(
            activeColor: widget.activeColor,
            controller: tac1,
            currentFocusNode: tac1Node,
            nextFocusNode: tac2Node,
            hasError: widget.hasError,
            onChanged: () {
              updateTac();
              widget.onChanged();
            },
          ),
          TacInputField(
            activeColor: widget.activeColor,
            controller: tac2,
            previousFocusNode: tac1Node,
            currentFocusNode: tac2Node,
            nextFocusNode: tac3Node,
            hasError: widget.hasError,
            onChanged: () {
              updateTac();
              widget.onChanged();
            },
          ),
          TacInputField(
            activeColor: widget.activeColor,
            controller: tac3,
            previousFocusNode: tac2Node,
            currentFocusNode: tac3Node,
            nextFocusNode: tac4Node,
            hasError: widget.hasError,
            onChanged: () {
              updateTac();
              widget.onChanged();
            },
          ),
          TacInputField(
            activeColor: widget.activeColor,
            controller: tac4,
            previousFocusNode: tac3Node,
            currentFocusNode: tac4Node,
            textInputAction: TextInputAction.done,
            hasError: widget.hasError,
            onSubmitted: (_) => checkTacCode(),
            onChanged: () {
              updateTac();
              widget.onChanged();
            },
          ),
        ],
      ),
    );
  }
}
