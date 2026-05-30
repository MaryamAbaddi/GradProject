



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_bloc.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_events.dart';

class DeleteAction extends StatelessWidget {
  final String serviceId;

  const DeleteAction({super.key, required this.serviceId});

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
              title: Text('Delete Service'),
              content: Text('Are you sure you want to delete this service?'),
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
            context.read<GetserviceBloc>().add(DeleteServiceEvent(serviceId: serviceId));
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