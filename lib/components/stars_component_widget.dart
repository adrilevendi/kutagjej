import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'stars_component_model.dart';
export 'stars_component_model.dart';

class StarsComponentWidget extends StatefulWidget {
  const StarsComponentWidget({
    super.key,
    this.parameter1,
  });

  final double? parameter1;

  @override
  State<StarsComponentWidget> createState() => _StarsComponentWidgetState();
}

class _StarsComponentWidgetState extends State<StarsComponentWidget> {
  late StarsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StarsComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
      child: RatingBar.builder(
        onRatingUpdate: (newValue) =>
            setState(() => _model.ratingBarValue = newValue),
        itemBuilder: (context, index) => Icon(
          Icons.star_rounded,
          color: FlutterFlowTheme.of(context).alternate,
        ),
        direction: Axis.horizontal,
        initialRating: _model.ratingBarValue ??= widget.parameter1!,
        unratedColor: FlutterFlowTheme.of(context).accent3,
        itemCount: 5,
        itemSize: 24.0,
        glowColor: FlutterFlowTheme.of(context).alternate,
      ),
    );
  }
}
