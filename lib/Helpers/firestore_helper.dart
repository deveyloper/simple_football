
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
    Stream<QuerySnapshot> getCollectionStream(String path){
      return Firestore.instance.collection(path).snapshots();
    }

    Stream<DocumentSnapshot> getDocumentStream(String path){
      return Firestore.instance.document(path).snapshots();
    }

}
