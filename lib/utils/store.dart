import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:law_app/model/comment.dart';
import 'package:law_app/model/state.dart';

Future<bool> updateFavorites(String uid, String recipeId) {
  DocumentReference favoritesReference =
      Firestore.instance.collection('users').document(uid);

  return Firestore.instance.runTransaction((Transaction tx) async {
    DocumentSnapshot postSnapshot = await tx.get(favoritesReference);
    if (postSnapshot.exists) {
      // Extend 'favorites' if the list does not contain the recipe ID:
      if (!postSnapshot.data['favorites'].contains(recipeId)) {
        await tx.update(favoritesReference, <String, dynamic>{
          'favorites': FieldValue.arrayUnion([recipeId])
        });
      // Delete the recipe ID from 'favorites':
      } else {
        await tx.update(favoritesReference, <String, dynamic>{
          'favorites': FieldValue.arrayRemove([recipeId])
        });
      }
    } else {
      // Create a document for the current user in collection 'users'
      // and add a new array 'favorites' to the document:
      await tx.set(favoritesReference, {
        'favorites': [recipeId]
      });
    }
  }).then((result) {
    return true;
  }).catchError((error) {
    print('Error: $error');
    return false;
  });
}

Future<bool> insertComment(String content, String user,String date) {
final commentReference = Firestore.instance.collection('comments');
Comment commentToSend = new Comment (
  user:user,
  content:content,
  date:date
);
return Firestore.instance.runTransaction((Transaction tx) async {
   await commentReference.add(commentToSend.toJson());
  }).then((result) {
    return true;
  }).catchError((error) {
    print('Error: $error');
    return false;
  });
}