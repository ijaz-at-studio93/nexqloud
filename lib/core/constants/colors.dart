import 'package:flutter/material.dart';

const Color kWhite = Colors.white;
const Color kBlack = Colors.black;
const Color kRed = Colors.red;
const Color kTransparent = Colors.transparent;

const Color kBlueColor = Color(0xFF0014FF);
const Color kPurpleColor = Color(0xFF8020EF);
const Color kPinkColor = Color(0xFFFF2CDF);

const Color kBackgroundColor = Color(0xFF0B1228);
const Color textFieldFillColor = Color(0xFF3a3661);
const Color textFieldHintColor = Color(0xFF867890);
const Color textFieldIconColor = Color(0xFF867890);
const Color textFieldBorderColor = Color(0xFF010018);
const Color pageIndicatorColor = Color(0xFF6C6C6C);

const Color gradientColorOne = Color(0xFF33b1ff);
const Color gradientColorTwo = Color(0xFF6672ff);
const Color gradientColorThree = Color(0xFF9933ff);
const Color dividerColor = Color(0xFFDFA1ED);
const Color lightGray = Color(0xFFCACACA);
const Color textGray = Color(0xFFBABABA);
Color disabledGray = const Color(0xFFDADADA).withOpacity(0.25);
const Color pinkSorbet = Color(0xFFFF2CDF);
const Color textbalancecolor = Color(0xFFFFCDEA);
const Color bottomNavigationcolor = Color(0xFF301B57);
const Color errorcolor = Color(0xFFFF2121);
const Color mnemonicIndexColor = Color(0xFF8F8E9B);
const Color chipTextColor = Color(0xFF525252);
const Color bottomIconColor = Color(0xFFFAFAFA);

const Color tilePercentage = Color(0xFF20FC8F);
const Color tilePercentageNegitive = Color(0xFFFC2020);
const Color deviceListTileBackground = Color.fromRGBO(34, 21, 58, 1);
const Color carddividerColor = Color.fromRGBO(55, 48, 111, 1);
Color carddividerColorNew = Colors.white.withOpacity(0.2);
const Color yellow = Color(0xFFFA9F42);
Color barrierColor = const Color(0xFF262626).withOpacity(0.5);
Color newBarrierColor = const Color(0xFF000000).withOpacity(0.59);
Color tokenTileColor = const Color(0xFF282654);
//color with 20% opacity #FFFFFF
Color titlelightColor = const Color.fromARGB(51, 255, 255, 255);
// color with 10% opacity #CACACA
const Color lightGray10per = Color.fromARGB(25, 202, 202, 202);
// color with 15% opacity #CACACA
const Color lightGray15per = Color.fromARGB(39, 202, 202, 202);
//color with 15% opacity #F8F8F8
Color lightGray15per2 = const Color.fromARGB(39, 248, 248, 248);
//color with 14% opacity #FFFFFF
Color lightGray14per = const Color.fromARGB(36, 255, 255, 255);
Color zerotextcolor = const Color(0xFFFFCDEA).withOpacity(0.2);

Color smallLineGraphColor = const Color(0xFFFFFFFF).withOpacity(0.05);
Color bigLineGraphColor = const Color(0xFF373070);
const Color barChartGridColor = Color.fromRGBO(114, 114, 114, 1);

const Color deviceOnlineColor = Color(0x00fa9f42);
const Color deviceOnlineDarkColor = Color(0xFFFA9F42);
const Color deviceOfflineColor = Color(0x00f04438);
const Color deviceOfflineDarkColor = Color(0xFFF04438);
Color deviceNotConnectedColor = const Color(0x00ffffff).withOpacity(0.14);
Color deviceNotConnectedDarkColor = const Color(0xfffffffff).withOpacity(0.14);

const Color deviceOfflineStringColor = Color(0xFFFFFFFF);
const Color graphlinecolor1 = Color(0xFFFFCDEA);
const Color graphlinecolor2 = Color(0xFF7598EC);

const greyColor = Color(0xFF18181A);

const Color containerColor = Color(0xFF4A386E);
const Color offlineIndicatorColor = Color(0xFFFF3939);
const Color onlineContainerColor =
    Color.fromRGBO(162, 219, 255, 0.10999999940395355);
Color glowColor = const Color(0xFF3DA3FF).withOpacity(0.6);

const Color processingColor = Color(0xFFEFFF39);

const LinearGradient linearGradient = LinearGradient(
  colors: [
    gradientColorOne,
    gradientColorThree,
  ],
);

LinearGradient buttonLinearGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    gradientColorOne.withOpacity(0.6),
    gradientColorThree.withOpacity(0.9),
  ],
);

LinearGradient profileGradient = LinearGradient(
  colors: [
    gradientColorOne.withOpacity(0.6),
    gradientColorThree,
  ],
);

LinearGradient linearGradient2 = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    const Color(0xFFDEA9A9),
    const Color(0xFFFFFFFF).withOpacity(0),
  ],
);

const LinearGradient linearGradient3 = LinearGradient(
  colors: [
    gradientColorOne,
    gradientColorThree,
  ],
);
const LinearGradient verticallinearGradient = LinearGradient(
  colors: [
    gradientColorOne,
    gradientColorThree,
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);

const LinearGradient verticalLinearGradient2 = LinearGradient(
  colors: [
    gradientColorThree,
    gradientColorOne,
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);

const LinearGradient verticalLinearGradientOffline = LinearGradient(
  colors: [Color(0xff4f4072), Color(0XFF594f74)],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);

const LinearGradient graphGradient = LinearGradient(
  begin: Alignment(0, -0.4),
  end: Alignment(0, 0.9),
  colors: [Color(0xff824ebe), Color(0x00824ebe)],
);

const LinearGradient lightgraphGradient = LinearGradient(
  begin: Alignment(0, -0.4),
  end: Alignment(0, 0.9),
  colors: [Color(0x40727272), Color(0x00727272)],
);

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xff3F376C),
    Color.fromARGB(255, 71, 61, 122),
    Color(0xff3F376C),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1, -0.3),
  end: Alignment(1, 0.3),
);

const shimmerGradient2 = LinearGradient(
  begin: Alignment.topLeft,
  colors: <Color>[
    Color(0xff3F376C),
    Color(0xff3F376C),
    Color.fromARGB(255, 70, 60, 121),
    Color(0xff3F376C),
    Color(0xff3F376C),
  ],
  stops: <double>[
    0,
    0.35,
    0.5,
    0.65,
    1,
  ],
);
