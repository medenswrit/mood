import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:mood/common/card/base_card.dart';
import 'package:mood/constants/style_constants.dart';

class ListCard extends BaseCard {
  ListCard({
    Key? key,
    required String text,
    required Icon icon,
    required Color decorationColor,
    required Widget trailing,
    required VoidCallback onTap,
  }) : super(
          key: key,
          child: ListTile(
            onTap: () => onTap,
            leading: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: decorationColor,
                ),
                child: icon),
            title: Text(
              text,
              style: textStyle,
            ),
            trailing: trailing,
          ),
        );
}
