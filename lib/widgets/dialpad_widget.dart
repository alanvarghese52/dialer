import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DialPad extends StatefulWidget {
  const DialPad({super.key});

  @override
  DialPadState createState() => DialPadState();
}

class DialPadState extends State<DialPad> {
  String _displayText = '';

  void _onButtonPressed(String value) {
    setState(() {
      _displayText += value;
    });
  }

  void _onDeletePressed() {
    setState(() {
      if (_displayText.isNotEmpty) {
        _displayText = _displayText.substring(0, _displayText.length - 1);
      }
    });
  }

  Future<void> _onCallPressed() async {
    final phoneNumber = _displayText;
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    // Debugging prints
    if (kDebugMode) {
      print('Attempting to launch: $phoneUri');
    }
    if (kDebugMode) {
      print('Phone number: $phoneNumber');
    }

    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      if (kDebugMode) {
        print('Could not launch $phoneUri');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dial Pad'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    _displayText,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                if (_displayText.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                        icon: const Icon(Icons.backspace),
                        onPressed: _onDeletePressed,
                        iconSize: 24,
                        color: Colors.red,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                String buttonText;
                if (index < 9) {
                  buttonText = (index + 1).toString();
                } else if (index == 9) {
                  buttonText = '*';
                } else if (index == 10) {
                  buttonText = '0';
                } else {
                  buttonText = '#';
                }

                return ElevatedButton(
                  onPressed: () => _onButtonPressed(buttonText),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(color: Colors.black, fontSize: 24),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: _onCallPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                fixedSize: const Size(200, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text('Call',style: TextStyle(color: Colors.black),),
            ),
          ),
        ],
      ),
    );
  }
}
