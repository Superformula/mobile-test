import 'package:flutter/material.dart';
import 'package:qr_generator/index/expanding-action-button.dart';

class ExpandableFab extends StatefulWidget {

  // second key needed to pass down the tree to the actual button
  final Key? buttonKey;
  final double distance;
  final List<Widget> children;
  final Function(bool) onTap;
  final bool isExpanded;
  final Stream<bool>? expansionChangeListenable;

  ExpandableFab({
    Key? key,
    this.buttonKey,
    required this.distance,
    required this.children,
    required this.onTap,
    required this.isExpanded,
    this.expansionChangeListenable
  }) : super(key: key);

 @override
 _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> with SingleTickerProviderStateMixin {

  late final AnimationController _expansionAnimationController;
  late final Animation<double> _expandAnimation;

  @override
    void initState() {
    super.initState();

    _expansionAnimationController = AnimationController(
      value: widget.isExpanded ? 1.0 : 0.0,
      duration: Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _expansionAnimationController,
    );

    _registerExpansionChangeListener();
  }

  void _registerExpansionChangeListener() {
    if(widget.expansionChangeListenable != null) {
      widget.expansionChangeListenable!.listen((bool isExpanded) { 
        isExpanded
            ? _expansionAnimationController.forward()
            : _expansionAnimationController.reverse();
      });
    }
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: widget.isExpanded,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          widget.isExpanded ? 0.7 : 1.0,
          widget.isExpanded ? 0.7 : 1.0,
          1.0,
        ),
        duration: Duration(milliseconds: 250),
        curve: Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: widget.isExpanded ? 0.0 : 1.0,
          curve: Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: Duration(milliseconds: 250),
          child: FloatingActionButton(
            key: widget.buttonKey,
            onPressed: () {
              widget.onTap(true);
              _expansionAnimationController.forward();
            },
            child: Icon(Icons.create),
          ),
        ),
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: InkWell(
            onTap: () {
              widget.onTap(false);
              _expansionAnimationController.reverse();
            },
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    double steppedDistance = widget.distance / count;
    for (var i = 0; i < count; i++) {
      children.add(
        ExpandingActionButton(
          maxDistance: steppedDistance+=steppedDistance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }
}