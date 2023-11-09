import 'package:flutter/material.dart';

import '../../widgets/color/my_color.dart';
import '../../widgets/typography/my_typography.dart';

class EmployeeListTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final void Function()? onTap;

  const EmployeeListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  State<EmployeeListTile> createState() => _EmployeeListTileState();
}

class _EmployeeListTileState extends State<EmployeeListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: MyColor.neutral,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      title: MyTypography(title: true, text: widget.title),
      subtitle: MyTypography(
        title: false,
        text: widget.subtitle,
      ),
      onTap: widget.onTap,
    );
  }
}
