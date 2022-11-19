import 'package:flutter/material.dart';
import 'otp.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String Country = '';
  final TextEditingController _controller2 = TextEditingController();

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Auth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: const Center(
                child: Text(
                  'Phone Authentication',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),

            //Phone feild

            IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              controller: _controller,
              initialCountryCode: 'IN',
              onChanged: (phone) {
                debugPrint('Below is phone number');
                debugPrint(phone.completeNumber);
                debugPrint('Country code is: ${phone.countryCode}');
                Country = phone.countryCode;
                // phone.countryCode = _controller2 as String;
                debugPrint(Country);
              },
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 40, right: 10, left: 10),
            //   child: TextField(
            //     decoration: const InputDecoration(
            //       hintText: 'Phone Number',
            //       prefix: Padding(
            //         padding: EdgeInsets.all(4),
            //         child: Text('+91'),
            //       ),
            //     ),
            //     maxLength: 10,
            //     keyboardType: TextInputType.number,
            //     controller: _controller,
            //   ),
            // )
          ]),
          Container(
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            child: TextButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              // color: Colors.blue,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        OTPScreen(_controller.text, Country)));
              },
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
