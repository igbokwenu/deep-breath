import 'package:flutter/material.dart';
import 'constants.dart';

//Put image in a stack and put the class below at the bottom of the stack to implement inkwell splash
class InkWellOnImage extends StatelessWidget {
  const InkWellOnImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: kPrimaryColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
        ),
      ),
    );
  }
}
