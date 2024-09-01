import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/screens/homepage/home_controller.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_strings.dart';
import 'package:portfolio/utils/common_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController(), tag: 'home_controller');
    final maxWidth = MediaQuery.of(context).size.width;
    final double padding = (maxWidth > 1200)
        ? (maxWidth - 1200) / 2
        : 10;

    return Material(
      color: AppColors.smokeyBlack,
      child: ResponsiveLayout(
        desktopView: Container(
          constraints: BoxConstraints(
              maxWidth: maxWidth < 1200
                  ? maxWidth
                  : 1200
          ),
          padding: EdgeInsets.symmetric(horizontal: padding),
          color: AppColors.smokeyBlack,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 23,
                child: SideBar(homeController: homeController)
              ),
              const SizedBox(width: 16,),
              Expanded(
                flex: 77,
                child: MainPage(homeController: homeController))
            ],
          ),
        ),
        mobileView: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    SideBar(homeController: homeController),
                    MainPage(homeController: homeController)
                  ],
                ),
              ),
              Obx(() =>
                  CustomContainer(
                    bgColor: AppColors.lightBlackContainer,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TabItem(
                          title: "About",
                          onTap: (){
                            homeController.selectedTabIndex.value = 0;
                            homeController.selectedTabName.value = "About Me";
                          },
                          isSelected: homeController.selectedTabIndex.value == 0,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        TabItem(
                          title: "Resume",
                          onTap: (){
                            homeController.selectedTabIndex.value = 1;
                            homeController.selectedTabName.value = "Resume";
                          },
                          isSelected: homeController.selectedTabIndex.value == 1,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        TabItem(
                          title: "Portfolio",
                          onTap: (){
                            homeController.selectedTabIndex.value = 2;
                            homeController.selectedTabName.value = "Portfolio";
                          },
                          isSelected: homeController.selectedTabIndex.value == 2,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                        TabItem(
                          title: "Contact",
                          onTap: (){
                            homeController.selectedTabIndex.value = 3;
                            homeController.selectedTabName.value = "Contact";
                          },
                          isSelected: homeController.selectedTabIndex.value == 3,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
        tabView: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(10).copyWith(top: 20),
                    children: [
                      SideBar(homeController: homeController),
                      MainPage(homeController: homeController)
                    ],
                  ),
                ),
                Obx(() =>
                    CustomContainer(
                      bgColor: AppColors.lightBlackContainer,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TabItem(
                              title: "About",
                              onTap: (){
                                homeController.selectedTabIndex.value = 0;
                                homeController.selectedTabName.value = "About Me";
                              },
                              isSelected: homeController.selectedTabIndex.value == 0,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            TabItem(
                              title: "Resume",
                              onTap: (){
                                homeController.selectedTabIndex.value = 1;
                                homeController.selectedTabName.value = "Resume";
                              },
                              isSelected: homeController.selectedTabIndex.value == 1,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            TabItem(
                              title: "Portfolio",
                              onTap: (){
                                homeController.selectedTabIndex.value = 2;
                                homeController.selectedTabName.value = "Portfolio";
                              },
                              isSelected: homeController.selectedTabIndex.value == 2,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                            ),
                            TabItem(
                              title: "Contact",
                              onTap: (){
                                homeController.selectedTabIndex.value = 3;
                                homeController.selectedTabName.value = "Contact";
                              },
                              isSelected: homeController.selectedTabIndex.value == 3,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                            ),
                          ],
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  HomeController homeController;
  MainPage({required this.homeController, super.key});

  @override
  Widget build(BuildContext context) {

    return Obx(() =>
      ResponsiveLayout(
        mobileView: CustomContainer(
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 16, bottom: 0),
                child: SelectableText(homeController.selectedTabName.value, style: Theme.of(context).textTheme.headlineLarge,),
                // child: SelectableText(homeController.selectedTabName.value, style: Theme.of(context).textTheme.headlineLarge,),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, top: 15),
                width: 45,
                height: 6,
                decoration: BoxDecoration(
                    gradient: AppColors.yellowGradient,
                    borderRadius: BorderRadius.circular(3)
                ),
              ),
              homeController.getTabView(),
              const SizedBox(height: 10,)
            ],
          ),
        ),
        desktopView: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 60, bottom: 30),
            child: CustomContainer(
              padding: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 16, bottom: 0),
                        child: SelectableText(homeController.selectedTabName.value, style: Theme.of(context).textTheme.headlineLarge,),
                        // child: SelectableText(homeController.selectedTabName.value, style: Theme.of(context).textTheme.headlineLarge,),
                      ),
                      CustomContainer(
                        bgColor: AppColors.lightBlackContainer,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(17),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TabItem(
                                title: "About",
                                onTap: (){
                                  homeController.selectedTabIndex.value = 0;
                                  homeController.selectedTabName.value = "About Me";
                                },
                                isSelected: homeController.selectedTabIndex.value == 0
                            ),
                            TabItem(
                                title: "Resume",
                                onTap: (){
                                  homeController.selectedTabIndex.value = 1;
                                  homeController.selectedTabName.value = "Resume";
                                },
                                isSelected: homeController.selectedTabIndex.value == 1
                            ),
                            TabItem(
                                title: "Portfolio",
                                onTap: (){
                                  homeController.selectedTabIndex.value = 2;
                                  homeController.selectedTabName.value = "Portfolio";
                                },
                                isSelected: homeController.selectedTabIndex.value == 2
                            ),
                            TabItem(
                                title: "Contact",
                                onTap: (){
                                  homeController.selectedTabIndex.value = 3;
                                  homeController.selectedTabName.value = "Contact";
                                },
                                isSelected: homeController.selectedTabIndex.value == 3
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, top: 15),
                    width: 45,
                    height: 6,
                    decoration: BoxDecoration(
                        gradient: AppColors.yellowGradient,
                        borderRadius: BorderRadius.circular(3)
                    ),
                  ),
                  homeController.getTabView(),
                  const SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  Widget TabItem({required void Function() onTap, required String title, bool isSelected = false} ) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Text(title, style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(
            color: isSelected? AppColors.selectionColor: AppColors.white
        ),),
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  HomeController homeController;
  SideBar({super.key, required this.homeController});

  @override
  Widget build(BuildContext context) {

    return Obx(() =>
      ResponsiveLayout(
        mobileView: CustomContainer(
          clip: Clip.antiAlias,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AvatarContainer(
                            radius: 20,
                            padding: EdgeInsets.zero,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 80,
                                maxWidth: 80
                              ),
                              child: Image.asset(
                                "assets/images/profile.png",
                                // "https://codewithsadee.github.io/vcard-personal-portfolio/assets/images/my-avatar.png",
                                fit: BoxFit.cover,
                              ),
                            )
                        ),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText("Rahul Chauhan", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                            const SizedBox(height: 10),
                            CustomContainer(
                              bgColor: AppColors.lightBlackContainer,
                              borderColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              border: 8,
                              child: SelectableText("Frontend Developer", style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: homeController.toggleExpanded,
                    child: CustomContainer(
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), topRight: Radius.circular(17)),
                      padding: const EdgeInsets.all(6),
                      child: Icon(homeController.isExpanded.value? Icons.expand_less_rounded: Icons.expand_more, size: 16, color: homeController.isExpanded.value? AppColors.selectionColor: AppColors.white,),
                    ),
                  ),
                ],
              ),
              !homeController.isExpanded.value ? const SizedBox():
              AnimatedContainer(
                curve: Curves.decelerate,
                duration: const Duration(seconds: 3),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(color: AppColors.borderColor, thickness: 1),
                      CustomListTile(
                          icon: Icons.mail_outline_rounded,
                          title: "EMAIL",
                          subtitle: "rchauhan439@gmail.com",
                          onTap: (){
                            launchUrl(
                                Uri(scheme: "mailto", path: "rchauhan439@gmail.com"),
                                mode: LaunchMode.platformDefault
                            );
                          }
                      ),
                      CustomListTile(
                          icon: Icons.phone_android,
                          title: "PHONE",
                          subtitle: "+91 9868563310",
                          onTap: (){
                            launchUrl(
                                Uri(scheme: "tel", path: "+919868563310"),
                                mode: LaunchMode.platformDefault
                            );
                          }
                      ),
                      CustomListTile(
                        icon: Icons.location_on_outlined,
                        title: "LOCATION",
                        subtitle: "Chattarpur, New Delhi - 110074",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        tabView: CustomContainer(
          margin: const EdgeInsets.only(bottom: 10),
          clip: Clip.antiAlias,
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AvatarContainer(
                            radius: 20,
                            padding: EdgeInsets.zero,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 120,
                                maxWidth: 120
                              ),
                              child: Image.asset(
                                "assets/images/profile.png",
                                // "https://codewithsadee.github.io/vcard-personal-portfolio/assets/images/my-avatar.png",
                                fit: BoxFit.cover,
                              ),
                            )
                        ),
                        const SizedBox(width: 16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText("Rahul Chauhan", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                            const SizedBox(height: 10),
                            CustomContainer(
                              bgColor: AppColors.lightBlackContainer,
                              borderColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              border: 8,
                              child: SelectableText("Frontend Developer", style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: homeController.toggleExpanded,
                    child: CustomContainer(
                      clip: Clip.antiAlias,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), topRight: Radius.circular(17)),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Icon(homeController.isExpanded.value? Icons.expand_less_rounded: Icons.expand_more, size: 14, color: homeController.isExpanded.value? AppColors.selectionColor: AppColors.white,),
                          Text(" Show Contacts", style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: homeController.isExpanded.value? AppColors.selectionColor: AppColors.white
                          ),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              !homeController.isExpanded.value ? const SizedBox():
              AnimatedContainer(
                curve: Curves.decelerate,
                duration: const Duration(seconds: 3),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(color: AppColors.borderColor, thickness: 1),
                      CustomListTile(
                          icon: Icons.mail_outline_rounded,
                          title: "EMAIL",
                          subtitle: "rchauhan439@gmail.com",
                          onTap: (){
                            launchUrl(
                                Uri(scheme: "mailto", path: "rchauhan439@gmail.com"),
                                mode: LaunchMode.platformDefault
                            );
                          }
                      ),
                      CustomListTile(
                          icon: Icons.phone_android,
                          title: "PHONE",
                          subtitle: "+91 9868563310",
                          onTap: (){
                            launchUrl(
                                Uri(scheme: "tel", path: "+919868563310"),
                                mode: LaunchMode.platformDefault
                            );
                          }
                      ),
                      CustomListTile(
                        icon: Icons.location_on_outlined,
                        title: "LOCATION",
                        subtitle: "Chattarpur, New Delhi - 110074",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        desktopView: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            controller: ScrollController(),
            padding: const EdgeInsets.only(top: 60, bottom: 30, right: 10),
            child: CustomContainer(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
                    child: AvatarContainer(
                        padding: EdgeInsets.zero,
                        child: Container(
                          // constraints: BoxConstraints(
                          //   maxWidth: 180,
                          //   maxHeight: 180
                          // ),
                          child: Image.asset(
                            "assets/images/profile.png",
                            // "https://codewithsadee.github.io/vcard-personal-portfolio/assets/images/my-avatar.png",
                            fit: BoxFit.cover,
                          ),
                        )
                    ),
                  ),
                  SelectableText("Rahul Chauhan", style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),
                  const SizedBox(height: 20,),
                  CustomContainer(
                    bgColor: AppColors.lightBlackContainer,
                    borderColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    border: 8,
                    child: SelectableText("Frontend Developer", style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center,),
                  ),
                  const SizedBox(height: 20,),
                  const Divider(color: AppColors.borderColor, thickness: 1, endIndent: 16, indent: 16,),
                  const SizedBox(height: 20,),
                  CustomListTile(
                      icon: Icons.mail_outline_rounded,
                      title: "EMAIL",
                      subtitle: "rchauhan439@gmail.com",
                      onTap: (){
                        launchUrl(
                            Uri(scheme: "mailto", path: "rchauhan439@gmail.com"),
                            mode: LaunchMode.platformDefault
                        );
                      }
                  ),
                  CustomListTile(
                      icon: Icons.phone_android,
                      title: "PHONE",
                      subtitle: "+91 9868563310",
                      onTap: (){
                        launchUrl(
                            Uri(scheme: "tel", path: "+919868563310"),
                            mode: LaunchMode.platformDefault
                        );
                      }
                  ),
                  CustomListTile(
                    icon: Icons.location_on_outlined,
                    title: "LOCATION",
                    subtitle: "Chattarpur, New Delhi - 110074",
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}


class CustomListTile extends StatelessWidget {
  String? title, subtitle;
  IconData? icon;
  void Function()? onTap;
  CustomListTile({
    this.title,
    this.subtitle,
    this.icon,
    this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileView: ListTile(
        dense: true,
        onTap: onTap,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Neumorphic(
            padding: const EdgeInsets.all(6),
            style: cardStyle(radius: 6),
            child: Icon(icon, color: AppColors.accent, size: 16,),
          ),
        ),
        title: SelectableText(title ?? "", style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: AppColors.lightGray70,
        ),),
        subtitle: SelectableText(subtitle ?? "", style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.white
        ),),
      ),
      desktopView: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          onTap: onTap,
          leading: Neumorphic(
            padding: const EdgeInsets.all(12),
            style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                depth: .4,
                lightSource: LightSource.topLeft,
                color: AppColors.lightBlackContainer,
                shadowLightColor: AppColors.white
            ),
            child: Icon(icon, color: AppColors.accent, size: 18, weight: .2,),
          ),
          title: SelectableText(title ?? "", style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: AppColors.lightGray70,
          ),),
          subtitle: SelectableText(subtitle ?? "", style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.white
          ),),
        ),
      )
    );
  }
}

