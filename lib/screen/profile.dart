import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:project/model/user.dart';
import 'package:project/provider/app_provider.dart';
import 'package:project/screen/chart_screen.dart';
import 'package:project/style.dart';
import 'package:provider/provider.dart';

class ProfileScreen2 extends StatefulWidget {
  // const ProfileScreen({ Key? key }) : super(key: key);
  AppUser appUser;
  ProfileScreen2(this.appUser, {Key key}) : super(key: key);

  @override
  State<ProfileScreen2> createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppProvider>(context, listen: false)
        .getUserfromFirestore(widget.appUser.id);
  }

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: PersistentTabView(
        context,

        controller: controller,
        // ignore: prefer_const_literals_to_create_immutables
        screens: [HomeScreen(widget.appUser), HomePage(), HomePage2()],
        items: [
          PersistentBottomNavBarItem(
            icon: const Icon(
              CupertinoIcons.home,
            ),
            activeColorPrimary: primaryColor,
            inactiveColorPrimary: secondaryColor,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(
              CupertinoIcons.chart_bar_square,
            ),
            activeColorPrimary: primaryColor,
            inactiveColorPrimary: secondaryColor,
          ),
          PersistentBottomNavBarItem(
            icon: const Icon(
              CupertinoIcons.chart_bar,
            ),
            activeColorPrimary: primaryColor,
            inactiveColorPrimary: secondaryColor,
          ),
        ],
        confineInSafeArea: true,

        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0), boxShadow: boxShadow),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style9, // Choose the nav bar style with this property.
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  AppUser appUser;
  HomeScreen(this.appUser, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25))),
                        height: 168,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          child: Center(
                            child: Text(
                              "الملف الشخصي",
                              style: GoogleFonts.tajawal(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    appUser.userName,
                    style: GoogleFonts.tajawal(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    appUser.email,
                    style: GoogleFonts.tajawal(
                        color: const Color.fromRGBO(112, 112, 112, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.height * 0.00),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor),
                          child: ListTile(
                            trailing: const Icon(Icons.person),
                            title: Text(
                              appUser.userName,
                              style: GoogleFonts.tajawal(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            subtitle:
                                Text("اسم المستخدم", style: categoristyle),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor),
                          child: ListTile(
                            trailing: const Icon(Icons.email),
                            title: Text(
                              appUser.email,
                              style: GoogleFonts.tajawal(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            subtitle:
                                Text("ايميل المستخدم", style: categoristyle),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor),
                          child: ListTile(
                            trailing: const Icon(Icons.call),
                            title: Text(
                              appUser.mobileNumber ?? "",
                              style: GoogleFonts.tajawal(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            subtitle: Text("رقم الهاتف", style: categoristyle),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 14),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: primaryColor),
                          child: ListTile(
                            trailing: const Icon(Icons.location_pin),
                            title: Text(
                              appUser.address ?? "",
                              style: GoogleFonts.tajawal(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            subtitle:
                                Text(" عنوان المستخدم ", style: categoristyle),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Provider.of<AppProvider>(context, listen: false)
                                .logout();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 5),
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color:
                                    const Color.fromRGBO(255, 142, 60, 0.25)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.logout,
                                  color: primaryColor,
                                ),
                                Text(
                                  "   تسجيل خروج ",
                                  style: GoogleFonts.tajawal(
                                      fontSize: 16,
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
