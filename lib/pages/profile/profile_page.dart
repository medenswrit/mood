import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mood/common/card/list_card.dart';
import 'package:mood/common/card/profile_card.dart';
import 'package:mood/common/dialog/error_dialog.dart';
import 'package:mood/constants/style_constants.dart';
import 'package:mood/pages/profile/cubit/profile_cubit.dart';
import 'package:mood/utils/auth/auth_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  static const pageName = 'Profile';

  const ProfilePage({Key? key}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  bool notification = true;

  String uid = '';

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  void _getProfile() {
    uid = context.read<AuthBloc>().state.user!.uid;
    context.read<ProfileCubit>().getProfile(uid: uid);
    notification = context.read<ProfileCubit>().state.user.notifications;
  }

  Future<void> _setNotifications(bool notifications) async {
    context
        .read<ProfileCubit>()
        .setNotificationsStatus(uid: uid, notifications: notifications);
    setState(() {
      notification = notifications;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Profile',
          style: textStyle,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            const Center(
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage:
                    AssetImage('assets/images/old_man_icon-removebg.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Settings',
                style: textStyle.copyWith(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            ProfileCard(
              text: 'Edit profile',
              icon: const Icon(
                FeatherIcons.edit,
                color: primaryColor,
              ),
              onTap: () => {},
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    'General Settings',
                    style: textStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListCard(
              text: 'Get Notification',
              icon: const Icon(
                FeatherIcons.bell,
                color: medensTeal,
              ),
              decorationColor: greenBackgroundColor,
              trailing: Transform.scale(
                scale: 0.7,
                child: CupertinoSwitch(
                  onChanged: (bool value) {
                    _setNotifications(value);
                  },
                  trackColor: Colors.redAccent,
                  activeColor: primaryColor,
                  value: notification,
                ),
              ),
              onTap: () => {},
            ),
            ProfileCard(
              text: 'Language',
              icon: const Icon(Icons.language_rounded, color: medensMagenta),
              onTap: () => {},
            ),
            ProfileCard(
              text: 'Contact Us',
              icon: const Icon(
                FeatherIcons.messageCircle,
                color: medensBlue,
              ),
              onTap: () => {},
            ),
            ProfileCard(
              text: 'Privacy Policy',
              icon: const Icon(
                FeatherIcons.helpCircle,
                color: medensTeal,
              ),
              onTap: () => {},
            ),
            ProfileCard(
              text: 'About Us',
              icon: const Icon(FeatherIcons.alertCircle, color: medensMagenta),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
