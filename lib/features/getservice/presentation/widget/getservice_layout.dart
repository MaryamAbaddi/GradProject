import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/core/utils/shared/reusable/service_dialoge.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';
import 'package:makanek/features/getname/presentation/pages/getname.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_bloc.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_events.dart';
import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';

class ServicesLayout extends StatelessWidget {
  final List<AddserviceOutput> services;

  const ServicesLayout({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTitle(
                size: 35,
                title: 'Services',
                weight: FontWeight.bold,
                titleColor: colors.primary,
                textAlign: TextAlign.start,
              ),
              IconButton(
                icon: Icon(Icons.add_circle_rounded, color: colors.primary, size: 50),
                onPressed: () => ServiceDialog.showAddServiceDialog(context),
              ),
            ],
          ),
        ),
        Expanded(
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
                  itemBuilder: (context, index) {
                    final service = services[index];

                    return Card(
                      key: ValueKey(index),
                      color: Colors.grey[200],
                      margin: const EdgeInsets.only(bottom: 12),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.grey[200]!, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                    Getname(showHi: false),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                AppText(
                                  text: service.serviceType,
                                  fontWeight: FontWeight.bold,
                                  textSize: 16,
                                  textColor: colors.primary,
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.phone_outlined, color: colors.primary, size: 16),
                                    const SizedBox(width: 4),
                                    AppText(text: service.phoneNumber, textSize: 14),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.attach_money, color: colors.primary, size: 16),
                                    const SizedBox(width: 4),
                                    AppText(text: '${service.price} JD', textSize: 14),
                                  ],
                                ),
                                const SizedBox(height: 34),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Button(
                                onPressed: () {},
                                text: 'Book',
                                textColor: colors.onPrimary,
                                borderRadius: 28,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                elevation: 0,
                                buttonWidth: 80,
                                buttonHeight: 34,
                              ),
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
    );
  }
}