import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:github_repo_labs/model/repo.dart';

//store the url in a string
String url = 'https://api.github.com/search/repositories?q=flutter+language:dart';

//create a get method
Future<Repo> getRepo() async{
  final response = await http.get(url);

  if(response.statusCode == 200){
//   If the call to the server was successful, parse the JSON
    return Repo.fromJSON(json.decode(response.body));
  } else {
//   if that call was not successful, throw an error
    throw Exception('Failed to load post');
  }

}