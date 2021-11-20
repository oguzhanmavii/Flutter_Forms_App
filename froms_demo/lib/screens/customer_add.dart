import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:froms_demo/mixins/validation_mixin.dart';
import 'package:froms_demo/models/customer_add.dart';
import 'package:froms_demo/screens/customer_list.dart';

class CustomerAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CustomerAddState();
}

class CustomerAddState extends State with ValidationMixin {
  Customer customer = new Customer();
  final formKey = GlobalKey<FormState>(); // validate işlemleri burada türetildi
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Form(
        key: formKey, //validation işlemleri form içinde tutulmaya başladı
        child: Column(
          children: <Widget>[
            firstNameField(context),
            lastNameField(context),
            emailField(context),
            passwordField(context),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget firstNameField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType
          .name, //klavyenin hangi tipte gelmesi gerektigini söylüyor
      decoration: InputDecoration(labelText: "Adınızı giriniz", hintText: "Ad"),
      validator: validateFirstName,
      onSaved: (String? value) {
        // Save Operasyonu bizim ekranda girdigimiz değerleri modelde kaydediyor önemli bir kısım
        customer.firstName = value!;
      },
    );
  }

  Widget lastNameField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType
          .name, //klavyenin hangi tipte gelmesi gerektigini söylüyor
      decoration:
          InputDecoration(labelText: "Soyadınızı giriniz", hintText: "Soyad"),
      validator: validateLastName,
      onSaved: (String? value) {
        // Save Operasyonu bizim ekranda girdigimiz değerleri modelde kaydediyor önemli bir kısım
        customer.lastName = value!;
      },
    );
  }

  Widget emailField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType
          .emailAddress, //klavyenin hangi tipte gelmesi gerektigini söylüyor
      decoration:
          InputDecoration(labelText: "Emailinizi giriniz", hintText: "Email"),
      validator: validateEmail,
      onSaved: (String? value) {
        // Save Operasyonu bizim ekranda girdigimiz değerleri modelde kaydediyor önemli bir kısım
        customer.email = value!;
      },
    );
  }

  Widget passwordField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType
          .name, //klavyenin hangi tipte gelmesi gerektigini söylüyor
      decoration: const InputDecoration(
          labelText: 'Şifrenizi giriniz', hintText: "Şifre"),
      obscureText: true,
    );
  }

  Widget submitButton() {
    return RaisedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            saveCustomer(customer);
          }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CustomerList(
                        key: formKey,
                        surName: '${customer.firstName}',
                        lastName: '${customer.lastName}',
                        email: '${customer.email}',
                      )));
        },
        child: Text("Kaydet"));
  }

  void saveCustomer(Customer customer) {
    print(customer.firstName);
    print(customer.lastName);
    print(customer.email);
  }
}
