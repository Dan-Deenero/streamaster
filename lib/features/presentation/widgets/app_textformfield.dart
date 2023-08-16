import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_spacer.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? textEditingController;
  final bool isAddress;
  final String? label;
  final String? hintText;
  final Widget? prefixIcon;
  final bool isPassword;
  final bool hasMaxline;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? error;
  final ValueChanged<String>? onChanged;
  final TextInputType keyboardType;
  const CustomTextFormField(
      {super.key,
      this.isAddress = false,
      this.label,
      this.hasMaxline = false,
      this.inputFormatters,
      this.onChanged,
      this.hintText,
      this.error,
      this.prefixIcon,
      this.keyboardType = TextInputType.text,
      this.textEditingController,
      this.isPassword = false,
      this.validator});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordShow = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace(1),
        TextFormField(
          maxLines: widget.hasMaxline ? 8 : 1,
          cursorColor: Theme.of(context).colorScheme.secondary,
          cursorWidth: 0.9,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          controller: widget.textEditingController,
          obscureText: isPasswordShow ? false : widget.isPassword,
          validator: widget.validator,
          style: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.surface),
          decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              errorText: widget.error,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              contentPadding: const EdgeInsets.only(left: 10, top: 10),
              errorStyle: const TextStyle(fontSize: 14),
              // suffixIcon:  showPasswordIcon(widget.isPassword),

              suffixIcon: (() {
                if (widget.isPassword) {
                  return showPasswordIcon(widget.isPassword);
                }
                if (widget.isAddress) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).colorScheme.secondary),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.location_on_outlined),
                    ),
                  );
                }
              }()),
              hintText: widget.hintText,
              hintStyle: TextStyle(fontSize: 14, color: Theme.of(context).colorScheme.secondary),
              prefixIcon: widget.prefixIcon,
              fillColor: Theme.of(context).colorScheme.primary,
              filled: true,
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.background,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)))
            ),
        ),
      ],
    );
  }

  showPasswordIcon(bool isPassword) {
    if (isPassword) {
      if (isPasswordShow) {
        return IconButton(
          icon: Icon(
            Icons.visibility,
            color: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () => setState(() {
            isPasswordShow = !isPasswordShow;
          }),
        );
      }
      return IconButton(
        icon: Icon(
          Icons.visibility_off,
          size: 18,
          color: Theme.of(context).colorScheme.secondary,
        ),
        onPressed: () => setState(() {
          isPasswordShow = !isPasswordShow;
        }),
      );
    }
  }
}
