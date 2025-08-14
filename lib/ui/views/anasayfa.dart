import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/data/entity/kisiler.dart';
import 'package:kisiler_app/data/repo/kisilerdao_repository.dart';
import 'package:kisiler_app/ui/cubit/anasayfa_cubit.dart';
import 'package:kisiler_app/ui/views/detay_sayfa.dart';
import 'package:kisiler_app/ui/views/kayit_sayfa.dart';
import 'package:kisiler_app/ui/views/profile_sayfa.dart';
import 'package:kisiler_app/utility/profile_circle_avatar.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  Future<void> ara(String aramaKelimesi) async {
    print("Kişi şunu arıyor : $aramaKelimesi");
  }

  Future<void> sil(int kisi_id) async {
    print("$kisi_id Silindi .");
  }
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(
          decoration: InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonuc) {
            context.read<AnasayfaCubit>().ara(aramaSonuc);
          },
        ) :
        Text("Kişiler",style: TextStyle(fontSize: 30,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Color(0xFF003366),
        actions: [
          aramaYapiliyorMu ? 
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
            context.read<AnasayfaCubit>().kisileriYukle();
          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: const Icon(Icons.search,color: Colors.white,)),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<Kisiler>>(
        builder: (context,kisilerListesi) {
          if (kisilerListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: kisilerListesi.length,
              itemBuilder: (context,indeks) {
                var kisi = kisilerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi))).then((value){
                      context.read<AnasayfaCubit>().kisileriYukle();
                    });
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    color: Color(0xFFCCCCCC),
                    child: SizedBox(height: 85,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(kisi.kisi_ad,style: TextStyle(fontSize: 23),),
                              Text(kisi.kisi_tel,style: TextStyle(fontSize: 18),),
                            ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(" ${kisi.kisi_ad} Silinsin mi?"),
                                action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: (){
                                      context.read<AnasayfaCubit>().sil(kisi.kisi_id);
                                }),
                              ),
                            );
                          }, icon: Icon(Icons.clear),color: Colors.black54,)
                        ],
                      ),
                    ),
                  ),
                );
              },
            );

          }else {
            return const Center();
          }
          },
      ),

      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSayfa()));
        },
        child: Container(
          height: 120,
          color: Color(0xFF003366),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileAvatar(imageUrl: "https://randomuser.me/api/portraits/men/32.jpg"),
                Text("Profilim",style: TextStyle(fontSize: 20,color: Colors.white),)
              ],
            )
          ),

        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF003366),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => KayitSayfa()))
                .then((value) {
               context.read<AnasayfaCubit>().kisileriYukle();
            });
          },
          child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
