// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:dropdown_button2/dropdown_button2.dart';

void main() => runApp(const Homepage());

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF03A9F4),
          title: const Text('Bitcoin Converter'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 200,
                  child: Center(
                    child: Image.asset('assets/images/bitcoin.png', scale: 3),
                  )),
              const SizedBox(height: 4000, child: Bitcoin()),
            ],
          ),
        ),
      ),
    );
  }
}

class Bitcoin extends StatefulWidget {
  const Bitcoin({Key? key}) : super(key: key);

  @override
  State<Bitcoin> createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {
  TextEditingController amountEditingController = TextEditingController();

  var selectCurrency;
  String description1 = "No value";
  String description2 = "";
  var simplify, unit, value, type, result, bitcoin;

  @override
  Widget build(BuildContext context) {
    List<String> cryptoList = [
      "Bitcoin",
      "Ether",
      "Litecoin",
      "Bitcoin Cash",
      "Binance Coin",
      "EOS",
      "XRP",
      "Lumens",
      "Chainlink",
      "Polkadot",
      "Yearn.finance",
      "US Dollar",
      "United Arab Emirates Dirham",
      "Argentine Peso",
      "Australian Dollar",
      "Bangladeshi Taka",
      "Bahraini Dinar",
      "Bermudian Dollar",
      "Brazil Real",
      "Canadian Dollar",
      "Swiss Franc",
      "Chilean Peso",
      "Chinese Yuan",
      "Czech Koruna",
      "Danish Krone",
      "Euro",
      "British Pound Sterling",
      "Hong Kong Dollar",
      "Hungarian Forint",
      "Indonesian Rupiah",
      "Israeli New Shekel",
      "Indian Rupee",
      "Japanese Yen",
      "South Korean Won",
      "Kuwaiti Dinar",
      "Sri Lankan Rupee",
      "Burmese Kyat",
      "Mexican Peso",
      "Malaysian Ringgit",
      "Nigerian Naira",
      "Norwegian Krone",
      "New Zealand Dollar",
      "Philippine Peso",
      "Pakistani Rupee",
      "Polish Zloty",
      "Russian Ruble",
      "Saudi Riyal",
      "Swedish Krona",
      "Singapore Dollar",
      "Thai Baht",
      "Turkish Lira",
      "New Taiwan Dollar",
      "Ukrainian hryvnia",
      "Venezuelan bolívar fuerte",
      "Vietnamese đồng",
      "South African Rand",
      "IMF Special Drawing Rights",
      "Silver - Troy Ounce",
      "Gold - Troy Ounce",
      "Bits",
      "Satoshi",
    ];

    cryptoList.sort((a, b) {
      //sorting in ascending order
      return a.compareTo(b);
    });

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: amountEditingController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: 'Bitcoin Value',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0))),
            ),
            const SizedBox(height: 10),
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                buttonHeight: 55,
                buttonWidth: 400,
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                ),
                value: selectCurrency,
                onChanged: (newValue) {
                  setState(() {
                    selectCurrency = newValue.toString();
                  });
                },
                items: cryptoList.map((selectCurrency) {
                  return DropdownMenuItem(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        selectCurrency,
                      ),
                    ),
                    value: selectCurrency,
                  );
                }).toList(),
                hint: Container(
                    alignment: Alignment.center,
                    child: const Text("Select Type of Currency")),
                isExpanded: true,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: loadCurrency,
                child: const Text("Convert"),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF03A9F4))),
            const SizedBox(height: 50),
            Text(
              description1,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              description2,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadCurrency() async {
    var url = Uri.parse('https://api.coingecko.com/api/v3/exchange_rates');
    var response = await http.get(url);
    var jsonData = response.body;
    var parsedData = json.decode(jsonData);
    var simplify;

    switch (selectCurrency) {
      case "Bitcoin":
        simplify = "btc";
        break;

      case "Ether":
        simplify = "eth";
        break;

      case "Litecoin":
        simplify = "ltc";
        break;

      case "Bitcoin Cash":
        simplify = "bch";
        break;

      case "Binance Coin":
        simplify = "bnb";
        break;

      case "EOS":
        simplify = "eos";
        break;

      case "XRP":
        simplify = "xrp";
        break;

      case "Lumens":
        simplify = "xlm";
        break;

      case "Chainlink":
        simplify = "link";
        break;

      case "Polkadot":
        simplify = "dot";
        break;

      case "Yearn.finance":
        simplify = "yfi";
        break;

      case "US Dollar":
        simplify = "usd";
        break;

      case "United Arab Emirates Dirham":
        simplify = "aed";
        break;

      case "Argentine Peso":
        simplify = "ars";
        break;

      case "Australian Dollar":
        simplify = "aud";
        break;

      case "Bangladeshi Taka":
        simplify = "bdt";
        break;

      case "Bahraini Dinar":
        simplify = "bhd";
        break;

      case "Bermudian Dollar":
        simplify = "bmd";
        break;

      case "Brazil Real":
        simplify = "brl";
        break;

      case "Canadian Dollar":
        simplify = "cad";
        break;

      case "Swiss Franc":
        simplify = "chf";
        break;

      case "Chilean Peso":
        simplify = "clp";
        break;

      case "Chinese Yuan":
        simplify = "cny";
        break;

      case "Czech Koruna":
        simplify = "czk";
        break;

      case "Danish Krone":
        simplify = "dkk";
        break;

      case "Euro":
        simplify = "eur";
        break;

      case "British Pound Sterling":
        simplify = "gbp";
        break;

      case "Hong Kong Dollar":
        simplify = "hkd";
        break;

      case "Hungarian Forint":
        simplify = "huf";
        break;

      case "Indonesian Rupiah":
        simplify = "idr";
        break;

      case "Israeli New Shekel":
        simplify = "ils";
        break;

      case "Indian Rupee":
        simplify = "inr";
        break;

      case "Japanese Yen":
        simplify = "jpy";
        break;

      case "South Korean Won":
        simplify = "krw";
        break;

      case "Kuwaiti Dinar":
        simplify = "kwd";
        break;

      case "Sri Lankan Rupee":
        simplify = "lkr";
        break;

      case "Burmese Kyat":
        simplify = "mmk";
        break;

      case "Mexican Peso":
        simplify = "mxn";
        break;

      case "Malaysian Ringgit":
        simplify = "myr";
        break;

      case "Nigerian Naira":
        simplify = "ngn";
        break;

      case "Norwegian Krone":
        simplify = "nok";
        break;

      case "New Zealand Dollar":
        simplify = "nzd";
        break;

      case "Philippine Peso":
        simplify = "php";
        break;

      case "Pakistani Rupee":
        simplify = "pkr";
        break;

      case "Polish Zloty":
        simplify = "pln";
        break;

      case "Russian Ruble":
        simplify = "rub";
        break;

      case "Saudi Riyal":
        simplify = "sar";
        break;

      case "Swedish Krona":
        simplify = "sek";
        break;

      case "Singapore Dollar":
        simplify = "sgd";
        break;

      case "Thai Baht":
        simplify = "thb";
        break;

      case "Turkish Lira":
        simplify = "try";
        break;

      case "New Taiwan Dollar":
        simplify = "twd";
        break;

      case "Ukrainian hryvnia":
        simplify = "uah";
        break;

      case "Venezuelan bolívar fuerte":
        simplify = "vef";
        break;

      case "Vietnamese đồng":
        simplify = "vnd";
        break;

      case "South African Rand":
        simplify = "zar";
        break;

      case "IMF Special Drawing Rights":
        simplify = "xdr";
        break;

      case "Silver - Troy Ounce":
        simplify = "xag";
        break;

      case "Gold - Troy Ounce":
        simplify = "xau";
        break;

      case "Bits":
        simplify = "bits";
        break;

      case "Satoshi":
        simplify = "sats";
        break;
    }

    if (response.statusCode == 200) {
      unit = parsedData['rates']['$simplify']['unit'];
      value = parsedData['rates']['$simplify']['value'];
      type = parsedData['rates']['$simplify']['type'];

      bitcoin = double.parse(amountEditingController.text);
      result = bitcoin * value;
      var roundoff = result.toStringAsFixed(3);

      setState(() {
        description1 = amountEditingController.text + " Bitcoin Value =";
        description2 = "$roundoff $unit \nType: $type";
      });
    }
  }
}
