import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/Model3.dart';

class Example3 extends StatefulWidget {
  const Example3({Key? key}) : super(key: key);

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {

  List<Model3> model3List = [];
  var data;

  Future<List<Model3>> getModel3API() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'),);
    data = jsonDecode(response.body.toString());
    if (response.statusCode == 200)
    {
      model3List.clear();
      for(Map i in data)
      {
        model3List.add(Model3.fromJson(i));
      }
      return model3List;
    }
    else{
      return model3List;
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
                  future: getModel3API(),
                  builder: (context, AsyncSnapshot<List<Model3>> snapshot){
                    if(!snapshot.hasData)
                    {
                      return const CircularProgressIndicator();
                    }
                    else{
                      return ListView.builder(
                        itemCount: model3List.length,
                        itemBuilder: (context, index){
                          return Column(
                            children: [
                              Card(
                                color: Colors.tealAccent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Name" ,style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple.shade900,
                                      ),),
                                    Text(snapshot.data![index].name.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.green.shade900,
                                      ),),
                                  ],
                                ),
                              ),
                              Text("Latitude" ,style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple.shade900,
                              ),),
                              Text(snapshot.data![index].address!.geo!.lat.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green.shade900,
                                ),),
                              const SizedBox(height: 20,),
                            ],
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
