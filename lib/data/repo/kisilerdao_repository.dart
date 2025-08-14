import 'package:kisiler_app/sqlite/veritabani_yardimcisi.dart';
import '../entity/kisiler.dart';

class KisilerDaoRepository {

  Future<List<Kisiler>> kisileriYukle() async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler");
    
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler(kisi_id: satir["kisi_id"], kisi_ad: satir["kisi_ad"], kisi_tel: satir["kisi_tel"]);
    });
  }

  Future<void> kaydet(String kisi_ad, String kisi_tel) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    var yeniKisi = Map<String,dynamic>();
    yeniKisi["kisi_ad"] = kisi_ad;
    yeniKisi["kisi_tel"] = kisi_tel;
    await db.insert("kisiler", yeniKisi);
  }

  Future<void> guncelle(int kisi_id, String kisi_ad, String kisi_tel) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    var guncelKisi = Map<String,dynamic>();
    guncelKisi["kisi_ad"] = kisi_ad;
    guncelKisi["kisi_tel"] = kisi_tel;
    await db.update("kisiler", guncelKisi,where: "kisi_id = ?",whereArgs: [kisi_id]);
  }

  Future<List<Kisiler>> ara(String aramaKelimesi) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_ad like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler(kisi_id: satir["kisi_id"], kisi_ad: satir["kisi_ad"], kisi_tel: satir["kisi_tel"]);
    });
  }

  Future<void> sil(int kisi_id) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    await db.delete("kisiler",where: "kisi_id = ?",whereArgs: [kisi_id]);
  }

}
