import 'package:flutter/material.dart';
import 'package:sql_db/db.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Db db=Db();
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          children: [
            IconButton(onPressed: ()async{
              await db.deleteData(2);
            
            }, icon: Icon(Icons.delete,size: 30,)),
            SizedBox(height: 30,),
            IconButton(onPressed: ()async{
              List<Map>res=await db.readData();
              print(res);
            }, icon: Icon(Icons.read_more,size: 30,)),
             SizedBox(height: 30,),

            IconButton(onPressed: ()async{
              await db.insertData('mostafa abbas');
              
            }, icon: Icon(Icons.insert_comment,size: 30,)),
             SizedBox(height: 30,),
            IconButton(onPressed: ()async{
              await db.updateData(1,"mostafa");
              
            }, icon: Icon(Icons.update,size: 30,))
          ],
        ),
      ),
    );
  }
}