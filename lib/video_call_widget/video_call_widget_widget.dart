import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'video_call_widget_model.dart';
export 'video_call_widget_model.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import '/auth/firebase_auth/auth_util.dart';
import 'package:http/http.dart' as http;


const appId = 'd685e8de5c954198babba516ef4dab37';

class VideoCallWidgetWidget extends StatefulWidget {
  const VideoCallWidgetWidget({super.key, required this.chatRef});

  final ChatsRecord? chatRef;

  @override
  State<VideoCallWidgetWidget> createState() => _VideoCallWidgetWidgetState();
}

class _VideoCallWidgetWidgetState extends State<VideoCallWidgetWidget> {
  late VideoCallWidgetModel _model;
  late AgoraClient client;
  bool isClientInitialized = false;
  String role = 'audience'; // Adjust as needed

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VideoCallWidgetModel());
    fetchTokenAndInitializeClient();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  Future<void> fetchTokenAndInitializeClient() async {
    String channelName = 'test';

    String tokenType = 'uid'; // Adjust as needed
    String uid = currentUserUid;

    if(valueOrDefault(currentUserDocument?.role, '') !=
        FFAppConstants.userTypeAgency){
      setState((){
        role = 'publisher';
      });

    }

    String url = 'https://learnlinktokenserver.onrender.com/rtc/$channelName/$role/$tokenType/$uid';
    try {

        setState(() {
          client = AgoraClient(
            agoraConnectionData: AgoraConnectionData(
              appId: appId,
              channelName: channelName,
              // tempToken: token,
              uid: uid.hashCode,
              tokenUrl: url
            ),
          );
          isClientInitialized = true;
          initAgora();
        });

    } catch (e) {
      print('Failed to load token. Error: $e');
    }
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isClientInitialized
        ? Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: const BoxDecoration(
        color: Color.fromARGB(0, 0, 0, 0),
      ),
      child: Stack(
        children: [
          AgoraVideoViewer(
            client: client,
            layoutType: Layout.floating,
            enableHostControls: true, // Add this to enable host controls
          ),
          AgoraVideoButtons(
            onDisconnect: () async{

              if(role == 'publisher') {
                var existingSession =
                await queryCallSessionRecordOnce(
                  queryBuilder:
                      (callSessionRecord) =>
                      callSessionRecord
                          .where(
                        'agency',
                        isEqualTo:
                        currentUserReference,
                      )
                          .where(
                        'applicant',
                        isEqualTo: widget!
                            .chatRef
                            ?.userB,
                      ),
                  singleRecord: true,
                ).then((s) =>
                s.firstOrNull);
                if (existingSession !=
                    null) {
                  await existingSession!
                      .reference
                      .delete();
                }
              }

              Navigator.pop(context);
          },
            client: client,
          ),
        ],
      ),
    )
        : Center(child: CircularProgressIndicator());
  }
}
