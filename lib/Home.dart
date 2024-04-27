import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  List name = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Todo App",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: const Color.fromARGB(184, 64, 67, 104),
      ),
      backgroundColor: const Color.fromRGBO(126, 158, 131, 0.753),
      body: name.isEmpty
          ? const Center(
              child: Text(
                "NOTHING TO SHOW",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: name.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(25),
                  child: ListTile(
                    title: Text(name[index]),
                    tileColor: Colors.grey,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              name.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                TextEditingController nameController =
                                    TextEditingController();
                                nameController.text = name[index];
                                return AlertDialog(
                                  title: const Text("Enter a name"),
                                  content: TextField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      hintText: "Name",
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          name[index] = nameController.text;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Save"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController nameController = TextEditingController();
              return AlertDialog(
                title: const Text("Enter the Name"),
                content: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "Name"),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        name.add(nameController.text);
                        nameController.clear();
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text("Add"),
                  ),
                ],
              );
            },
          );
        },
        child: const Text(
          "Add",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
