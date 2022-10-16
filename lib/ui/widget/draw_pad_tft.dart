import 'package:flutter/material.dart';

class DrawPadTFT extends StatefulWidget {
  const DrawPadTFT(
      {Key? key,
      required this.controller,
      required this.node,
      this.label = '',
      this.onFieldSubmitted,
      this.validator,
      this.suffixList,
      this.showPrefix = false,
      this.showSuffix = false,
      this.onChanged,
      this.isReadOnly = false,
      this.isPW = false})
      : super(key: key);
  final TextEditingController controller;
  final FocusNode node;
  final Function(String?)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final String? label;
  final bool showSuffix;
  final bool showPrefix;
  final List<Widget>? suffixList;
  final Function(String)? onChanged;
  final bool? isPW;
  final bool? isReadOnly;
  @override
  _DrawPadTFTState createState() => _DrawPadTFTState();
}

class _DrawPadTFTState extends State<DrawPadTFT> {
  bool showSuffix = false;
  bool isObscure = true;
  @override
  void initState() {
    super.initState();
    if (widget.isPW == false) {
      isObscure = false;
    }
    widget.controller.addListener(() {
      setState(() {
        if (widget.controller.text.isNotEmpty &&
            !(widget.isReadOnly ?? false)) {
          showSuffix = true;
        } else {
          showSuffix = false;
        }
      });
    });

    widget.node.addListener(() {
      setState(() {
        print('aa');
        if (widget.node.hasFocus) {
          showSuffix = widget.controller.text.isNotEmpty;
        } else {
          showSuffix = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: widget.controller,
      focusNode: widget.node,
      cursorColor: Colors.white,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator,
      maxLines: 1,
      readOnly: widget.isReadOnly ?? false,
      onChanged: (text) {
        if (widget.onChanged != null) {
          widget.onChanged!(text);
        }
      },
      obscureText: isObscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          prefixIcon: (widget.showPrefix)
              ? const Icon(Icons.search, size: 30, color: Colors.white38)
              : null,
          isDense: true,
          errorStyle: const TextStyle(fontSize: 13, color: Colors.red),
          hintText: widget.label,
          hintStyle: TextStyle(fontSize: 16, color: Colors.grey[400]),
          enabledBorder: border,
          suffixIcon: Visibility(
            visible: showSuffix,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.suffixList != null) ...widget.suffixList!,
                if (widget.isPW ?? false)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                  ),
                IconButton(
                  onPressed: () {
                    widget.controller.clear();
                    if (widget.onChanged != null) {
                      widget.onChanged!(widget.controller.text);
                    }
                  },
                  icon:
                      const Icon(Icons.clear, size: 24, color: Colors.white38),
                )
              ],
            ),
          ),
          focusedBorder: border,
          border: border,
          errorBorder: border.copyWith(
              borderSide: const BorderSide(width: 1, color: Colors.red))),
    );
  }

  OutlineInputBorder get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: Colors.white),
      );
}
