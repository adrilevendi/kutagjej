import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_tease_model.dart';

export 'post_tease_model.dart';

class PostTeaseWidget extends StatefulWidget {
  const PostTeaseWidget({
    super.key,
    required this.post,
  });

  final PostRecord? post;

  @override
  State<PostTeaseWidget> createState() => _PostTeaseWidgetState();
}

class _PostTeaseWidgetState extends State<PostTeaseWidget> {
  late PostTeaseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostTeaseModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(1.0, 1.0),
      child: Stack(
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
              child: Container(
                width: 250.0,
                height: 160.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x401D2429),
                    )
                  ],
                  borderRadius: BorderRadius.circular(9.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Builder(builder: (builder) {
                              if (widget.post!.hasImage() &&
                                  widget.post!.image.length > 0) {
                                return CachedNetworkImage(
                                  imageUrl: valueOrDefault<String>(
                                    widget.post?.image,
                                    '#',
                                  ),
                                  width: double.infinity,
                                  height: 75.0,
                                  fit: BoxFit.cover,
                                );
                              } else {
                                print("post no image");
                                return Image.asset(
                                  FlutterFlowTheme.of(context)
                                      .postPlaceholderPath,
                                  width: double.infinity,
                                  height: 75.0,
                                  fit: BoxFit.cover,
                                );
                              }
                            })),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.post?.company,
                                  'VERGANO',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '45xrvosa' /*  -  */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  'Bojaxhi',
                                  'Saldator',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.payments_outlined,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 21.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 30.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget.post?.minPay.toInt().toString(),
                                  '400',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Noto Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Icon(
                              FFIcons.klocation,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 21.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 30.0, 0.0),
                              child: StreamBuilder<LocationsRecord>(
                                stream: LocationsRecord.getDocument(
                                    widget.post!.location!),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final textLocationsRecord = snapshot.data!;
                                  return Text(
                                    valueOrDefault<String>(
                                      textLocationsRecord.locationName,
                                      'No location',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(170.0, 0.0, 0.0, 120.0),
            child: Container(
              width: 80.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: PostRecord.getDaysLeft(widget.post?.endTime) > 2
                    ? FlutterFlowTheme.of(context).warning
                    : FlutterFlowTheme.of(context).error,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  "${PostRecord.getDaysLeft(widget.post?.endTime)} Day${PostRecord.getDaysLeft(widget.post?.endTime) > 1 ? "s" : ""}",
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto Slab',
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
