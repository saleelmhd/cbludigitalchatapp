
import 'package:chatapp/model/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final String sender;
  final String recipient;

  ChatScreen({required this.sender, required this.recipient});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with ${widget.recipient}"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, chatProvider, child) {
                var messages = chatProvider.getMessagesBetween(
                    widget.sender, widget.recipient);

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    var msg = messages[index];

                    return Align(
                      alignment: msg.sender == widget.sender
                          ? Alignment.centerRight // User messages (right)
                          : Alignment.centerLeft, // Admin replies (left)
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: msg.sender == widget.sender
                              ? Colors.blue[200]
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(msg.sender,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Text(msg.message),
                            SizedBox(height: 5),
                            Text(
                              msg.timestamp.toString(),
                              style: TextStyle(
                                  fontSize: 10, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      hintStyle: TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10), 
                        borderSide: BorderSide(
                            color: Colors.blue, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey, width: 1.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Container(decoration: BoxDecoration(shape: BoxShape.circle,  color: Colors.indigo,),
              
                  child: IconButton(
                    icon: Icon(Icons.send,color: Colors.white,),
                    onPressed: () {
                      if (_messageController.text.isNotEmpty) {
                        Provider.of<ChatProvider>(context, listen: false)
                            .sendMessage(
                          widget.sender,
                          widget.recipient,
                          _messageController.text,
                        );
                        _messageController.clear();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
