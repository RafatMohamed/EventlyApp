import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarItemActive extends StatelessWidget {
  const BottomNavBarItemActive({super.key,required this.pathIcon});
  final String pathIcon;
  @override
  Widget build(BuildContext context) {
    final ThemeData them =Theme.of(context);
    return SvgPicture.asset(
      pathIcon,
      colorFilter: ColorFilter.mode(them.primaryColor, .srcIn),
      fit: .cover,
    );
  }
}
class BottomNavBarItemNotActive extends StatelessWidget {
  const BottomNavBarItemNotActive({super.key,required this.pathIcon});
  final String pathIcon;
  @override
  Widget build(BuildContext context) {
    final ThemeData them =Theme.of(context);
    return SvgPicture.asset(
      pathIcon,
      colorFilter: ColorFilter.mode(them.secondaryHeaderColor, .srcIn),
      fit: .cover,
    );
  }
}
