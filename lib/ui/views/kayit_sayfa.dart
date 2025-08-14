import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/ui/cubit/kayit_cubit.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfController1 = TextEditingController();
  var tfController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Kayıt",style: TextStyle(fontSize: 30,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFF003366),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfController1,
                decoration: const InputDecoration(hintText: "Kişi Ad"),
                style: TextStyle(fontSize: 22),
              ),
              TextField(
                controller: tfController2,
                decoration: const InputDecoration(hintText: "Kişi Tel"),
                style: TextStyle(fontSize: 22),
              ),
              ElevatedButton(onPressed: (){
                context.read<KayitSayfaCubit>().kaydet(tfController1.text, tfController2.text);
              }
                  , child: Text("KAYDET",style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF003366)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
