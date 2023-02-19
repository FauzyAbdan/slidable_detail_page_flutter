import 'package:dicoding_flutter_app/models/model_data_alat_berat.dart';
import 'package:flutter/material.dart';
import '../helpers/regex_string.dart';

//DONE: 1. Pakai SliverAppBar untuk bagian gambarnya,
// gunakan pinned dan floating:true
//DONE: 2. Buat Card untuk setiap kategori informasi, misalkan
// General Info,
// Ownership,
// Spesifikasi Alat Berat,
// Condition.

//TODO: 3. Buat fitur untuk bisa share dengan data lengkap (detail alat berat) dari halaman ini

//FIXME: Ada SocketException dari server image yg digunakan klo aplikasi/detail
// screen terbuka terlalu lama/idle

class AlatBeratDetail extends StatefulWidget {
  static const routeName = '/alat_berat_detail';
  const AlatBeratDetail({Key? key, required this.alatBeratYangDitap})
      : super(key: key);
  final AlatBerat alatBeratYangDitap;

  @override
  State<AlatBeratDetail> createState() => _AlatBeratDetailState();
}

class _AlatBeratDetailState extends State<AlatBeratDetail> {
  //FIXME: Sesuaikan value dari [indexPage] dengan nomor index dari item di [ListPage] yang di-tap (The Main Problem).

  int indexPage = 6;

  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: indexPage, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return thisbuild(context, widget.alatBeratYangDitap);
  }

  Widget thisbuild(BuildContext context, alatBeratYangDitap) {
    return FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/alatberatlist.json'),
        builder: (context, snapshot) {
          final List<AlatBerat> alatBeratYangDitap =
              parseAlatBerat(snapshot.data);
          return PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                indexPage = value;
              });
            },
            itemCount: alatBeratYangDitap.length,
            itemBuilder: (context, index) {
              return _alatBeratItemInPageView(
                  context, alatBeratYangDitap[index]);
            },
          );
        });
  }

  Widget _alatBeratItemInPageView(context, alatBerat) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              backgroundColor: const Color.fromARGB(141, 0, 128, 128),
              elevation: 0.2,
              pinned: true,
              floating: true,
              expandedHeight: 240,
              actions: <Widget>[
                IconButton(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  icon: const Icon(Icons.share),
                  tooltip: 'Bagikan data spesifikasi alat ini',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Bagikan data spesifikasi alat ini')));
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    splitStringAndNumber(alatBerat.nomorBody),
                  ),
                  titlePadding: const EdgeInsets.only(left: 60, bottom: 16),
                  background: FadeInImage.assetNetwork(
                      placeholder:
                          "assets/images/alat_berat_placeholder_image.jpg",
                      image: alatBerat.imageUrl,
                      fit: BoxFit.cover)
                  // Image.network(alatBerat.imageUrl, fit: BoxFit.cover),
                  ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            color: const Color.fromARGB(10, 9, 162, 162),
            child: Column(children: [
              Card(
                elevation: 2,
                color: const Color.fromARGB(255, 234, 247, 247),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 100,
                  // child: Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.monitor_heart_outlined,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Kondisi',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        textColor: Colors.teal,
                      ),
                      //belum menerapkan SOLID Princple
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Kondisi alat saat ini",
                                      style: TextStyle()),
                                ),
                              ),
                              if (alatBerat.kondisiSaatIni == "excellent")
                                Container(
                                  width: 85,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    border: Border.all(
                                      color: Colors.blue,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    alatBerat.kondisiSaatIni,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              else if (alatBerat.kondisiSaatIni == "good")
                                Container(
                                  width: 85,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade100,
                                    border: Border.all(
                                      color: Colors.green,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    alatBerat.kondisiSaatIni,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              else if (alatBerat.kondisiSaatIni == "in repair")
                                Container(
                                  width: 85,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.amber.shade50,
                                    border: Border.all(
                                      color: Colors.amber,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    alatBerat.kondisiSaatIni,
                                    style: const TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              else if (alatBerat.kondisiSaatIni == "bad")
                                Container(
                                  width: 85,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade100,
                                    border: Border.all(
                                      color: Colors.red,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    alatBerat.kondisiSaatIni,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              else if (alatBerat.kondisiSaatIni == "standby")
                                Container(
                                  width: 85,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.black87,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    alatBerat.kondisiSaatIni,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              else if (alatBerat.kondisiSaatIni == "breakdown")
                                Container(
                                  width: 85,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                      color: Colors.red,
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    alatBerat.kondisiSaatIni,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ]),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                color: const Color.fromARGB(255, 234, 247, 247),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 100,
                  // child: Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Lokasi saat ini',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        textColor: Colors.teal,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Saat ini unit berada di",
                                      style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                      alatBerat.lokasiSaatIni.toUpperCase(),
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                color: const Color.fromARGB(255, 234, 247, 247),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 100,
                  // child: Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.access_alarms,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Usia alat berat',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        textColor: Colors.teal,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Alat berat ini berusia",
                                      style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text("${alatBerat.hmAkhir} JAM",
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 2,
                color: const Color.fromARGB(255, 234, 247, 247),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 400,
                  // child: Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.article_outlined,
                          color: Colors.teal,
                        ),
                        title: Text(
                          'Spesifikasi',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        textColor: Colors.teal,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Brand", style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(alatBerat.make.toUpperCase(),
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Model", style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(alatBerat.model.toUpperCase(),
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Tahun Pembuatan",
                                      style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text("2012".toUpperCase(),
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child:
                                      Text("Nomor Mesin", style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text("1.2hsdds-120".toUpperCase(),
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child:
                                      Text("Nomor Chassis", style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text("xxhsddklss-12932".toUpperCase(),
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Jenis Bahan Bakar",
                                      style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text("solar".toUpperCase(),
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Kapasitas Tangki BBM",
                                      style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text("700 L".toUpperCase(),
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Min. Konsumsi BBM",
                                      style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  // ignore: prefer_const_constructors
                                  child: Text("10 Liter/Jam",
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Maks. Konsumsi BBM",
                                      style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text("40 Liter/Jam",
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Jenis Oli Mesin",
                                      style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text("n/a".toUpperCase(),
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 70, right: 20, bottom: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Kapasitas Oli Mesin",
                                      style: TextStyle()),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text("200 L".toUpperCase(),
                                      maxLines: 2,
                                      textAlign: TextAlign.justify),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
