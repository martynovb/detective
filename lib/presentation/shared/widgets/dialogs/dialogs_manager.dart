import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../localization/locale_keys.g.dart';
import '../../theme/colors.gen.dart';
import '../../theme/dimensions.dart';
import '../buttons.dart';
import 'loading_dialog.dart';
import 'simple_app_dialog.dart';

class DialogsManager {
  final GlobalKey<NavigatorState> navigatorKey;

  DialogsManager(this.navigatorKey);

  void showErrorDialog({
    String? title,
    String? description,
    void Function()? onTap,
    List<Widget>? actions,
    bool isMobile = false,
  }) {
    final defaultTitle = title ?? LocaleKeys.errors_errorTitle.tr();
    final defaultDescription =
        description ?? LocaleKeys.errors_somethingWentWrong.tr();
    final showDefault = title == null && description == null;

    showCustomDialog(
      barrierDismissible: true,
      child: SimpleAppDialog(
        isMobile: isMobile,
        title: title == null && !showDefault
            ? null
            : Text(
                defaultTitle,
                style: Theme.of(navigatorKey.currentContext!)
                    .textTheme
                    .displayMedium
                    ?.copyWith(
                      color: AppColors.error,
                    ),
                textAlign: TextAlign.center,
              ),
        description: description == null && !showDefault
            ? null
            : Text(
                defaultDescription,
                style:
                    Theme.of(navigatorKey.currentContext!).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
        actions: actions ??
            [
              Buttons.simpleButton(
                text: LocaleKeys.ok.tr(),
                onPressed: onTap ?? () => hideDialog(),
              ),
            ],
      ),
    );
  }

  void showCustomDialog({
    required Widget child,
    bool asPage = false,
    bool barrierDismissible = true,
  }) {
    final navigator = navigatorKey.currentState;
    if (navigator == null) return;

    hideDialog();

    navigator.push(
      DialogRoute(
        builder: (_) => asPage ? _getPageDialog(page: child) : child,
        barrierDismissible: barrierDismissible,
        context: navigatorKey.currentContext!,
      ),
    );
  }

  void showLoadingDialog({
    String? message,
    bool showLoading = true,
  }) {
    if (!showLoading) {
      hideDialog();
      return;
    }

    showCustomDialog(
      barrierDismissible: false,
      child: LoadingDialog(message: message),
    );
  }

  void hideDialog() {
    final navigator = navigatorKey.currentState;
    if (navigator != null && navigator.canPop()) {
      navigator.pop();
    }
  }

  Widget _getPageDialog({required Widget page}) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(Dimensions.dialogBorderRadius),
            ),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: Dimensions.maxMobileWidth,
              ),
              child: page,
            ),
          ),
        ),
      ),
    );
  }
}
