import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'play_video_model.dart';
export 'play_video_model.dart';

class PlayVideoWidget extends StatefulWidget {
  const PlayVideoWidget({
    super.key,
    required this.video,
  });

  final String? video;

  @override
  State<PlayVideoWidget> createState() => _PlayVideoWidgetState();
}

class _PlayVideoWidgetState extends State<PlayVideoWidget> {
  late PlayVideoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayVideoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: () {
        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
          return 360.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
          return 640.0;
        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
          return 820.0;
        } else {
          return 640.0;
        }
      }(),
      height: 500.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowVideoPlayer(
              path: widget!.video!,
              videoType: VideoType.network,
              width: double.infinity,
              height: double.infinity,
              autoPlay: false,
              looping: true,
              showControls: true,
              allowFullScreen: true,
              allowPlaybackSpeedMenu: true,
            ),
          ),
        ],
      ),
    );
  }
}
