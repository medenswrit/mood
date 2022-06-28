import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:mood/common/card/list_card.dart';
import 'package:mood/constants/style_constants.dart';

class ProfileCard extends ListCard {
  ProfileCard({
    Key? key,
    required String text,
    required Icon icon,
    required VoidCallback onTap,
  }) : super(
          key: key,
          decorationColor: greenBackgroundColor,
          text: text,
          icon: icon,
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: greyTextColor,
          ),
          onTap: onTap,
        );
}
