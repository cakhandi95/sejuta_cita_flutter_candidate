import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../../styles/colors.dart';

///
/// Created by handy on 11/03/22
/// HP ProBook G1 430
/// it.handy@borwita.co.id
///

class VButtonPrimary extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool disabled;
  final bool isIcon;
  final double width;
  final double height;
  final TextStyle textStyle;
  final String fileAsset;
  final Color colorAsset;

  VButtonPrimary(this.title, {
    required this.onPressed,
    required this.width,
    required this.textStyle,
    required this.isIcon,
    this.disabled = false,
    this.fileAsset = "-",
    this.height = 40,
    this.colorAsset = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    if (isIcon) {
      return SizedBox(
        width: width,
        height: height,
        child: ElevatedButton.icon(
          onPressed: disabled ? null :onPressed,
          icon: SvgPicture.asset(
            fileAsset,
            color: colorAsset,
            width: 18.0,
            height: 18.0,
          ),
          label: Text(
            title,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
          style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.padded,
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.resolveWith < Color > (
                    (Set < MaterialState > states) {
                  if (states.contains(MaterialState.pressed)) {
                    return colorButtonPressed;
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorDarkBlue;
                  }
                  if (states.contains(MaterialState.disabled)) {
                    return colorGreySubtitle;
                  }
                  return colorDarkBlue;
                }),
          ),
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: textStyle,
          ),
          style: ButtonStyle(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: MaterialStateProperty.resolveWith < Color > (
                    (Set < MaterialState > states) {
                  if (states.contains(MaterialState.pressed)) {
                    return colorButtonPressed;
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorDarkBlue;
                  }
                  if (states.contains(MaterialState.disabled)) {
                    return colorGreySubtitle;
                  }
                  return colorDarkBlue;
                }),
          ),
        ),
      );
    }
  }
}

class VButtonSecondary extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool disabled;
  final bool isIcon;
  final double width;
  final TextStyle textStyle;
  final String fileAsset;
  final Color colorAsset;

  const VButtonSecondary(this.title, {Key? key,
    required this.onPressed,
    required this.width,
    required this.textStyle,
    required this.isIcon,
    this.disabled = false,
    this.fileAsset = "-",
    this.colorAsset = Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isIcon) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          fileAsset,
          color: colorAsset,
          width: 20.0,
          height: 20.0,
        ),
        label: Text(
          title,
          style: textStyle,
        ),
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.padded,
          fixedSize: MaterialStateProperty.all < Size > (Size(width, 50)),
        ),
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle,
        ),
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.padded,
          fixedSize: MaterialStateProperty.all < Size > (Size(width, 50)),
        ),
      );
    }
  }
}

class VButtonTertiary extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool disabled;
  final bool isIcon;
  final double width;
  final double height;
  final TextStyle textStyle;
  final String fileAsset;
  final Color colorAsset;

  const VButtonTertiary(this.title, {
    required this.onPressed,
    required this.width,
    required this.textStyle,
    required this.isIcon,
    this.disabled = false,
    this.fileAsset = "-",
    this.height = 40,
    this.colorAsset = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    if (isIcon) {
      return TextButton.icon(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          fileAsset,
          color: colorAsset,
          width: 20.0,
          height: 20.0,
        ),
        label: Text(
          title,
          style: textStyle,
        ),
        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.padded,
          fixedSize: MaterialStateProperty.all < Size > (Size(width, 50)),
        ),
      );
    } else {
      return TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyle,
        ),
        style: ButtonStyle(
          side: MaterialStateProperty.resolveWith < BorderSide > (
                  (Set < MaterialState > states) {
                return BorderSide(color: colorDarkBlue, width: 1, style: BorderStyle.solid);
              }),
          shape: MaterialStateProperty.resolveWith < OutlinedBorder > ((_) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0));
          }),
          tapTargetSize: MaterialTapTargetSize.padded,
          fixedSize: MaterialStateProperty.all < Size > (Size(width, height)),
        ),
      );
    }
  }
}

class MyDottedSeparator extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  MyDottedSeparator({
    this.height = 1,
    this.width = 2.0,
    this.color = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}

PreferredSize vAppBarPrimary(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: AppBar().preferredSize,
    child: SafeArea(
      child: Container(
        color: colorDefault,
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: colorGreenSecondary,
            statusBarIconBrightness: Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0))),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 18.0,
                color: colorBlackPrimary,
                fontWeight: FontWeight.w600),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, color: colorBlackPrimary)),
          ),
        ),
      ),
    ),
  );
}

PreferredSize vAppBarOptionsMenu(
    BuildContext context, String title,
    {required List<Widget> optionsMenu}) {
  return PreferredSize(
    preferredSize: AppBar().preferredSize,
    child: SafeArea(
      child: Container(
        color: colorDefault,
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: colorGreenSecondary,
            statusBarIconBrightness: Brightness.light, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0))),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 18.0,
                color: colorBlackPrimary,
                fontWeight: FontWeight.w600),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, color: colorBlackPrimary)),
          ),
          actions: optionsMenu,
        ),
      ),
    ),
  );
}

PreferredSize vAppBarTitleSubtitle(
    BuildContext context, String title, List < Widget > optionsMenu) {
  return PreferredSize(
    preferredSize: AppBar().preferredSize,
    child: SafeArea(
      child: Container(
        color: colorDefault,
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0))),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          flexibleSpace: ListTile(
            title: Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  color: colorBlackPrimary,
                  fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              title,
              style: GoogleFonts.poppins(
                  fontSize: 18.0,
                  color: colorBlackPrimary,
                  fontWeight: FontWeight.w600),
            ),
          ),
          title: Container(),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, color: colorBlackPrimary)),
          ),
          actions: optionsMenu,
        ),
      ),
    ),
  );
}

PreferredSize vAppBarIconButton(BuildContext context, String title, {
  required List < Widget > optionsMenu
}) {
  return PreferredSize(
    preferredSize: AppBar().preferredSize,
    child: SafeArea(
      child: Container(
        color: colorDefault,
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0))),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 18.0,
                color: colorBlackPrimary,
                fontWeight: FontWeight.w600),
          ),
          actions: optionsMenu,
        ),
      ),
    ),
  );
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {

  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}