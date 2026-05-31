import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/utils/shared/reusable/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/core/utils/shared/reusable/service_dialoge.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';
import 'package:makanek/features/addtocart/presentation/cubit/addtocart_cubit.dart';
import 'package:makanek/features/getname/presentation/pages/getowner.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_bloc.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_events.dart';
import 'package:makanek/features/getservice/presentation/widget/deleteaction.dart';
import 'package:makanek/features/getservice/presentation/widget/service_filter.dart';
import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';

class ServicesLayout extends StatefulWidget {
  final List<AddserviceOutput> services;
  final String? highlightId;

  const ServicesLayout({super.key, required this.services, this.highlightId});

  @override
  State<ServicesLayout> createState() => _ServicesLayoutState();
}

class _ServicesLayoutState extends State<ServicesLayout> {
  final ScrollController _scrollController = ScrollController();
  String? _highlightedId;

  @override
  void initState() {
    super.initState();
    if (widget.highlightId != null) {
      _highlightedId = widget.highlightId;
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToHighlighted());
    }
  }

  void _scrollToHighlighted() {
    final index = widget.services.indexWhere((s) => s.id == widget.highlightId);
    if (index == -1) return;
    const itemHeight = 160.0;
    _scrollController.animateTo(
      index * itemHeight,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _highlightedId = null);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTitle(
                size: 35,
                title: 'Services',
                weight: FontWeight.bold,
                titleColor: colors.primary,
                textAlign: TextAlign.start,
              ),
              const Spacer(),
              ServiceFilter(
                onFilterChanged: (filter) {
                  final uid = FirebaseAuth.instance.currentUser!.uid;
                  context.read<GetserviceBloc>().add(FilterService(
                    filter: filter,
                    currentUserId: uid,
                  ));
                },
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(Icons.add_circle_rounded, color: colors.primary, size: 50),
                onPressed: () => ServiceDialog.showAddServiceDialog(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<GetserviceBloc>().add(GetServiceDataFetch());
            },
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              cacheExtent: 500,
              itemCount: widget.services.length,
              itemBuilder: (context, index) {
                final service = widget.services[index];
                final isHighlighted = _highlightedId == service.id;
                return BlocProvider(
                  create: (_) => getIt<AvatarCubit>()..getAvatar(ownerId: service.ownerId),
                  child: BlocBuilder<AvatarCubit, AvatarEntity?>(
                    builder: (context, avatarState) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: isHighlighted ? colors.primary.withValues(alpha: 0.15) : Colors.transparent,
                        ),
                        child: Card(
                          key: ValueKey(service.id),
                          color: Colors.grey[200],
                          margin: const EdgeInsets.only(bottom: 12),
                          elevation: isHighlighted ? 8 : 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: isHighlighted ? colors.primary : Colors.grey[200]!,
                              width: isHighlighted ? 2 : 1,
                            ),
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
                                        OwnerName(ownerId: service.ownerId),
                                        const Spacer(),
                                        if (service.ownerId == FirebaseAuth.instance.currentUser?.uid)
                                          DeleteAction(serviceId: service.id),
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
                                        AppText(text: '${service.price} JD/HR', textSize: 14),
                                      ],
                                    ),
                                    const SizedBox(height: 34),
                                  ],
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Button(
                                    onPressed: () async {
                                      try {
                                        await getIt<AddtocartCubit>().addtocart(service.id);
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(content: Text('Added to cart')),
                                          );
                                        }
                                      } catch (e) {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text(e.toString())),
                                          );
                                        }
                                      }
                                    },
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
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}