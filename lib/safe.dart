import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:poc/model/data_model.dart';

class SafeScreen extends StatefulWidget {
  const SafeScreen({Key? key}) : super(key: key);

  @override
  State<SafeScreen> createState() => _SafeScreenState();
}

class _SafeScreenState extends State<SafeScreen> {
  SafeModel? safeModel;

  @override
  void initState() {
    super.initState();
    jsonConverter();
  }

  Future<void> jsonConverter() async {
    print("test");
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/Safe.json");
    final jsonResult = jsonDecode(data);
    print(jsonResult);
    safeModel = SafeModel.fromJson(jsonResult);
    print(safeModel);
    print("test");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("hello");
    return safeModel == null
        ? const Scaffold(body: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text(safeModel?.title ?? ""),
              backgroundColor:
                  Color(int.parse("0xff${safeModel?.color ?? 'ffff'}")),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: safeModel?.properties?.length,
                      itemBuilder: (context, index) => (safeModel
                                  ?.properties?[index].type ==
                              "options")
                          ? Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ListTile(
                                leading: const Icon(Icons.favorite, size: 35),
                                shape: const UnderlineInputBorder(),
                                title: Text(
                                  safeModel?.properties?[index].title ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                // subtitle: Text(
                                //     safeModel?.properties?[index].hint ?? ""),
                                subtitle: SizedBox(
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      hint: Text(safeModel?.properties?[index].hint ?? ""),
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                       items: safeModel?.properties?[index].options
                                          ?.map((items) {
                                        return DropdownMenuItem(
                                          value: items.title,
                                          child: Text(items.title.toString(),
                                              overflow: TextOverflow.clip),
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {},
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: const Icon(Icons.favorite, size: 35),
                                shape: const UnderlineInputBorder(),
                                title: Text(
                                  safeModel?.properties?[index].title ?? "",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          safeModel?.properties?[index].hint),
                                ),
                              ),
                            )),
                  const SizedBox(height: 10),
                  ...?safeModel?.buttons?.map((e) => materialButton(context,
                      onPressed: () {},
                      title: e.title ?? "",
                      color: Color(int.parse("0xff${e.color ?? 'ffff'}"))))
                ],
              ),
            ),
          );
  }
}

materialButton(context,
    {required VoidCallback onPressed, required String title, Color? color}) {
  return SizedBox(
    height: 50,
    width: MediaQuery.of(context).size.width * .9,
    child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        textColor: Colors.white,
        color: color ?? const Color.fromARGB(255, 0, 158, 61),
        onPressed: onPressed,
        child: Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
  );
}
