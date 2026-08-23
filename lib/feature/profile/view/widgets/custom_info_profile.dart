import 'package:evently_app/core/models/auth_model.dart';
import 'package:evently_app/core/service/Provider/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utilities/app_colors.dart';
import '../../../../core/utilities/helper/custom_widget_loading_data.dart';
import '../../../../generated/assets.dart';
import '../../../main_app_view/view/main_app_view.dart';

class CustomBuildInfoPerson extends StatelessWidget {
  const CustomBuildInfoPerson({
    super.key,
    required this.colorThem,
    required this.textTheme,
    required this.isLight,
  });

  final ThemeData colorThem;
  final TextTheme textTheme;
  final bool isLight;
  @override
  Widget build(BuildContext context) {
    final user= Provider.of<AuthServicesProvider>(context);
    return FutureBuilder<AuthModel?>(
      future: Provider.of<AuthServicesProvider>(context,listen: false).streamUser(user.user),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CustomWidgetLoadingData.circleProgress(Theme.of(context)),
            ),
          );
        }
        if (snapshot.hasData || snapshot.data !=null) {
          return Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(Assets.images.png.logoRoute.path),
                radius: MediaQuery.sizeOf(context).width * 0.15,
              ),
              const SizedBox(height: 16),
              Text(user.user!.name, style: textTheme.bodyMedium),
              const SizedBox(height: 4),
              Text(
                user.user!.email,
                style: textTheme.labelSmall?.copyWith(
                  fontWeight: .w400,
                  color: isLight ? AppColors.secTextLight : AppColors.secTextDark,
                ),
              ),
            ],
          );
        }
        return SizedBox();
      }
    );
  }
}
