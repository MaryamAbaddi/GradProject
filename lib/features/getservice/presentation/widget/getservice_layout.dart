import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/getservice/domain/entity/output_getsrvice.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_bloc.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_events.dart';
import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';

class GetserviceLayout extends StatelessWidget {
  final List<OutputGetservice> services;

  const GetserviceLayout({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Padding(padding: EdgeInsets.all(16),
            child:Column(
            children: [Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTitle(
                size: 35,
                title: 'Service',
                weight: FontWeight.bold,
                titleColor: colors.primary,
                textAlign: TextAlign.start,
              ),
              IconButton(
                icon: Icon(Icons.tune_rounded, color: colors.primary, size: 30),
                onPressed: () {}
              ),
            ],
          )
          ,Expanded(
          child: BlocBuilder<AvatarCubit, AvatarEntity?>(
            builder: (context, avatarState) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<GetserviceBloc>().add(GetServiceDataFetch());
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  cacheExtent: 500,
                  itemCount: services.length,
                  itemBuilder: (context, index){
                    final service = services[index];
                    return Card(
                      key: ValueKey(index),
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: colors.primary, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: colors.primary,
                                  child: Text(
                                    avatarState?.initial ?? '?',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: service.type,
                                        fontWeight: FontWeight.bold,
                                        textSize: 16,
                                        textColor: colors.primary,
                                      ),
                                      AppText(text: '${service.date}  ${service.time}'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            // info row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_on_outlined, color: colors.primary, size: 16),
                                    const SizedBox(width: 4),
                                    AppText(text: service.town, textSize: 14),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.attach_money, color: colors.primary, size: 16),
                                    const SizedBox(width: 4),
                                    AppText(text: service.price, textSize: 14),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.phone_outlined, color: colors.primary, size: 16),
                                    const SizedBox(width: 4),
                                    AppText(text: service.phoneNumber, textSize: 14),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    )
    );
  }
}