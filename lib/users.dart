
import 'package:chatapp/allmessages.dart';
import 'package:chatapp/home.dart';
import 'package:flutter/material.dart';

class UserSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(backgroundColor: Colors.indigo,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminChatScreen(),
              ),
            );
          },
          label: Text("Admin See All Messages",style: TextStyle(color: Colors.white),)),
      appBar: AppBar(title: Text("Select User"),backgroundColor: Colors.indigo,foregroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        child: ListView(
          children: [
            ListTile(tileColor: Colors.green,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              leading: CircleAvatar(child: Icon(Icons.person, color: Colors.blue)),
              title: Text("User1 - Chat with Admin"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChatScreen(sender: "User1", recipient: "Admin"),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(tileColor: Colors.green,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              leading: CircleAvatar(child: Icon(Icons.person, color: Colors.blue)),
              title: Text("User2 - Chat with Admin"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChatScreen(sender: "User2", recipient: "Admin"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
