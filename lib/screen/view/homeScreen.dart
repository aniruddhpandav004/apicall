import 'package:apicall/screen/provider/homeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;
  @override
  Widget build(BuildContext context) {
    homeProviderFalse = Provider.of<HomeProvider>(context,listen: false);
    homeProviderTrue = Provider.of<HomeProvider>(context,listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("API CALL"),
        ),
        body: FutureBuilder<List>(
          future: homeProviderFalse!.apicalling(),
          builder: (context,snapshot){
            if(snapshot.hasError)
              {
                return Text("${snapshot.error}");
              }
            else if(snapshot.hasData)
              {
                List list = snapshot.data!;
                return ListView.builder(itemCount: list.length,itemBuilder: (context,index){
                  return ListTile(
                    leading: Text("${list[index].userId}"),
                    title: Text("${list[index].title}"),
                    subtitle: Text("${list[index].id}"),
                  );
                });
              }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
