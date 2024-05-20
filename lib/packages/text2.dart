import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nproject/packages/text.dart';
import 'package:nproject/services/preference.dart';

class TextPage2 extends StatefulWidget {
  TextPage2({super.key});

  @override
  State<TextPage2> createState() => _TextPage2State();
}

class _TextPage2State extends State<TextPage2> {
  bool loading=false;
  List<String>item=[];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  void getData()async
  {

    setState(() {
      loading=true;
    });
  item=  await getName();
     setState(() {
       loading=false;
     });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(backgroundColor: Colors.grey,),
      body:  loading ?
      const Center(child:  CircularProgressIndicator(),)
          :
      Column(
        children: [

        Expanded(
          child: ListView.builder(
            itemCount:item.length,
            itemBuilder: ( BuildContext context,int index) {
             return  fetchContainer( item[index]);
          },
          
           ),
        ),
        ElevatedButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TextPage(),

              )).then((value) {

                getData();
          });
        }, child: const Text('click'))
        ],
      ),
    );
  }

  Widget fetchContainer(String text ) => Container(
      width: MediaQuery.of(context).size.width-4.0,
      height: 100,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(18),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
      color: Colors.grey[400]),
      child: Text(text,textAlign: TextAlign.center,style: const TextStyle(fontSize: 25),),
    );
}
