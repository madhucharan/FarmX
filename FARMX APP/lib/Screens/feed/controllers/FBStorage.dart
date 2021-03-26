import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FBStorage {
  static Future<String> uploadPostImages(
      {@required String postID, @required File postImageFile}) async {
    try {
      String fileName = 'images/$postID/postImage';
      FirebaseStorage storage = FirebaseStorage.instance;
      String url;
      Reference ref =
          storage.ref().child("postImage" + DateTime.now().toString());
      UploadTask uploadTask = ref.putFile(postImageFile);
      uploadTask.whenComplete(() {
        url = ref.getDownloadURL() as String;
      }).catchError((onError) {
        print(onError);
      });
      return url;
    } catch (e) {
      return null;
    }
  }
}
