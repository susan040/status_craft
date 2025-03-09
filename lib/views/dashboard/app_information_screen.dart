import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_craft/controller/dashboard/app_info_controller.dart';
import 'package:status_craft/utils/colors.dart';
import 'package:status_craft/utils/custom_text_style.dart';

class AppInfoScreen extends StatelessWidget {
  final controller = Get.put(AppInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.extraWhite,
      appBar: AppBar(
        backgroundColor: AppColors.extraWhite,
        centerTitle: false,
        elevation: 4,
        leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back, color: AppColors.textColor)),
        title: Text("App Info",
            style: CustomTextStyles.f16W600(color: AppColors.textColor)),
      ),
      body: Obx(() {
        final info = controller.packageInfo.value;
        return ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            _infoTile(Icons.apps, 'App name', info.appName),
            _infoTile(Icons.info_outline, 'Package name', info.packageName),
            _infoTile(Icons.verified, 'App version', info.version),
            _infoTile(
                Icons.build_circle_outlined, 'Build number', info.buildNumber),
            _infoTile(Icons.security_outlined, 'Build signature',
                info.buildSignature),
            _infoTile(Icons.storefront, 'Installer store',
                info.installerStore ?? 'Not available'),
            _infoTile(Icons.access_time, 'Install time',
                info.installTime?.toIso8601String() ?? 'Not available'),
            _infoTile(Icons.update, 'Update time',
                info.updateTime?.toIso8601String() ?? 'Not available'),
          ],
        );
      }),
    );
  }

  Widget _infoTile(IconData icon, String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: Icon(icon, color: AppColors.primaryColor),
          title: Text(title,
              style: CustomTextStyles.f14W600(color: AppColors.textColor)),
          subtitle: Text(subtitle.isEmpty ? 'Not set' : subtitle,
              style: CustomTextStyles.f14W400(
                  color: AppColors.textColor.withOpacity(0.7))),
        ),
        Divider(thickness: 1, color: AppColors.lGrey.withOpacity(0.5)),
      ],
    );
  }
}
