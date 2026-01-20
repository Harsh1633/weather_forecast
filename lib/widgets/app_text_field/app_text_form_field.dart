
import 'package:control_style/control_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_forecast/core/colors/app_colors.dart';
// Import if using SVG images

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? suffixText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? Function(String)? onSubmitted;
  final Function(String)? onChanged;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final bool? obscureText;
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final Color? borderColour;
  final Color? errorColour;
  final Color? hintTextColour;
  final TextInputType? textInputType;
  final bool? readOnly;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final Widget? prefixIcon;
  final int? errorMaxLine;
  final String? comingFrom;
  final String? backgroundImage;
  final TextCapitalization? textCapitalization;
  final bool? enableInteractiveSelection;
  final List<TextInputFormatter>? inputFormatters;
  final GestureTapCallback? onTap;
  final int? maxLines;
  final TextAlign? textAlign;
  final void Function(PointerDownEvent)? onTapOutside;

  CustomTextFormField({
    this.controller,
    Key? key,
    this.suffixText,
    this.prefixIcon,
    this.hintText,
    this.enabled,
    this.contentPadding,
    this.onSubmitted,
    this.onChanged,
    this.validator,
    this.inputAction,
    this.focusNode,
    this.obscureText,
    this.prefixWidget,
    this.suffixIcon,
    this.borderColour,
    this.errorColour,
    this.hintTextColour,
    this.textInputType,
    this.errorMaxLine,
    this.readOnly,
    this.comingFrom,
    this.backgroundImage,
    this.textCapitalization,
    this.inputFormatters,
    this.enableInteractiveSelection,
    this.maxLines,
    this.onTap,
    this.textAlign, this.onTapOutside,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      onTapOutside: (value) {  if (FocusScope.of(context).isFirstFocus) {    FocusScope.of(context).requestFocus(FocusNode());  }},
      onTap: onTap,
      textAlign: textAlign ?? TextAlign.start,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      decoration: InputDecoration(
        filled: true,
        fillColor: (enabled ?? true)
            ? AppColors.darkInput
            : Colors.transparent,
        suffix: suffixText != null
            ? const Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Text('%', style: TextStyle(color: Colors.white)),
        )
            : null,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18,
          color:AppColors.darkCard
        ),
        border: DecoratedInputBorder(
            innerShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.45),
                  blurRadius: 12,
                  offset: const Offset(6, 6),
                  spreadRadius: 0
              ),
              BoxShadow(
                color:Colors.white.withOpacity(.05) ,
                blurRadius: 12,
                spreadRadius: 0,
                offset: const Offset(-6, -6),
              )
            ],
            child: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        enabledBorder: DecoratedInputBorder(
            innerShadow: [
              BoxShadow(
                color:Colors.black.withOpacity(.45),
                blurRadius: 12,
                offset: const Offset(6, 6),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(.05),
                blurRadius: 12,
                // spreadRadius: 5,
                offset: const Offset(-6, -6),
              )
            ],
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.transparent)
            )),

        focusedBorder: DecoratedInputBorder(
          innerShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.45),
              blurRadius: 12,
              offset: const Offset(6, 6),
            ),
            BoxShadow(
              color: Colors.white.withOpacity(.05),
              blurRadius: 12,
              // spreadRadius: 5,
              offset: const Offset(-6, -6),
            )
          ],
          child: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.darkPrimary,
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),),

        errorBorder: DecoratedInputBorder(
            innerShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.45),
                blurRadius: 12,
                offset: const Offset(6, 6),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(.05),
                blurRadius: 12,
                // spreadRadius: 5,
                offset: const Offset(-6, -6),
              )
            ],
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.red,
                ))),

        focusedErrorBorder: DecoratedInputBorder(
            innerShadow: [
              BoxShadow(
                color:Colors.black.withOpacity(.45),
                blurRadius: 12,
                offset: const Offset(6, 6),
              ),
              BoxShadow(
                color: Colors.white.withOpacity(.05),
                blurRadius: 12,
                // spreadRadius: 5,
                offset: const Offset(-6, -6),
              )
            ],
            child: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.red,
                ))),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        counterText: '',
        prefix: prefixWidget,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: contentPadding ??
            EdgeInsets.only(left: 16, top: 14, bottom: 14),
        errorStyle: const TextStyle(
          color: Colors.red, overflow: TextOverflow.visible,
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(PointSize.value6),
        //   borderSide: BorderSide(color: isDarkTheme ? Colors.transparent : Colors.transparent, width: 0.5),
        // ),
        errorMaxLines: errorMaxLine,
      ),
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      enabled: enabled,
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      enableInteractiveSelection: enableInteractiveSelection ?? true,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      textInputAction: inputAction,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      inputFormatters: inputFormatters,
    );
  }
}