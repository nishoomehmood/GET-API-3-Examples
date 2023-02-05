import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/Model2.dart';

class Example2 extends StatefulWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {

  List<Model2> model2List = [];
  var data;

  Future<List<Model2>> getModel2API() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'),);
    data = jsonDecode(response.body.toString());
    if (response.statusCode == 200)
    {
      model2List.clear();
      for(Map i in data)
      {
        Model2 model2 = Model2(title: i['title'], url: i['url']);
        model2List.add(model2);
      }
      return model2List;
    }
    else{
      return model2List;
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
                  future: getModel2API(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData)
                    {
                      return const Text("loading ... ");
                      //return const CircularProgressIndicator();
                    }
                    else{
                      return ListView.builder(
                        itemCount: model2List.length,
                        itemBuilder: (context, index){
                          return Card(
                           borderOnForeground: false,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Title \n\n ${model2List[index].title}" ,style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple.shade900,
                                  ),),
                                ),
                                const SizedBox(height: 20,),
                                Image(image: NetworkImage(model2List[index].url),),
                                 const SizedBox(
                                   height: 40,
                                child: Icon(Icons.horizontal_rule_outlined,
                                size: 150,),),
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
