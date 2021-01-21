import 'package:flutterstore/config/ps_colors.dart';
import 'package:flutterstore/constant/ps_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutterstore/utils/utils.dart';

class PSButtonWidget extends StatefulWidget {
  const PSButtonWidget(
      {this.onPressed,
      this.titleText = '',
      this.titleTextAlign = TextAlign.center,
      this.colorData,
      this.width,
      this.gradient,
      this.hasShadow = false});

  final Function onPressed;
  final String titleText;
  final Color colorData;
  final double width;
  final Gradient gradient;
  final bool hasShadow;
  final TextAlign titleTextAlign;

  @override
  _PSButtonWidgetState createState() => _PSButtonWidgetState();
}

class _PSButtonWidgetState extends State<PSButtonWidget> {
  Gradient _gradient;
  Color _color;
  @override
  Widget build(BuildContext context) {
    _color = widget.colorData;
    _gradient = null;

    _color ??= PsColors.mainColor;

    if (widget.gradient == null && _color == PsColors.mainColor) {
      _gradient = LinearGradient(colors: <Color>[
        PsColors.mainColor,
        PsColors.mainDarkColor,
      ]);
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(7.0)),

        color: _gradient == null ? _color : null,
        gradient: _gradient,
      ),
      child: Material(
        color: PsColors.transparent,
        type: MaterialType.card,
        clipBehavior: Clip.antiAlias,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(PsDimens.space8))),
        child: InkWell(
          onTap: widget.onPressed,
          highlightColor: PsColors.mainDarkColor,
          child: Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  left: PsDimens.space8, right: PsDimens.space8),
              child: Text(
                widget.titleText.toUpperCase(),
                textAlign: widget.titleTextAlign,
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: PsColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PSButtonWithIconWidget extends StatefulWidget {
  const PSButtonWithIconWidget(
      {this.onPressed,
      this.titleText = '',
      this.colorData,
      this.width,
      this.gradient,
      this.icon,
      this.iconAlignment = MainAxisAlignment.center,
      this.hasShadow = false});

  final Function onPressed;
  final String titleText;
  final Color colorData;
  final double width;
  final IconData icon;
  final Gradient gradient;
  final MainAxisAlignment iconAlignment;
  final bool hasShadow;

  @override
  _PSButtonWithIconWidgetState createState() => _PSButtonWithIconWidgetState();
}

class _PSButtonWithIconWidgetState extends State<PSButtonWithIconWidget> {
  Gradient _gradient;
  Color _color;
  @override
  Widget build(BuildContext context) {
    _color = widget.colorData;
    _gradient = null;

    _color ??= PsColors.mainColor;

    if (widget.gradient == null && _color == PsColors.mainColor) {
      _gradient = LinearGradient(colors: <Color>[
        PsColors.mainColor,
        PsColors.mainDarkColor,
      ]);
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(7.0)),

        color: _gradient == null ? _color : null,
        gradient: _gradient,
      ),
      child: Material(
        color: PsColors.transparent,
        type: MaterialType.card,
        clipBehavior: Clip.antiAlias,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(PsDimens.space8))),
        child: InkWell(
          onTap: widget.onPressed,
          highlightColor: PsColors.mainDarkColor,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: widget.iconAlignment,
            children: <Widget>[
              if (widget.icon != null) Icon(widget.icon, color: PsColors.white),
              if (widget.icon != null)
                const SizedBox(
                  width: PsDimens.space8,
                ),
              Text(
                widget.titleText.toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: PsColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
