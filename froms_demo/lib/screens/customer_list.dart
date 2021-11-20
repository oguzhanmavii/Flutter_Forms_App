import 'package:flutter/material.dart';

class CustomerList extends StatefulWidget {
  final String surName;
  final String lastName;
  final String email;

  const CustomerList(
      {required Key key,
      required this.surName,
      required this.lastName,
      required this.email})
      : super(key: key);
  @override
  _CustomerListState createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer List Page"),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 200),
                  child: Text("Ad:" "${widget.surName}",
                      style: TextStyle(fontSize: 25))),
              SizedBox(height: 10),
              Container(
                  child: Text(
                "Soyad:" "${widget.lastName}",
                style: TextStyle(fontSize: 25),
              )),
              SizedBox(height: 10),
              Container(
                  child: Text(
                "Email:" + "${widget.email}",
                style: TextStyle(fontSize: 25),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
