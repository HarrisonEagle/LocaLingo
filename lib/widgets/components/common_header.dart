import 'package:flutter/material.dart';

class CommonHeader extends StatelessWidget implements PreferredSizeWidget {
  const CommonHeader({super.key, required this.automaticallyImplyLeading});
  final bool automaticallyImplyLeading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Localingo'),
      centerTitle: false,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}
