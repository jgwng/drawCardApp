import 'package:flutter/material.dart';
class AuthTFT extends StatefulWidget {

  final TextEditingController? controller;
  final String labelText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final Icon? suffixIcon;
  final bool obscureText;
  final FocusNode? focusNode;
  final Function(String)? function;
  final Function(String)? submitFunction;

  const AuthTFT({required this.labelText, this.validator,this.controller,this.focusNode,this.submitFunction,
    this.function, this.suffixIcon, this.obscureText = false, this.keyboardType});

  @override
  _AuthTFTState createState() => _AuthTFTState();
}

class _AuthTFTState extends State<AuthTFT>{
  bool? isObscureText;
  bool? isPw;
  List<String> obscureLabel = ['비밀번호',''];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.labelText);
    print(widget.labelText == '');
    isObscureText = widget.obscureText;
    isPw = obscureLabel.contains(widget.labelText);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      margin: EdgeInsets.only(top:20,left:20,right:20),
      child: TextFormField(
        obscureText: isPw! ? isObscureText! : widget.obscureText,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        controller: widget.controller ?? TextEditingController(),
        focusNode: widget.focusNode ?? FocusNode(),
        cursorColor: Colors.black,
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: widget.function,
        onFieldSubmitted: widget.submitFunction,
        decoration: InputDecoration(
            labelText: widget.labelText,
            suffixIcon: isPw! ? IconButton(
              onPressed: (){
                setState(() {
                  isObscureText = !isObscureText!;
                });
              },
              icon: Icon(isObscureText! ? Icons.visibility_off : Icons.visibility),
            ) : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  color:Colors.black),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(color: Colors.black),
            )),
      ),
    );
  }
}