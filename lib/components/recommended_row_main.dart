import 'package:deep_breath/components/size_config.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'inkwell_on_Image.dart';

class RecommendedRowMain extends StatelessWidget {
  const RecommendedRowMain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: Stack(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(242),
                  height: getProportionateScreenWidth(100),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/addiction.gif',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: recommendedLinearGradient(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(15),
                              vertical: getProportionateScreenWidth(10)),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(color: kWhiteColor),
                              children: [
                                TextSpan(
                                  text: "Digital Accessories\n",
                                  style: bannerTextStyle(),
                                ),
                                TextSpan(
                                  text: 'Unbeatable Prices!',
                                  style: bannerSubTextStyle(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWellOnImage()
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: Stack(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(242),
                  height: getProportionateScreenWidth(100),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/crying.gif',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: recommendedLinearGradient(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(15),
                              vertical: getProportionateScreenWidth(10)),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(color: kWhiteColor),
                              children: [
                                TextSpan(
                                  text: "Home Appliances\n",
                                  style: bannerTextStyle(),
                                ),
                                TextSpan(
                                  text: 'Up-to 40% Off!',
                                  style: bannerSubTextStyle(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: kPrimaryColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
            child: Stack(
              children: [
                SizedBox(
                  width: getProportionateScreenWidth(242),
                  height: getProportionateScreenWidth(100),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/falling.gif',
                          fit: BoxFit.cover,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: recommendedLinearGradient(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(15),
                              vertical: getProportionateScreenWidth(10)),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(color: kWhiteColor),
                              children: [
                                TextSpan(
                                  text: "Phones and Laptops\n",
                                  style: bannerTextStyle(),
                                ),
                                TextSpan(
                                  text: 'Amazing Prizes + Quick Delivery!',
                                  style: bannerSubTextStyle(),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: kPrimaryColor.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(20)),
        ],
      ),
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

  TextStyle bannerSubTextStyle() {
    return TextStyle(
        color: kWhiteColor,
        fontWeight: FontWeight.bold,
        backgroundColor: kPrimaryColor.withOpacity(0.5));
  }

  TextStyle bannerTextStyle() {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: getProportionateScreenWidth(16),
    );
  }
}
