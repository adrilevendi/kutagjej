import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'njoftim_tease_model.dart';
export 'njoftim_tease_model.dart';

class StaffPostWidget extends StatefulWidget {
  const StaffPostWidget({
    super.key,
    required this.post,
  });

  final PostRecord? post;

  @override
  State<StaffPostWidget> createState() => _StaffPostWidgetState();
}

class _StaffPostWidgetState extends State<StaffPostWidget> {
  late NjoftimTeaseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NjoftimTeaseModel());
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
                  const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x2F1D2429),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(9.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1569074187119-c87815b476da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fHNwb3J0c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
                          width: double.infinity,
                          height: 75.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 8.0),
                          child: Text(
                            '${widget.post?.company} - ${widget.post?.position}',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Noto Sans',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                          )),
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
                                widget.post?.minPay.toString(),
                                '999',
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final textLocationsRecord = snapshot.data!;
                                return Text(
                                  textLocationsRecord.locationName,
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
                          Icon(
                            Icons.access_time_sharp,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 21.0,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                3.0, 0.0, 30.0, 0.0),
                            child: Text(
                              '${widget.post?.shiftHours.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Noto Sans',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 7.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Icon(
                                  Icons.shuffle,
                                  color: Color(0xFF3CC14D),
                                  size: 21.0,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Turni ${widget.post?.shift.toString()}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Noto Sans',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(1.0, 0.0),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 168.0, 16.0, 0.0),
              child: Container(
                width: 150.0,
                height: 30.0,
                decoration: const BoxDecoration(
                  color: Color(0xFFFBA203),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(10.0),
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(0.0),
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: StreamBuilder<String?>(
                      stream:
                          PostRecord.getTimeLeftStream(widget.post?.endTime),
                      builder: (context, timeLeftSnapshot) {
                        return Text(
                          timeLeftSnapshot.hasData
                              ? (timeLeftSnapshot.data ?? '')
                              : PostRecord.getTimeLeft(widget.post?.endTime),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Roboto Slab',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        );
                      }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
