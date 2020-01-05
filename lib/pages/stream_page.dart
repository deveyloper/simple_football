import 'package:flutter/material.dart';
import 'package:simple_football/bloc/todo_bloc.dart';
import 'package:simple_football/bloc/todo_event.dart';
import 'package:simple_football/models/Todo.dart';

class StreamPage extends StatefulWidget {
  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  final _todoBloc = TodoBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _todoBloc.todos,
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('No data!'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onDoubleTap: () {
                    _todoBloc.dispatch(DeleteTodoEvent(index: index));
                  },
                  child: ListTile(
                    leading: Text(snapshot.data[index].title),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              _showDialog(context, _todoBloc);
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _todoBloc.dispose();
    super.dispose();
  }
}

void _showDialog(BuildContext context, TodoBloc bloc) async {
  TextEditingController _textEditionController = TextEditingController();
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              Expanded(
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.grey,
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _textEditionController,
                    autofocus: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Enter something!',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              color: Colors.green,
              shape: StadiumBorder(),
              onPressed: () {
                String inputText = _textEditionController.value.text;
                if (inputText.length > 0) {
                  bloc.dispatch(AddTodoEvent(
                      todo: Todo(title: _textEditionController.value.text)));
                }
                Navigator.pop(context);
              },
            )
          ],
        );
      });
}
