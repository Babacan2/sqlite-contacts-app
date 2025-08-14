import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/data/entity/kisiler.dart';
import 'package:kisiler_app/ui/cubit/detay_cubit.dart';

class DetaySayfa extends StatefulWidget {
  Kisiler kisi;
  DetaySayfa({required this.kisi});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfController1 = TextEditingController();
  var tfController2 = TextEditingController();


  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfController1.text = kisi.kisi_ad;
    tfController2.text = kisi.kisi_tel;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Detay",style: TextStyle(fontSize: 30,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFF003366),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfController1,
                decoration: InputDecoration(hintText: "Kisi Ad"),
                style: TextStyle(fontSize: 22),
              ),
              TextField(
                controller: tfController2,
                decoration: InputDecoration(hintText: "Kisi Tel"),
                style: TextStyle(fontSize: 22),
              ),
              ElevatedButton(onPressed: (){
                context.read<DetaySayfaCubit>().guncelle(widget.kisi.kisi_id, tfController1.text, tfController2.text);
              }
                  , child: Text("GÜNCELLE",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF003366)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
