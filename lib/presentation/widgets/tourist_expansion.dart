// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:test_app_effective/colors.dart';

const Duration _kExpand = Duration(milliseconds: 200);

class TouristExpansionTile extends StatefulWidget {
  const TouristExpansionTile({
    Key? key,
    this.leading,
    required this.title,
    this.backgroundColor,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
  })  : assert(initiallyExpanded != null),
        super(key: key);

  final Widget? leading;
  final Widget title;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget>? children;
  final Color? backgroundColor;
  final Widget? trailing;
  final bool? initiallyExpanded;

  @override
  TouristExpansionTileState createState() => TouristExpansionTileState();
}

class TouristExpansionTileState extends State<TouristExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _easeOutAnimation;
  late CurvedAnimation _easeInAnimation;
  late ColorTween _borderColor;
  late ColorTween _headerColor;
  late ColorTween _iconColor;
  late ColorTween _backgroundColor;
  late Animation<double> _iconTurns;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    _easeOutAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _easeInAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _borderColor = ColorTween();
    _headerColor = ColorTween();
    _iconColor = ColorTween();
    _iconTurns = Tween<double>(begin: 0.0, end: 0.5).animate(_easeInAnimation);
    _backgroundColor = ColorTween();

    _isExpanded =
        PageStorage.of(context).readState(context) ?? widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void expand() {
    _setExpanded(true);
  }

  void collapse() {
    _setExpanded(false);
  }

  void toggle() {
    _setExpanded(!_isExpanded);
  }

  void _setExpanded(bool isExpanded) {
    if (_isExpanded != isExpanded) {
      setState(() {
        _isExpanded = isExpanded;
        if (_isExpanded) {
          _controller.forward();
        } else {
          _controller.reverse().then<void>((void value) {
            setState(() {
              // Rebuild without widget.children.
            });
          });
        }
        PageStorage.of(context).writeState(context, _isExpanded);
      });
      if (widget.onExpansionChanged != null) {
        widget.onExpansionChanged!(_isExpanded);
      }
    }
  }

  Widget _buildChildren(BuildContext context, Widget? child) {
    final Color borderSideColor =
        _borderColor.evaluate(_easeOutAnimation) ?? Colors.transparent;
    final Color titleColor = _headerColor.evaluate(_easeInAnimation)!;

    return Theme(
        data: ThemeData(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            dividerColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
              color: _backgroundColor.evaluate(_easeOutAnimation) ??
                  Colors.transparent,
              border: Border(
                top: BorderSide(color: borderSideColor),
                bottom: BorderSide(color: borderSideColor),
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconTheme.merge(
                  data: IconThemeData(
                      color: _iconColor.evaluate(_easeInAnimation)),
                  child: InkWell(
                      onTap: toggle,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              widget.title,
                              widget.trailing ??
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: LightThemeColors.bluelight),
                                    child: RotationTransition(
                                        turns: _iconTurns,
                                        child: const Icon(
                                          Icons.expand_more,
                                          color: LightThemeColors.blue,
                                        )),
                                  ),
                            ]),
                      ))),
              ClipRect(
                child: Align(
                  heightFactor: _easeInAnimation.value,
                  child: child,
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        dividerColor: Colors.transparent);
    _borderColor.end = theme.dividerColor;
    _headerColor
      ..begin = theme.textTheme.subtitle1?.color
      ..end = theme.scaffoldBackgroundColor;
    _iconColor
      ..begin = theme.unselectedWidgetColor
      ..end = const Color(0xFF185AC5);
    _backgroundColor.end = widget.backgroundColor;

    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed
          ? null
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: widget.children!)),
    );
  }
}
