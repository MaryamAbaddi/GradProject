import 'package:flutter/material.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/reusable/lib1.dart';
import 'package:makanek/features/onboarding/domain/entity/onboard_entity.dart';
import 'package:makanek/features/onboarding/presentation/widgets/bottom_bar.dart';


class OnbordLayout extends StatefulWidget {
  final OnBoardEntity page;
  final VoidCallback onNext;

  const OnbordLayout({
    super.key,
    required this.page,
    required this.onNext,
  });

  @override
  State<OnbordLayout> createState() => _OnbordLayoutState();
}

class _OnbordLayoutState extends State<OnbordLayout> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage(widget.page.imagePath), context);
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: context.horizontal, top: context.vertical * 0.3),
            child: Align(
              alignment: Alignment.topRight,
              child: Button(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.welcome);
                },
                isText: true,
                textColor: colors.onSecondary,
                borderRadius: 0,
                fontSize: 16,
                text: 'Skip',
                buttonWidth: 0,
                fontWeight: FontWeight.w700,
                elevation: 0,
                buttonHeight: context.buttonSizeH*2,
              ),
            ),
          ),
          Spacer(),
          Image.asset(
            widget.page.imagePath,
            width: 250,
            height: 250,
          ),
          Spacer(),
          BottomBar(
            onNext: widget.onNext,
            title: widget.page.title,
            text: widget.page.subTitle,
            color1: colors.onSurface,
            size: 20,
            sizeT: 12,
            weight: FontWeight.w800,
            cButtontext: colors.primary,
            buttonWidth: context.buttonSize*0.3,
            borderRaduis: 80,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            elevation: 8,
            textColor: Colors.white,
            
          ),
        ],
      ),
    );
  }
}