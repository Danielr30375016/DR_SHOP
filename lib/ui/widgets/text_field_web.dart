import 'package:flutter/material.dart';

class TextFieldWeb extends StatefulWidget {
  final BoxConstraints? constraints;
  final Function? onTap;
  const TextFieldWeb({super.key, this.constraints, this.onTap});

  @override
  State<TextFieldWeb> createState() => _TextFieldWebState();
}

class _TextFieldWebState extends State<TextFieldWeb> {
  final TextEditingController _controllerText = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerText;
  }

  @override
  void dispose() {
    super.dispose();
    _controllerText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _textField();
  }

  Widget _textField() {
    return Padding(
        padding: EdgeInsets.only(
            top: 20,
            left: widget.constraints!.maxWidth * 0.05,
            right: widget.constraints!.maxWidth * 0.05),
        child: SizedBox(
          width: widget.constraints!.maxWidth,
          height: 50,
          child: TextField(
            controller: _controllerText,
            onChanged: (value) {
              widget.onTap!(
                value,
              );
            },
          ),
        ));
  }
}
