part of '../Inpages/lib1.dart';

class Button extends StatelessWidget {
  final Color? buttonColor;
  final Color textColor;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final String text;
  final double elevation;
  final String? iconPath;
  final VoidCallback? onPressed;
  final double buttonWidth;
  final double buttonHeight;
  final bool isText;

  const Button({
    super.key,
    this.buttonColor,
    required this.textColor,
    required this.borderRadius,
    required this.fontSize,
    required this.text,
    this.iconPath,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.fontWeight,
    required this.elevation,
    this.isText = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    if (isText) {
      return GestureDetector(
        onTap: onPressed,
        child: AppText(
          text: text,
          fontWeight: fontWeight,
          textSize: fontSize,
          textColor: textColor,
        ),
      );
    }

    return Center(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: buttonWidth,
          height:buttonHeight,
          decoration: BoxDecoration(
            color: buttonColor ?? colors.primary,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: iconPath != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(iconPath!, width: 18, height: 18),
                    const SizedBox(width: 8),
                    AppText(
                      text: text,
                      fontWeight: fontWeight,
                      textSize: fontSize,
                      textColor: textColor,
                    ),
                  ],
                )
              : Center(
                  child: AppText(
                    text: text,
                    fontWeight: fontWeight,
                    textSize: fontSize,
                    textColor: textColor,
                  ),
                ),
        ),
      ),
    );
  }
}