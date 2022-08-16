import 'package:deep_breath/components/size_config.dart';
import 'package:deep_breath/components/textConstants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//works with url_launcher package
Future<void> launchHollysWebsite() async {
  final Uri _url = Uri.parse(hollysWebsite);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

Future<void> launchAlansWebsite() async {
  final Uri _url = Uri.parse(alansWebsite);
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

Future<void> launchHollysMail() async {
  final Uri _url = Uri(
      scheme: 'mailto',
      path: hollysEmail,
      queryParameters: {'subject': 'From Deep Breath App'});
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

Future<void> launchAlansMail() async {
  final Uri _url = Uri(
      scheme: 'mailto',
      path: alansEmail,
      queryParameters: {'subject': 'From Deep Breath App'});
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}

//final currentWidth = MediaQuery.of(context).size.width;
const mobileWidth = 550;
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
      fontSize: getProportionateScreenWidth(15));
}

TextStyle bannerTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: getProportionateScreenWidth(20),
    fontStyle: FontStyle.italic,
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

BoxDecoration backGroundGradient() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.greenAccent, Colors.orange, Colors.lightGreenAccent],
    ),
  );
}

LinearGradient linearGradient() {
  return LinearGradient(colors: [Colors.green, Colors.blue.withOpacity(0.3)]);
}
