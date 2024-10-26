import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rating_bar_component_model.dart';
export 'rating_bar_component_model.dart';

class RatingBarComponentWidget extends StatefulWidget {
  const RatingBarComponentWidget({
    super.key,
    this.parameter1,
  });

  final double? parameter1;

  @override
  State<RatingBarComponentWidget> createState() =>
      _RatingBarComponentWidgetState();
}

class _RatingBarComponentWidgetState extends State<RatingBarComponentWidget> {
  late RatingBarComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingBarComponentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
      child: RatingBarIndicator(
        itemBuilder: (context, index) => Icon(
          Icons.star_rounded,
          color: FlutterFlowTheme.of(context).secondary,
        ),
        direction: Axis.horizontal,
        rating: valueOrDefault<double>(
          widget.parameter1,
          4.0,
        ),
        unratedColor: FlutterFlowTheme.of(context).accent3,
        itemCount: 5,
        itemSize: 24.0,
      ),
    );
  }
}
