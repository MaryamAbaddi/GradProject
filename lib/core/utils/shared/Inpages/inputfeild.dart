part of 'lib1.dart';

class InputFeild extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction action;
  final String text;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final void Function(String)? onChanged; // 👈 add this

  const InputFeild({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.text,
    required this.action,
    this.obscureText = false,
    this.validator,
    this.suffix,
    this.onChanged, // 👈 add this
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: action,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged, // 👈 add this
      decoration: InputDecoration(
        labelText: text,
        suffixIcon: suffix,
        labelStyle: GoogleFonts.inter(color: colors.onSurface),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.primary, width: 1.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colors.primary, width: 2),
        ),
      ),
    );
  }
}