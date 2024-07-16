import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoPostRecord extends FirestoreRecord {
  VideoPostRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_Description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "num_comments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "post_image" field.
  String? _postImage;
  String get postImage => _postImage ?? '';
  bool hasPostImage() => _postImage != null;

  void _initializeFields() {
    _video = snapshotData['video'] as String?;
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_Description'] as String?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['num_comments']);
    _postImage = snapshotData['post_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('VideoPost');

  static Stream<VideoPostRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideoPostRecord.fromSnapshot(s));

  static Future<VideoPostRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideoPostRecord.fromSnapshot(s));

  static VideoPostRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VideoPostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideoPostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideoPostRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideoPostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideoPostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideoPostRecordData({
  String? video,
  String? postTitle,
  String? postDescription,
  DateTime? timePosted,
  int? numComments,
  String? postImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'video': video,
      'post_title': postTitle,
      'post_Description': postDescription,
      'time_posted': timePosted,
      'num_comments': numComments,
      'post_image': postImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideoPostRecordDocumentEquality implements Equality<VideoPostRecord> {
  const VideoPostRecordDocumentEquality();

  @override
  bool equals(VideoPostRecord? e1, VideoPostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.video == e2?.video &&
        e1?.postTitle == e2?.postTitle &&
        e1?.postDescription == e2?.postDescription &&
        e1?.timePosted == e2?.timePosted &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
        e1?.postImage == e2?.postImage;
  }

  @override
  int hash(VideoPostRecord? e) => const ListEquality().hash([
        e?.video,
        e?.postTitle,
        e?.postDescription,
        e?.timePosted,
        e?.likes,
        e?.numComments,
        e?.postImage
      ]);

  @override
  bool isValidKey(Object? o) => o is VideoPostRecord;
}
