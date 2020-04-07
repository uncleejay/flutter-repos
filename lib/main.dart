import 'package:flutter/material.dart';
import 'package:github_repo_labs/networkhelper/service.dart';
import 'package:github_repo_labs/model/repo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Repos'),
      ),
      body: Center(
        child: FutureBuilder<Repo>(
          future: getRepo(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.items.length,
                itemBuilder: (context, index){
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text(snapshot.data.items[index]['name']),
                        subtitle: Text(snapshot.data.items[index]['owner']['login']),
                      ),
                    ),
                  );
                },
              );
            } else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          } ,
        ),
      ),
    );
  }
}
