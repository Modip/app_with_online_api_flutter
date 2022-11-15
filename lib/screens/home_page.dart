import 'package:app_with_online_api/get_users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final dataProvider = Provider.of<GetDataProvider>(context, listen: false);
    dataProvider.getData();
    print(dataProvider.responseData);
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<GetDataProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Test online Api"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: dataProvider.responseData.data!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Row(
                  children: [
                    Image.network(
                      dataProvider.responseData.data![index].avatar!,
                      height: 100,
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          Text(dataProvider
                              .responseData.data![index].firstName!),
                          const SizedBox(height: 10),
                          Text(dataProvider.responseData.data![index].email!)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
