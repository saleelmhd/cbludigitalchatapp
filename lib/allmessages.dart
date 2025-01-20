
import 'package:chatapp/adminReplay.dart';
import 'package:chatapp/model/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminChatScreen extends StatefulWidget {
  @override
  _AdminChatScreenState createState() => _AdminChatScreenState();
}

class _AdminChatScreenState extends State<AdminChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin - Chat with Users", style: TextStyle(fontSize: 14)),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Consumer<ChatProvider>(
        builder: (context, chatProvider, child) {
          var messages = chatProvider.getMessagesForAdmin();

         
          var users = messages.map((msg) => msg.sender).toSet().toList();

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              String user = users[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(tileColor: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  leading: CircleAvatar(child: Icon(Icons.person, color: Colors.blue)),
                  title: Text("Chat with $user"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserChatScreen(
                          sender: user,
                          recipient: "Admin",
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
