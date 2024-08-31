import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:latlong2/latlong.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_methods.dart';
import 'package:portfolio/utils/common_widgets.dart';

import '../../utils/common_strings.dart';
import 'home_controller.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  //latitude: 28.6139, longitude: 77.2088
//AIzaSyCbOmmSNsJTk2A4xU5B0QSEAb8UrOX3Utw
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController(), tag: 'home_controller');

    OutlineInputBorder errorBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1)
    );

    OutlineInputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.borderColor, width: 1)
    );

    return ResponsiveLayout(
      mobileView: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16/11,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: FlutterMap(
                  options: const MapOptions(
                      initialCenter: LatLng(28.4959, 77.1848),
                      initialZoom: 13,
                      interactionOptions: InteractionOptions(
                        flags: InteractiveFlag.doubleTapZoom,
                      ),
                      maxZoom: 15
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40,),
            SelectableText(
              "Contact Form",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20,),
            Form(
              key: homeController.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: homeController.nameController.value,
                        validator: (text){
                          if(text == null || text.isEmpty) {
                            return "Enter full name!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            border: border,
                            enabledBorder: border,
                            disabledBorder: border,
                            focusedBorder: border,
                            errorBorder: errorBorder,
                            hintText: "Full Name",
                            hintStyle: Theme.of(context).textTheme.bodyMedium
                        ),
                      ),
                      const SizedBox(height: 10,),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: homeController.emailController.value,
                        validator: (text){
                          if(text == null || !GetUtils.isEmail(text)) {
                            return "Enter valid email address!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            border: border,
                            enabledBorder: border,
                            disabledBorder: border,
                            focusedBorder: border,
                            errorBorder: errorBorder,
                            hintText: "Email address",
                            hintStyle: Theme.of(context).textTheme.bodyMedium
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 140,
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: homeController.messageController.value,
                      validator: (text){
                        return null;
                      },
                      maxLines: 6,
                      minLines: null,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          border: border,
                          enabledBorder: border,
                          disabledBorder: border,
                          focusedBorder: border,
                          errorBorder: errorBorder,
                          hintText: "Your Message",
                          hintStyle: Theme.of(context).textTheme.bodyMedium
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Obx(() =>
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: homeController.loading.value? null: () async {
                      if(homeController.formKey.currentState!.validate()) {
                        await homeController.sendEmail();
                        //
                        // homeController.nameController.value.text = "";
                        // homeController.emailController.value.text = "";
                        // homeController.messageController.value.clear();
                      } else {
                        print("form not validated!");
                      }
                    },
                    child: Neumorphic(
                      style: cardStyle(radius: 14),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/send.svg',
                              height: 15,
                            ),
                            const SizedBox(width: 8,),
                            Text(homeController.loading.value? "Sending...": "Send Message", style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: AppColors.selectionColor
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            )
          ],
        ),
      ),
      desktopView: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
              ),
              width: double.infinity,
              height: 400,
              child: FlutterMap(
                options: const MapOptions(
                    initialCenter: LatLng(28.4959, 77.1848),
                    initialZoom: 13,
                    interactionOptions: InteractionOptions(
                      flags: InteractiveFlag.doubleTapZoom,
                    ),
                    maxZoom: 15
                ),
                children: [
                  TileLayer(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: const ['a', 'b', 'c'],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40,),
            SelectableText(
              "Contact Form",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20,),
            Form(
              key: homeController.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: homeController.nameController.value,
                          validator: (text){
                            if(text == null || text.isEmpty) {
                              return "Enter full name!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                              border: border,
                              enabledBorder: border,
                              disabledBorder: border,
                              focusedBorder: border,
                              errorBorder: errorBorder,
                              hintText: "Full Name",
                              hintStyle: Theme.of(context).textTheme.bodyMedium
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: homeController.emailController.value,
                          validator: (text){
                            if(text == null || !GetUtils.isEmail(text)) {
                              return "Enter valid email address!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                              border: border,
                              enabledBorder: border,
                              disabledBorder: border,
                              focusedBorder: border,
                              errorBorder: errorBorder,
                              hintText: "Email address",
                              hintStyle: Theme.of(context).textTheme.bodyMedium
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    constraints: const BoxConstraints(
                      minHeight: 140,
                    ),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: homeController.messageController.value,
                      validator: (text){
                        return null;
                      },
                      maxLines: 6,
                      minLines: null,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          border: border,
                          enabledBorder: border,
                          disabledBorder: border,
                          focusedBorder: border,
                          errorBorder: errorBorder,
                          hintText: "Your Message",
                          hintStyle: Theme.of(context).textTheme.bodyMedium
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30,),
            Obx(() =>
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: homeController.loading.value? null: () async {
                      if(homeController.formKey.currentState!.validate()) {
                        await homeController.sendEmail();
                        //
                        // homeController.nameController.value.text = "";
                        // homeController.emailController.value.text = "";
                        // homeController.messageController.value.clear();
                      } else {
                        print("form not validated!");
                      }
                    },
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                          depth: .4,
                          lightSource: LightSource.topLeft,
                          color: AppColors.lightBlackContainer,
                          shadowLightColor: AppColors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/send.svg',
                              height: 18,
                            ),
                            const SizedBox(width: 10,),
                            Text(homeController.loading.value? "Sending...": "Send Message", style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: AppColors.selectionColor
                            ),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}