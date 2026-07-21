import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_container_app.dart';

class CustomBuildSelectLangWithThem extends StatelessWidget {
  const CustomBuildSelectLangWithThem({
    super.key,
    required this.label,
    required this.listContainer, required this.onTap, required this.currentSelected,
  });
  final String label;
  final List<Widget> listContainer;
  final Function(int) onTap;
  final int currentSelected;
  @override
  Widget build(BuildContext context) {
    final ThemeData themData = Theme.of(context);
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(label, style: themData.textTheme.labelMedium),
        Row(
          spacing: 6,
          children: List.generate(2, (index) {
            return GestureDetector(
              onTap: () => onTap(index),
              child: CustomContainerApp(
                isSelected:currentSelected==index,
                child: listContainer[index],
              ),
            );
          }),
        ),
      ],
    );
  }
}
