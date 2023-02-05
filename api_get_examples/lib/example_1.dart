import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/Model1.dart';

class Example1 extends StatefulWidget {
  const Example1({Key? key}) : super(key: key);

  @override
  State<Example1> createState() => _Example1State();
}

class _Example1State extends State<Example1> {

  List<Model1> model1List = [];

  Future<List<Model1>> getModel1API() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200)
      {
        model1List.clear();
          for(Map i in data)
            {
              model1List.add(Model1.fromJson(i));
            }
          return model1List;
      }
    else{
      return model1List;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
                  Expanded(
                    child: FutureBuilder(
                      future: getModel1API(),
                      builder: (context, snapshot){
                      if(!snapshot.hasData)
                        {
                          return Text("loading ... ");
                          //return const CircularProgressIndicator();
                        }
                      else{
                        return ListView.builder(
                          itemCount: model1List.length,
                          itemBuilder: (context, index){
                          return Card(
                            borderOnForeground: true,
                            color: Colors.green,
                            child: Column(
                                children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Title \n\n ${model1List[index].title}" ,style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple.shade900,
                                  ),),
                                ),
                            ],
                            ),
                            );
                        },);
                      }
                    },),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
