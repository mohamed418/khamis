// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, avoid_print

// import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:readmore/readmore.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'colors.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// void launchWhatsApp() async {
//   String url =
//       "whatsapp://send?phone=+201112870010&text=i want this product%2C%20please!";
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

double screenWidth(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * value;
}

double screenHeight(BuildContext context, double value) {
  return MediaQuery.of(context).size.height * value;
}

double padding(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.04;
}

TextFormField TFF({
  validator,
  required action,
  required TextInputType? type,
  required bool isPrefix,
  required bool underlineBorder,
  String? label,
  dynamic controller,
  IconData? prefix,
  IconData? suffix,
  Widget? suffixWidget,
  bool secure = false,
  suffixPressed,
  prefixPressed,
  Function? onSubmit,
  String? hint,
  Color? hintColor,
  dynamic hintSize,
  Color? SuffixContainerColor,
  Color? labelColor,
  bool readOnly = false,
  VoidCallback? fun,
  VoidCallback? onEditingComplete,
  Color? bc,
  bool? filled,
  Color? filledColor,
  Color? borderColor,
  Color? prefixColor,
  Color? suffixColor,
  Color? outLineBorderColor,
  Color? underLineBorderColor,
  Color? textColor,
  int? maxLines,
  double? suffixSize,
  double? borderRadius,
  double? prefixIconSize,
  FloatingLabelBehavior? labelBehavior,
  bool isOutLineBorder = false,
  bool isEnabledBorder = false,
  ValueChanged<String>? onChanged,
}) =>
    TextFormField(
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      style: TextStyle(color: textColor ?? Colors.blue),
      maxLines: maxLines,
      onTap: fun,
      controller: controller,
      readOnly: readOnly,
      validator: validator,
      textInputAction: action,
      keyboardType: type,
      obscureText: secure,
      decoration: InputDecoration(
        floatingLabelBehavior: labelBehavior ?? FloatingLabelBehavior.auto,
        focusedBorder: isOutLineBorder
            ? OutlineInputBorder(
                borderSide:
                    BorderSide(color: outLineBorderColor ?? Colors.blue),
                borderRadius: BorderRadius.circular(borderRadius ?? 20),
              )
            : UnderlineInputBorder(
                borderSide:
                    BorderSide(color: underLineBorderColor ?? Colors.blue),
                borderRadius: BorderRadius.circular(borderRadius ?? 20),
              ),
        errorBorder: underlineBorder
            ? UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(borderRadius ?? 20),
              )
            : OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(borderRadius ?? 20),
              ),
        enabledBorder: underlineBorder
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 20),
                borderSide:
                    BorderSide(color: underLineBorderColor ?? borderColor!),
              )
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 20),
                borderSide: BorderSide(color: borderColor!),
              ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
          borderSide: isEnabledBorder
              ? const BorderSide(color: Color.fromRGBO(217, 217, 217, 1))
              : BorderSide(color: Colors.grey),
        ),
        prefixIcon: isPrefix
            ? IconButton(
                icon: Icon(
                  prefix,
                  color: prefixColor ?? Colors.blue,
                  size: prefixIconSize ?? 25,
                ),
                onPressed: () {
                  prefixPressed();
                },
              )
            : null,
        hintText: hint,
        hintStyle: TextStyle(
          color: hintColor ?? const Color.fromRGBO(126, 126, 126, 1),
          fontSize: hintSize ?? 14,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
        filled: filled,
        fillColor: filledColor ?? Colors.white,
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 16,
          color: labelColor ?? Colors.blue,
          fontWeight: FontWeight.w400,
          overflow: TextOverflow.ellipsis,
        ),
        floatingLabelStyle: TextStyle(
          fontSize: 20,
          color: labelColor ?? Colors.blue,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
        ),
        suffixIcon: Padding(
          padding: SuffixContainerColor != null
              ? const EdgeInsets.all(8.0)
              : const EdgeInsets.all(0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: SuffixContainerColor ?? Colors.transparent,
            ),
            child: suffixWidget != null
                ? InkWell(
                    child: suffixWidget,
                    onTap: () {
                      suffixPressed();
                    },
                  )
                : IconButton(
                    icon: Icon(
                      suffix,
                      size: suffixSize ?? 25,
                      color: suffixColor ?? Colors.blue,
                    ),
                    onPressed: () {
                      suffixPressed();
                    },
                  ),
          ),
        ),
      ),
    );

TextStyle midTextStyle(BuildContext context, color) {
  return TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color,
    // overflow: TextOverflow.ellipsis,
  );
}
AnimatedSwitcher buildAnimatedSwitcher(
  BuildContext context, {
  required value1,
  required value2,
  required text1,
  required text2,
  required bool isExpanded,
  required Function function1,
  required Function function2,
  required width,
  unPressedBColor,
}) {
  return AnimatedSwitcher(
    duration: const Duration(seconds: 6),
    child: isExpanded
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: InkWell(
                    key: ValueKey<bool>(value1),
                    onTap: () {
                      function1();
                    },
                    child: Container(
                      width: screenWidth(context, .4),
                      decoration: BoxDecoration(
                        color: value1
                            ? Colors.blue
                            : unPressedBColor ??
                                const Color.fromRGBO(0, 9, 23, 0.06),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            text1,
                            style: midTextStyle(
                              context,
                              value1 ? Colors.white : Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: InkWell(
                    key: ValueKey<bool>(value2),
                    onTap: () {
                      function2();
                    },
                    child: Container(
                      width: screenWidth(context, .4),
                      decoration: BoxDecoration(
                        color: value2
                            ? Colors.blue
                            : unPressedBColor ??
                                const Color.fromRGBO(0, 9, 23, 0.06),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            text2,
                            style: midTextStyle(
                              context,
                              value2 ? Colors.white : Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        : Row(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: InkWell(
                  key: ValueKey<bool>(value1),
                  onTap: () {
                    function1();
                  },
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: value1
                            ? Colors.blue
                            : const Color.fromRGBO(186, 186, 186, 1),
                      ),
                      color: value1
                          ? Colors.blue
                          : unPressedBColor ??
                              const Color.fromRGBO(0, 9, 23, 0.06),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          text1,
                          style: midTextStyle(
                            context,
                            value1 ? Colors.white : Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: InkWell(
                  key: ValueKey<bool>(value2),
                  onTap: () {
                    function2();
                  },
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: value2
                            ? Colors.blue
                            : const Color.fromRGBO(186, 186, 186, 1),
                      ),
                      color: value2
                          ? Colors.blue
                          : unPressedBColor ??
                              const Color.fromRGBO(0, 9, 23, 0.06),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          text2,
                          style: midTextStyle(
                            context,
                            value2 ? Colors.white : Colors.black,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
  );
}
