import 'package:flutter/material.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/getcartitems/domain/entity/getcartitems_output.dart';

class GetcartitemsCard extends StatelessWidget {
  final GetCartOutput item;
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const GetcartitemsCard({
    super.key,
    required this.item,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      key: ValueKey(item.itemId),
      color: Colors.grey[200],
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey[200]!, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: item.image != null
                  ? Image.network(item.image!, width: 70, height: 70, fit: BoxFit.cover)
                  : Container(
                      width: 70,
                      height: 70,
                      color: Colors.grey[300],
                      child: const Icon(Icons.miscellaneous_services, size: 32),
                    ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(text: item.name, fontWeight: FontWeight.bold, textSize: 16),
                  const SizedBox(height: 6),
                  AppText(text: '${item.price} JOD', textColor: colors.onSurface, textSize: 14, fontWeight: FontWeight.w500),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: onDecrement,
                  icon: Icon(Icons.remove_circle_rounded, color: colors.primary),
                ),
                Text('$count', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                IconButton(
                  onPressed: onIncrement,
                  icon: Icon(Icons.add_circle_rounded, color: colors.primary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}