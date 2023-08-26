import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _textController = TextEditingController();
    final _textController1 = TextEditingController();

    void _alertEdit(i) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Изменение элемента"),
              content: TextField(
                controller: _textController1,
                decoration: InputDecoration(
                    hintText: "Изменить элемент",
                    suffixIcon: IconButton(
                        onPressed: () {
                          _textController.clear();
                        },
                        icon: const Icon(Icons.clear))
                ),
              ),
              actions: [
                MaterialButton(
                    child: const Text("exit"),
                    onPressed: () {
                      Navigator.pop(context);
                      _textController.clear();
                    }),
                const SizedBox(
                  width: 110,
                ),
                MaterialButton(
                    child: const Text("save"),
                    onPressed: () {
                      listMy[i] = _textController1.value.text.toString();
                      setState(() {});
                      _textController.clear();
                      Navigator.pop(context);
                    })
              ],
            );
          });
    }

    void _alert() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Добавление элемента"),
              content: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    hintText: "Добавьте элемент",
                    suffixIcon: IconButton(
                        onPressed: () {
                          _textController.clear();
                        },
                        icon: const Icon(Icons.clear))
                ),
              ),
              actions: [
                MaterialButton(
                    child: const Text("exit"),
                    onPressed: () {
                      Navigator.pop(context);
                      _textController.clear();
                    }),
                const SizedBox(
                  width: 110,
                ),
                MaterialButton(
                    child: const Text("save"),
                    onPressed: () {
                      listMy.add(_textController.value.text.toString());
                      setState(() {});
                      _textController.clear();
                      Navigator.pop(context);
                    })
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: Provider.of<List<String>>(context).length,
              itemBuilder: (context, i) {
                return Container(
                    margin: const EdgeInsets.only(
                        left: 15, top: 10, right: 15, bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                    child: ListTile(
                      title: Align(
                        child: Text(
                          Provider.of<List<String>>(context)[i],
                          style: const TextStyle(color: Colors.yellow),
                        ),
                      ),
                      leading: IconButton(
                        icon: const Icon(Icons.edit, color: Colors.green),
                        onPressed: () {
                          _alertEdit(i);
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          listMy.remove(listMy[i]); // or you can use removeAt()
                          setState(() {});
                        },
                      ),
                      onTap: () => debugPrint("home"),
                      onLongPress: () => debugPrint("work"),
                    )
                );
              })
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          _alert();
        },
        child: const Icon(
          Icons.add_box_outlined,
          color: Colors.black,
          size: 60,
        ),
      ),
    );
  }
}
