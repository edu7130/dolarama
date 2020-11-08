import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:dolarama/model/Dollar.dart';

import 'package:dolarama/service/service.dart';

import 'package:dolarama/views/widgets/card_dollar.dart';
import 'package:dolarama/views/widgets/error_message.dart';
import 'package:dolarama/views/widgets/my_app_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, bool) {
          return [
            MyAppBar(
              onRefresh: () {
                setState(() {});
              },
            ),
          ];
        },
        body: FutureBuilder(
          future: Service.instance.getListDollars(),
          builder: (context, AsyncSnapshot<List<Dollar>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (snapshot.hasData && snapshot.data.isNotEmpty) {
              return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return CardDollar(snapshot.data[i]);
                },
              );
            }
            return Center(child: ErrorMessage());
          },
        ),
      ),
    );
  }
}