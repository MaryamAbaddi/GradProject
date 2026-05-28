import 'package:flutter/material.dart';

class ProductFilter extends StatefulWidget {
  final void Function(String?) onFilterChanged;

  const ProductFilter({super.key, required this.onFilterChanged});

  @override
  State<ProductFilter> createState() => _ProductFilterState();
}

class _ProductFilterState extends State<ProductFilter> {
  String? selected;
  final filters = ['Food', 'Clothes', 'Crafts', 'My posts'];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: Icon(Icons.tune, color: colors.onSecondary),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colors.primary, width: 1),
      ),
      onSelected: (value) {
        setState(() => selected = selected == value ? null : value);
        widget.onFilterChanged(selected);
      },
      itemBuilder: (_) => [
        PopupMenuItem(
          enabled: false,
          height: 30,
          child: Text(
            'Filter type of product',
            style: TextStyle(
              color: colors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        const PopupMenuDivider(),
        ...filters.map((filter) => PopupMenuItem(
              value: filter,
              height: 36,
              child: Row(
                children: [
                  Icon(
                    selected == filter
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: colors.primary,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(filter, style: const TextStyle(fontSize: 13)),
                ],
              ),
            )),
      ],
    );
  }
}