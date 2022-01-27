import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/connectivity/connectivity.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.wifi_off,
                  color: Colors.white,
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 0)),
                Text(
                  ConnectivityChangeNotifier().pageText,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ]),
          SizedBox(height: 50.0),
          Flexible(
            child: ElevatedButton(
                child: Text('Paramètre'),
                onPressed: () => AppSettings.openWIFISettings()),
          )
        ],
      ),
    );
  }
}
