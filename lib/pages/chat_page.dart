import 'package:flutter/material.dart';
import 'package:simple_football/Helpers/firestore_helper.dart';
import 'package:simple_football/models/chat_message.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _chatMessageTextController = TextEditingController();
  final _chatListController = ScrollController();
  final dataKey = new GlobalKey();
  int maxTimestamp = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Simple Football Chat'),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.grey),
          child: Column(
            children: <Widget>[
              Expanded(
                child: StreamBuilder(
                  stream: FirestoreHelper().getCollectionStream('chats'),
                  builder: ((context, snapshot) {
                    if (!snapshot.hasError &&
                        snapshot.hasData &&
                        snapshot.data.documents.length > 0) {
                      if (snapshot.data
                                  .documents[snapshot.data.documents.length - 1]
                              ['timespan'] >
                          maxTimestamp) {
                        maxTimestamp = snapshot.data
                                .documents[snapshot.data.documents.length - 1]
                            ['timespan'];
                        Future.delayed(Duration(seconds: 1),
                            () => this._showFancyDialog());
                      }
                      return ListView.builder(
                        controller: _chatListController,
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: ((builder, index) {
                          if (index == snapshot.data.documents.length - 1) {
                            Future.delayed(Duration(seconds: 1),
                                () => _chatListController.jumpTo(_chatListController.position.maxScrollExtent));
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                            child: Text(snapshot
                                                .data
                                                .documents[index]
                                                .data['from'])),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(10))),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Text(
                                                snapshot.data.documents[index]
                                                    .data['text'],
                                                textAlign: TextAlign.end,
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      );
                    } else {
                      return Center(
                        child: Container(
                            key: dataKey,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width / 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'No data yet!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )),
                      );
                    }
                  }),
                ),
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: true,
                        controller: _chatMessageTextController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.white70,
                            ),
                            filled: true,
                            fillColor: Colors.transparent,
                            hintText: 'Enter something',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(50),
                            )),
                        autofocus: false,
                      ),
                    ),
                  ),
                  Flexible(
                    child: FlatButton(
                      onPressed: () async {
                        FirestoreHelper().addChat(ChatMessage(
                            from: 'fatih',
                            text: _chatMessageTextController.value.text));
                        _chatMessageTextController.clear();
                        FocusScope.of(context).requestFocus(FocusNode());
                        _chatListController.jumpTo(
                            _chatListController.position.maxScrollExtent);
                      },
                      child: Icon(Icons.send),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFancyDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                      colors: [Color(0xFFD8E8A7), Colors.white],
                      tileMode: TileMode.clamp,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Yo have new message'),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(10),
                    color: Color(0xFFD8E8A7),
                    textColor: Colors.black,
                    onPressed: () {
                      _chatListController
                          .jumpTo(_chatListController.position.maxScrollExtent);
                      Navigator.pop(context);
                    },
                    child: Text('Go to message'),
                  )
                ],
              ),
            ),
          );
        });
  }
}
