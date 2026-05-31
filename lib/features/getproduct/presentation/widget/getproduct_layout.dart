import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/reusable/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/core/utils/shared/reusable/product_dialog.dart';
import 'package:makanek/features/addproduct/domain/entity/addproduct_output.dart';
import 'package:makanek/features/addtocart/presentation/cubit/addtocart_cubit.dart';
import 'package:makanek/features/getname/presentation/pages/getowner.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_bloc.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_event.dart';
import 'package:makanek/features/getproduct/presentation/widget/deleteaction.dart';
import 'package:makanek/features/getproduct/presentation/widget/filter_product.dart';
import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';

class ProductsLayout extends StatefulWidget {
  final List<AddproductOutput> products;
  final String? highlightId;

  const ProductsLayout({
    super.key,
    required this.products,
    this.highlightId,
  });

  @override
  State<ProductsLayout> createState() => _ProductsLayoutState();
}

class _ProductsLayoutState extends State<ProductsLayout> {
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
    final index = widget.products.indexWhere((p) => p.id == widget.highlightId);
    if (index == -1) return;
    const itemHeight = 220.0;
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

    return BlocProvider(
      create: (_) => getIt<AddtocartCubit>(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTitle(
                  size: 35,
                  title: 'Products',
                  weight: FontWeight.bold,
                  titleColor: colors.primary,
                  textAlign: TextAlign.start,
                ),
                Row(
                  children: [
                    ProductFilter(
                      onFilterChanged: (filter) {
                        final uid = FirebaseAuth.instance.currentUser!.uid;
                        context.read<GetproductBloc>().add(FilterProduct(
                          filter: filter,
                          currentUserId: uid,
                        ));
                      },
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(Icons.add_circle_rounded, color: colors.primary, size: 50),
                      onPressed: () => ProductDialog.showAddProductDialog(context),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<GetproductBloc>().add(const GetproductFetched());
              },
              child: ListView.builder(
                controller: _scrollController,
                scrollCacheExtent: ScrollCacheExtent.pixels(500),
                padding: const EdgeInsets.all(16),
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  final product = widget.products[index];
                  final isHighlighted = _highlightedId == product.id;
                  return BlocProvider(
                    create: (_) => getIt<AvatarCubit>()..getAvatar(ownerId: product.ownerId),
                    child: BlocBuilder<AvatarCubit, AvatarEntity?>(
                      builder: (context, avatarState) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: isHighlighted ? colors.primary.withValues(alpha: 0.15) : Colors.transparent,
                          ),
                          child: Card(
                            key: ValueKey(product.id),
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
                              child: Column(
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
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            OwnerName(ownerId: product.ownerId),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: context.vertical * 3),
                                      if (product.ownerId == FirebaseAuth.instance.currentUser?.uid)
                                        DeleteActionP(productId: product.id),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            AppText(
                                              text: product.title,
                                              fontWeight: FontWeight.bold,
                                              textSize: 16,
                                              textColor: Colors.black,
                                            ),
                                            const SizedBox(height: 6),
                                            AppText(
                                              text: product.body,
                                              fontWeight: FontWeight.w400,
                                              textSize: 14,
                                              textAlign: TextAlign.start,
                                              textColor: colors.onSurface.withValues(alpha: 0.7),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: CachedNetworkImage(
                                              imageUrl: product.imageUrl.trim(),
                                              height: 120,
                                              width: 120,
                                              fit: BoxFit.cover,
                                              memCacheHeight: 300,
                                              memCacheWidth: 300,
                                              fadeInDuration: Duration.zero,
                                              fadeOutDuration: Duration.zero,
                                              placeholder: (context, url) => const SizedBox(
                                                height: 120,
                                                width: 120,
                                                child: Center(
                                                  child: CircularProgressIndicator(strokeWidth: 2),
                                                ),
                                              ),
                                              errorWidget: (context, url, error) => Container(
                                                height: 120,
                                                width: 120,
                                                color: Colors.grey.shade200,
                                                child: const Icon(Icons.broken_image),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 100,
                                            right: 8,
                                            left: 8,
                                            child: Button(
                                              onPressed: () async {
                                                try {
                                                  await getIt<AddtocartCubit>().addtocart(product.id);
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
                                              text: 'Add',
                                              textColor: Colors.white,
                                              borderRadius: 20,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              elevation: 0,
                                              buttonWidth: context.buttonSize / 4,
                                              buttonHeight: context.buttonSizeH / 1.5,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  AppText(
                                    text: '${product.price} JD',
                                    fontWeight: FontWeight.w600,
                                    textSize: 14,
                                    textColor: Colors.black,
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
      ),
    );
  }
}