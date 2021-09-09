import 'package:deep_breath/components/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryColorB = Color(0xFFFFA53E);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kBlackColor = Colors.black;
const kBlackTextColor = Colors.black;
Color kPrimaryGreyColor = Colors.grey;
const kWhiteColor = Colors.white;
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Email field cannot be empty";
const String kInvalidEmailError = "Please enter a valid email";
const String kPassNullError = "Please enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

TextStyle bannerSubTextStyle() {
  return TextStyle(
      color: kWhiteColor,
      fontWeight: FontWeight.bold,
      backgroundColor: kPrimaryColor.withOpacity(0.5),
      fontSize: getProportionateScreenWidth(20));
}

TextStyle bannerTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: getProportionateScreenWidth(16),
  );
}

LinearGradient recommendedLinearGradient() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      kBlackColor.withOpacity(0.4),
      kBlackColor.withOpacity(0.05),
    ],
  );
}
