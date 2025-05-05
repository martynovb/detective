import 'package:flutter/material.dart';

import '../theme/colors.gen.dart';
import '../theme/dimensions.dart';

class AppInputField extends StatefulWidget {
  final Key? inputKey;
  final Key? errorKey;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool showPasswordToggle;
  final bool enableErrors;
  final int maxLines;
  final String? errorMessage;

  const AppInputField({
    super.key,
    this.inputKey,
    this.errorKey,
    this.controller,
    this.hintText,
    this.labelText,
    this.showPasswordToggle = false,
    this.enableErrors = false,
    this.maxLines = 1,
    this.errorMessage,
  });

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  bool _passwordVisible = false;
  String? errorText;

  @override
  void didChangeDependencies() {
    errorText = widget.errorMessage;
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(AppInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.errorMessage != widget.errorMessage) {
      setState(() {
        errorText = widget.errorMessage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Text(
            widget.labelText!,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        AppSpacing.h8,
        TextFormField(
          key: widget.inputKey,
          controller: widget.controller,
          style: Theme.of(context).textTheme.labelSmall,
          maxLines: widget.maxLines,
          obscureText: widget.showPasswordToggle ? !_passwordVisible : false,
          onChanged: (value) => setState(
            () {
              errorText = null;
            },
          ),
          cursorColor: Theme.of(context).colorScheme.secondary,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(Sizes.s16),
            error: (widget.enableErrors && errorText != null) ? _errorWidget(errorText!) : null,
            errorMaxLines: 1,
            suffixIcon: _sufixIcon(),
            border: _border(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
            focusedBorder: _border(
              color: Theme.of(context).colorScheme.secondary,
            ),
            errorBorder: _border(
              color: Theme.of(context).colorScheme.error,
            ),
            focusedErrorBorder: _border(
              color: Theme.of(context).colorScheme.error,
            ),
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        if (widget.enableErrors && errorText == null)
          AppSpacing.h24,
      ],
    );
  }

  Widget _errorWidget(String error) {
    return SizedBox(
      height: Dimensions.inputFieldErrorHeight,
      child: Transform(
        transform: Matrix4.translationValues(-Sizes.s12, 0, 0),
        child: Row(
          children: [
            Icon(
              Icons.error_outline,
              size: 16,
              color: Theme.of(context).colorScheme.error,
            ),
            AppSpacing.w4,
            Text(
              error,
              key: widget.errorKey,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.error,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget? _sufixIcon() => widget.showPasswordToggle
      ? Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
              size: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        )
      : null;

  InputBorder _border({
    required Color color,
  }) =>
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: color,
          width: 2,
        ),
      );
}
