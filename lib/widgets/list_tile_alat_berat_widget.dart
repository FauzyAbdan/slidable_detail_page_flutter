import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dicoding_flutter_app/helpers/regex_string.dart';
import 'package:dicoding_flutter_app/models/model_data_alat_berat.dart';
import 'package:dicoding_flutter_app/screens/alat_berat_detail.dart';

Widget buildAlatBeratItem(BuildContext context, AlatBerat alatBerat) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
    leading: CircleAvatar(
        backgroundColor:
            //untuk method Random, wajib import 'dart:math';
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: Text(alatBerat.nomorBody.substring(0, 2).toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold))),
    title: Text(splitStringAndNumber(alatBerat.nomorBody)),

    trailing: Column(children: [
      //CONSIDER chip kondisi alat berat ini harusnya dijadikan widget tersendiri
      //misalkan widget kondisiAlatBerat
      //belum menerapkan SOLID Princple
      if (alatBerat.kondisiSaatIni == "excellent")
        Container(
          width: 85,
          height: 20,
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
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
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
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
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
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
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
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
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
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
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
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
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          //butuh package Intl untuk membuat format ribuan
          "HM: ${double.parse(alatBerat.hmAkhir).toStringAsFixed(1)}",
          textAlign: TextAlign.left,
        ),
      ),
    ]),
    subtitle: Text('${alatBerat.make} - ${alatBerat.model}'),
    // onTap: () {
    //   Navigator.pushNamed(context, AlatBeratDetail.routeName,
    //       arguments: alatBerat);
    // },
    // onTap: () {
    //   Navigator.of(context).push(MaterialPageRoute(
    //       builder: (context) => AlatBeratDetail(
    //             alatBeratYangDitap: alatBerat,
    //           )));
    // },

    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AlatBeratDetail(alatBeratYangDitap: alatBerat),
        ),
      );
    },
  );
}
