part of 'lib1.dart';

class InputFeild extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction action;
  final String text;
  final bool obscureText;
  final bool readOnly;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final void Function(String)? onChanged;
  final double? width;
  final FocusNode? focusNode;
  final bool hideBorder; // 👈 add this

  const InputFeild({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.text,
    required this.action,
    this.obscureText = false,
    this.readOnly = false,
    this.validator,
    this.suffix,
    this.onChanged,
    this.width,
    this.focusNode,
    this.hideBorder = false, // 👈 default: border is shown
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        focusNode: focusNode,
        textInputAction: action,
        obscureText: obscureText,
        readOnly: readOnly,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: text,
          suffixIcon: suffix,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          labelStyle: GoogleFonts.inter(color: colors.onSurface),
          enabledBorder: hideBorder
              ? InputBorder.none
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: colors.primary, width: 1.5),
                ),
          focusedBorder: hideBorder
              ? InputBorder.none
              : UnderlineInputBorder(
                  borderSide: BorderSide(color: colors.primary, width: 2),
                ),
        ),
      ),
    );
  }
}