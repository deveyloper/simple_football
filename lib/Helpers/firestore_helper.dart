
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:simple_football/models/chat_message.dart';

class FirestoreHelper {
    Stream<QuerySnapshot> getCollectionStream(String path){
      return Firestore.instance.collection(path).orderBy('timespan').snapshots();
    }

    Stream<DocumentSnapshot> getDocumentStream(String path){
      return Firestore.instance.document(path).snapshots();
    }

    void addChat(ChatMessage chatMesssage){
      Firestore.instance.collection('chats').add(chatMesssage.toJson());
    }

}
