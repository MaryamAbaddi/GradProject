





import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_bloc.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_event.dart';


class DeleteActionP extends StatelessWidget {
  final String productId;

  const DeleteActionP({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      onSelected: (value) async {
        if (value == 'delete') {
          final confirmed = await showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
              backgroundColor: Colors.white,
              title: Text('Delete Product'),
              content: Text('Are you sure you want to delete this Product?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: Text('Delete'),
                ),
              ],
            ),
          );

          if (confirmed == true) {
            if (!context.mounted) return;
            context.read<GetproductBloc>().add(DeleteProductEvent(productId: productId));
          }
        }
      },
      itemBuilder: (ctx) => [
        PopupMenuItem(
          
          value: 'delete',
          child: Row(
            children: [
              Icon(Icons.delete, color: Colors.black),
              SizedBox(width: 8),
              Text('Delete', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}