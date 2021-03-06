import 'package:digivill/afterlogin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './authScreen.dart';
import './authProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        // ChangeNotifierProxyProvider<Auth, Products>(
        //   builder: (ctx, auth, previousProducts) => Products(
        //         auth.token,
        //         previousProducts == null ? [] : previousProducts.items,
        //       ),
        // ),
        // ChangeNotifierProxyProvider<Auth, Orders>(
        //   builder: (ctx, auth, previousOrders) => Orders(
        //         auth.token,
        //         previousOrders == null ? [] : previousOrders.orders,
        //       ),
        // ),
      ],
      child: Consumer<Auth>(
      builder: (ctx, auth, _) => MaterialApp(
        title: 'IRRIGATE IT',
        theme: ThemeData.dark(),
        home: auth.isAuth ? Information() : AuthScreen(),
      ),
        ),
    );
  }
}
