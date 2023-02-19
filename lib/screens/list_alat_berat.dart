import 'package:dicoding_flutter_app/models/model_data_alat_berat.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_flutter_app/widgets/list_tile_alat_berat_widget.dart';

//TODO: 1. Buat fitur pencarian;
//TODO: 2. Buat filter berdasakan kategori alat;
//TODO: 3. Buat SliverAppBar

class ListPage extends StatelessWidget {
  static const routeName = '/alat_berat_list';

  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: const Text('List Alat Berat'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Untuk fitur cari data alat',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Untuk fitur cari data alat')));
            },
          ),
        ],
      ),
      body: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/alatberatlist.json'),
          builder: (context, snapshot) {
            final List<AlatBerat> alatBerat = parseAlatBerat(snapshot.data);
            return ListView.builder(
              itemCount: alatBerat.length,
              itemBuilder: (BuildContext context, int index) {
                return buildAlatBeratItem(context, alatBerat[index]);
              },
            );
          }),
    );
  }
}
