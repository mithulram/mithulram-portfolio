import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_widgets.dart';
import 'home_controller.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController(), tag: 'home_controller');

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: Colors.redAccent, width: 1),
    );
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(color: AppColors.borderColor, width: 1),
    );

    return ResponsiveLayout(
      mobileView: _contactBody(
        context,
        homeController: homeController,
        border: border,
        errorBorder: errorBorder,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        mapHeight: null,
        stackedFields: true,
      ),
      tabView: _contactBody(
        context,
        homeController: homeController,
        border: border,
        errorBorder: errorBorder,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        mapHeight: 320,
        stackedFields: false,
      ),
      desktopView: _contactBody(
        context,
        homeController: homeController,
        border: border,
        errorBorder: errorBorder,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        mapHeight: 400,
        stackedFields: false,
      ),
    );
  }

  Widget _contactBody(
    BuildContext context, {
    required HomeController homeController,
    required OutlineInputBorder border,
    required OutlineInputBorder errorBorder,
    required EdgeInsets padding,
    required double? mapHeight,
    required bool stackedFields,
  }) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _mapSection(mapHeight: mapHeight),
          const SizedBox(height: 32),
          SelectableText(
            'Contact Form',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          Form(
            key: homeController.formKey,
            child: Column(
              children: [
                if (stackedFields) ...[
                  _nameField(homeController, border, errorBorder, context),
                  const SizedBox(height: 10),
                  _emailField(homeController, border, errorBorder, context),
                ] else
                  Row(
                    children: [
                      Expanded(
                        child: _nameField(
                            homeController, border, errorBorder, context),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: _emailField(
                            homeController, border, errorBorder, context),
                      ),
                    ],
                  ),
                SizedBox(height: stackedFields ? 10 : 20),
                _messageField(homeController, border, errorBorder, context),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Obx(
            () => Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: homeController.loading.value
                    ? null
                    : () async {
                        if (homeController.formKey.currentState!.validate()) {
                          await homeController.sendEmail();
                        }
                      },
                child: Neumorphic(
                  style: cardStyle(radius: 14),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset('assets/svg/send.svg', height: 16),
                        const SizedBox(width: 8),
                        Text(
                          homeController.loading.value
                              ? 'Sending...'
                              : 'Send Message',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: AppColors.selectionColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mapSection({required double? mapHeight}) {
    final map = FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(48.5667, 13.4667),
        initialZoom: 13,
        interactionOptions: InteractionOptions(
          flags: InteractiveFlag.doubleTapZoom,
        ),
        maxZoom: 15,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: const ['a', 'b', 'c'],
        ),
      ],
    );

    if (mapHeight == null) {
      return AspectRatio(
        aspectRatio: 16 / 11,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: map,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(width: double.infinity, height: mapHeight, child: map),
    );
  }

  Widget _nameField(HomeController homeController, OutlineInputBorder border,
      OutlineInputBorder errorBorder, BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: homeController.nameController.value,
      validator: (text) =>
          text == null || text.isEmpty ? 'Enter full name!' : null,
      decoration: _inputDecoration('Full Name', border, errorBorder, context),
    );
  }

  Widget _emailField(HomeController homeController, OutlineInputBorder border,
      OutlineInputBorder errorBorder, BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: homeController.emailController.value,
      validator: (text) =>
          text == null || !GetUtils.isEmail(text) ? 'Enter valid email!' : null,
      decoration:
          _inputDecoration('Email address', border, errorBorder, context),
    );
  }

  Widget _messageField(HomeController homeController, OutlineInputBorder border,
      OutlineInputBorder errorBorder, BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: homeController.messageController.value,
      validator: (text) =>
          text == null || text.trim().isEmpty ? 'Please enter a message!' : null,
      maxLines: 6,
      decoration:
          _inputDecoration('Your Message', border, errorBorder, context),
    );
  }

  InputDecoration _inputDecoration(String hint, OutlineInputBorder border,
      OutlineInputBorder errorBorder, BuildContext context) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      border: border,
      enabledBorder: border,
      disabledBorder: border,
      focusedBorder: border,
      errorBorder: errorBorder,
      hintText: hint,
      hintStyle: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
