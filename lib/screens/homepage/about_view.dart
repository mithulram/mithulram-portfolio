
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/screens/responsive_layout.dart';
import 'package:portfolio/utils/app_colors.dart';
import 'package:portfolio/utils/common_widgets.dart';
import 'package:portfolio/utils/controllers.dart';
import '../../utils/common_strings.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    analyticServices.logScreenView(screenName: context.toString());

    return ResponsiveLayout(
      mobileView: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            // padding: EdgeInsets.symmetric(horizontal: appConstant.isMobileView? 10:30, vertical: 30),
            child: SelectableText(CommonStrings.aboutMe, style: Theme.of(context).textTheme.bodyLarge,),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            // padding: EdgeInsets.symmetric(horizontal: appConstant.isMobileView? 10: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectableText("What I'm doing", style: Theme.of(context).textTheme.headlineMedium,),
                const SizedBox(height: 20,),
                ResponsiveLayout(
                    mobileView: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Neumorphic(
                          padding: const EdgeInsets.all(16),
                          style: cardStyle(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/mobile-phone.svg',
                                height: 55,
                              ),
                              const SizedBox(width: 16,),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText("Mobile Apps", style: Theme.of(context).textTheme.titleLarge,),
                                    const SizedBox(height: 10,),
                                    SelectableText("Professional development of applications for iOS and Android.", style: Theme.of(context).textTheme.bodyMedium,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Neumorphic(
                          padding: const EdgeInsets.all(16),
                          style: cardStyle(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/web-dev.svg',
                                height: 55,
                              ),
                              const SizedBox(width: 16,),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText("Web Development", style: Theme.of(context).textTheme.titleLarge,),
                                    const SizedBox(height: 10,),
                                    SelectableText("High-quality development of sites at the professional level.", style: Theme.of(context).textTheme.bodyMedium,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    desktopView: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Neumorphic(
                            padding: const EdgeInsets.all(30),
                            style: cardStyle(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/mobile-phone.svg',
                                  height: 65,
                                ),
                                const SizedBox(width: 8,),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SelectableText("Mobile Apps", style: Theme.of(context).textTheme.titleLarge,),
                                      const SizedBox(height: 10,),
                                      SelectableText("Professional development of applications for iOS and Android.", style: Theme.of(context).textTheme.bodyMedium,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: Neumorphic(
                            padding: const EdgeInsets.all(30),
                            style: cardStyle(),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/web-dev.svg',
                                  height: 55,
                                ),
                                const SizedBox(width: 16,),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SelectableText("Web Development", style: Theme.of(context).textTheme.titleLarge,),
                                      const SizedBox(height: 10,),
                                      SelectableText("High-quality development of sites at the professional level.", style: Theme.of(context).textTheme.bodyMedium,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                )


                // Wrap(
                //   spacing: 20,
                //   crossAxisAlignment: WrapCrossAlignment.center,
                //   runAlignment: WrapAlignment.spaceBetween,
                //   alignment: WrapAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Container(
                //         width: 400,
                //         padding: const EdgeInsets.all(16),
                //         decoration: const BoxDecoration(
                //             borderRadius: BorderRadius.all(Radius.circular(14)),
                //             color: AppColors.lightBlackContainer
                //         ),
                //         child: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const Icon(Icons.phone_android, size: 50, color: AppColors.selectionColor,),
                //             const SizedBox(width: 8,),
                //             Flexible(
                //               child: Column(
                //                 mainAxisSize: MainAxisSize.max,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   SelectableText("Mobile Apps", style: Theme.of(context).textTheme.titleLarge,),
                //                   SelectableText("Professional development of applications for iOS and Android.", style: Theme.of(context).textTheme.bodyLarge,),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Container(
                //         width: 400,
                //         padding: const EdgeInsets.all(16),
                //         decoration: const BoxDecoration(
                //             borderRadius: BorderRadius.all(Radius.circular(14)),
                //             color: AppColors.lightBlackContainer
                //         ),
                //         child: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const Icon(Icons.phone_android, size: 50, color: AppColors.selectionColor,),
                //             const SizedBox(width: 8,),
                //             Flexible(
                //               child: Column(
                //                 mainAxisSize: MainAxisSize.max,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   SelectableText("Mobile Apps", style: Theme.of(context).textTheme.titleLarge,),
                //                   SelectableText("Professional development of applications for iOS and Android.", style: Theme.of(context).textTheme.bodyLarge,),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
      desktopView: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            // padding: EdgeInsets.symmetric(horizontal: appConstant.isMobileView? 10:30, vertical: 30),
            child: SelectableText(CommonStrings.aboutMe, style: Theme.of(context).textTheme.bodyLarge,),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            // padding: EdgeInsets.symmetric(horizontal: appConstant.isMobileView? 10: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SelectableText("What I'm doing", style: Theme.of(context).textTheme.headlineMedium,),
                const SizedBox(height: 30,),
                ResponsiveLayout(
                    mobileView: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Neumorphic(
                          padding: const EdgeInsets.all(16),
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                              depth: .4,
                              lightSource: LightSource.topLeft,
                              color: AppColors.lightBlackContainer,
                              shadowLightColor: AppColors.selectionColor
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/mobile-phone.svg',
                                height: 55,
                              ),
                              const SizedBox(width: 16,),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText("Mobile Apps", style: Theme.of(context).textTheme.titleLarge,),
                                    const SizedBox(height: 10,),
                                    SelectableText("Professional development of applications for iOS and Android.", style: Theme.of(context).textTheme.bodyMedium,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Neumorphic(
                          padding: const EdgeInsets.all(16),
                          style: NeumorphicStyle(
                              shape: NeumorphicShape.concave,
                              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                              depth: .4,
                              lightSource: LightSource.topLeft,
                              color: AppColors.lightBlackContainer,
                              shadowLightColor: AppColors.selectionColor
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'assets/svg/web-dev.svg',
                                height: 55,
                              ),
                              const SizedBox(width: 16,),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SelectableText("Web Development", style: Theme.of(context).textTheme.titleLarge,),
                                    const SizedBox(height: 10,),
                                    SelectableText("High-quality development of sites at the professional level.", style: Theme.of(context).textTheme.bodyMedium,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    desktopView: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Neumorphic(
                            padding: const EdgeInsets.all(30),
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                                depth: .4,
                                lightSource: LightSource.topLeft,
                                color: AppColors.lightBlackContainer,
                                shadowLightColor: AppColors.selectionColor
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/mobile-phone.svg',
                                  height: 65,
                                ),
                                const SizedBox(width: 8,),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SelectableText("Mobile Apps", style: Theme.of(context).textTheme.titleLarge,),
                                      const SizedBox(height: 10,),
                                      SelectableText("Professional development of applications for iOS and Android.", style: Theme.of(context).textTheme.bodyMedium,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: Neumorphic(
                            padding: const EdgeInsets.all(30),
                            style: NeumorphicStyle(
                                shape: NeumorphicShape.concave,
                                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                                depth: .4,
                                lightSource: LightSource.topLeft,
                                color: AppColors.lightBlackContainer,
                                shadowLightColor: AppColors.selectionColor
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/web-dev.svg',
                                  height: 55,
                                ),
                                const SizedBox(width: 16,),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SelectableText("Web Development", style: Theme.of(context).textTheme.titleLarge,),
                                      const SizedBox(height: 10,),
                                      SelectableText("High-quality development of sites at the professional level.", style: Theme.of(context).textTheme.bodyMedium,),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                )


                // Wrap(
                //   spacing: 20,
                //   crossAxisAlignment: WrapCrossAlignment.center,
                //   runAlignment: WrapAlignment.spaceBetween,
                //   alignment: WrapAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Container(
                //         width: 400,
                //         padding: const EdgeInsets.all(16),
                //         decoration: const BoxDecoration(
                //             borderRadius: BorderRadius.all(Radius.circular(14)),
                //             color: AppColors.lightBlackContainer
                //         ),
                //         child: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const Icon(Icons.phone_android, size: 50, color: AppColors.selectionColor,),
                //             const SizedBox(width: 8,),
                //             Flexible(
                //               child: Column(
                //                 mainAxisSize: MainAxisSize.max,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   SelectableText("Mobile Apps", style: Theme.of(context).textTheme.titleLarge,),
                //                   SelectableText("Professional development of applications for iOS and Android.", style: Theme.of(context).textTheme.bodyLarge,),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Container(
                //         width: 400,
                //         padding: const EdgeInsets.all(16),
                //         decoration: const BoxDecoration(
                //             borderRadius: BorderRadius.all(Radius.circular(14)),
                //             color: AppColors.lightBlackContainer
                //         ),
                //         child: Row(
                //           mainAxisSize: MainAxisSize.min,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             const Icon(Icons.phone_android, size: 50, color: AppColors.selectionColor,),
                //             const SizedBox(width: 8,),
                //             Flexible(
                //               child: Column(
                //                 mainAxisSize: MainAxisSize.max,
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   SelectableText("Mobile Apps", style: Theme.of(context).textTheme.titleLarge,),
                //                   SelectableText("Professional development of applications for iOS and Android.", style: Theme.of(context).textTheme.bodyLarge,),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
