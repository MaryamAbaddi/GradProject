part of 'lib1.dart';



class CheckBox extends StatefulWidget {
  final String? text;

  const CheckBox({
    super.key,
    this.text,
  });

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
   bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _rememberMe,
          onChanged: (value) => setState(() => _rememberMe = value!),
        ),
        Text(widget.text ?? 'Remember me'),
      ],
    );
  }
}