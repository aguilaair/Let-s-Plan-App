import 'package:flutter/material.dart';



class MyBackButton extends StatelessWidget {
 final bool _enablePadding;
 final bool _colWhite;

 MyBackButton([this._enablePadding = false, this._colWhite = false]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _enablePadding ? const EdgeInsets.only(left: 20, right: 20, top: 20) : const EdgeInsets.all(0),
      child: Hero(
        tag: 'backButton',
          child: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: _colWhite ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}