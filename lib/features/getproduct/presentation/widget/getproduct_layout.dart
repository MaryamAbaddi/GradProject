import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/core/utils/shared/reusable/product_dialog.dart';

import 'package:makanek/features/addproduct/domain/entity/addproduct_output.dart';

import 'package:makanek/features/addtocart/presentation/cubit/addtocart_cubit.dart';

import 'package:makanek/features/getname/presentation/pages/getname.dart';

import 'package:makanek/features/getproduct/presentation/bloc/getproduct_bloc.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_event.dart';

import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';

class ProductsLayout extends StatelessWidget {
  final List<AddproductOutput> products;

  const ProductsLayout({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => getIt<AddtocartCubit>(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
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
                IconButton(
                  icon: Icon(
                    Icons.add_circle_rounded,
                    color: colors.primary,
                    size: 50,
                  ),
                  onPressed: () =>
                      ProductDialog.showAddProductDialog(context),
                ),
              ],
            ),
          ),

          Expanded(
            child: BlocBuilder<AvatarCubit, AvatarEntity?>(
              builder: (context, avatarState) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<GetproductBloc>().add(
                          const GetproductFetched(),
                        );
                  },
                  child: ListView.builder(
                    scrollCacheExtent: ScrollCacheExtent.pixels(500), 
                    padding: const EdgeInsets.all(16),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return Card(
                        key: ValueKey(product.id),
                        color: Colors.grey[200],
                        margin: const EdgeInsets.only(bottom: 12),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: Colors.grey[200]!,
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Getname(
                                          showHi: false,
                                          fontWeight:
                                              FontWeight.bold,
                                          textSize: 16,
                                          textColor:
                                              colors.primary,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              Row(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          text:
                                              product.title ,
                                          fontWeight:
                                              FontWeight.bold,
                                          textSize: 16,
                                          textColor:
                                              Colors.black,
                                        ),

                                        const SizedBox(height: 6),

                                        AppText(
                                          text:
                                              product.body ,
                                          fontWeight:
                                              FontWeight.w400,
                                          textSize: 14,
                                          textAlign:
                                              TextAlign.start,
                                          textColor: colors
                                              .onSurface
                                              .withValues(
                                                alpha: 0.7,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 8),

                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(
                                          8,
                                        ),
                                        child:
                                            CachedNetworkImage(
                                          imageUrl:
                                              product.imageUrl
                                                      .trim(),
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.cover,
                                          memCacheHeight: 300,
                                          memCacheWidth: 300,
                                          fadeInDuration:
                                              Duration.zero,
                                          fadeOutDuration:
                                              Duration.zero,

                                          placeholder:
                                              (context, url) =>
                                                  const SizedBox(
                                            height: 120,
                                            width: 120,
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(
                                                strokeWidth: 2,
                                              ),
                                            ),
                                          ),

                                          errorWidget:
                                              (
                                                context,
                                                url,
                                                error,
                                              ) {
                                            return Container(
                                              height: 120,
                                              width: 120,
                                              color: Colors
                                                  .grey
                                                  .shade200,
                                              child: const Icon(
                                                Icons
                                                    .broken_image,
                                              ),
                                            );
                                          },
                                        ),
                                      ),

                                      Positioned(
                                        top: 100,
                                        right: 8,
                                        left: 8,
                                        child: Button(
                                          onPressed: () async {
                                            try {
                                              await getIt<AddtocartCubit>().addtocart(product.id,);
                                              if (context
                                                  .mounted) {
                                                ScaffoldMessenger.of(
                                                        context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      'Added to cart',
                                                    ),
                                                  ),
                                                );
                                              }
                                            } catch (e) {
                                              if (context
                                                  .mounted) {
                                                ScaffoldMessenger.of(
                                                        context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      e.toString(),
                                                    ),
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                          text: 'Add',
                                          textColor:
                                              Colors.white,
                                          borderRadius: 20,
                                          fontSize: 14,
                                          fontWeight:
                                              FontWeight.w600,
                                          elevation: 0,
                                          buttonWidth:
                                              context.buttonSize /
                                                  4,
                                          buttonHeight:
                                              context.buttonSizeH /
                                                  1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              AppText(
                                text:
                                    '${product.price} JD',
                                fontWeight:
                                    FontWeight.w600,
                                textSize: 14,
                                textColor: Colors.black,
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
      ),
    );
  }
}