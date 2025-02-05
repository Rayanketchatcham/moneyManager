import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:moneymanager/Models/categorieModel.dart';
import 'package:moneymanager/services/db_helper.dart';

class Addtransaction extends StatefulWidget {
  const Addtransaction({super.key});

  @override
  State<Addtransaction> createState() => _AddtransactionState();
}

class _AddtransactionState extends State<Addtransaction> {
  List<CategoryT> categories = [];
  CategoryT? selectedCategory;

  String? selectedValue;
  List<String> options = ['Expenses', 'Incomes', 'General'];
  void initState() {
    super.initState();
    selectedValue = options.first;
    _loadCategories();
  }

  void _loadCategories() async {
    categories = await DatabaseHelper.instance.getCategories();
    if (categories.isNotEmpty) {
      setState(() {
        selectedCategory = categories.first;
      });
    }
  }

  void _showAddCategoriesDialog() {
    TextEditingController categoryController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Category"),
          content: TextField(
            controller: categoryController,
            decoration: InputDecoration(hintText: 'Enter category name'),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('Cancel')),
            ElevatedButton(
                onPressed: () async {
                  if (categoryController.text.isNotEmpty) {
                    CategoryT newCategory =
                        CategoryT(name: categoryController.text);
                    await DatabaseHelper.instance.addCategorie(newCategory);
                    _loadCategories();
                    Navigator.pop(context);
                  }
                },
                child: Text('Add'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    // Section supérieure (fond dégradé)
                    Container(
                      height: 320,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 124, 28, 224),
                            Color(0xFFb781ec),
                          ],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_ios,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        Text(
                                          'Add Transaction',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Arc en bas du conteneur
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Arc(
                        height: 30,
                        edge: Edge.TOP,
                        arcType: ArcType.CONVEY,
                        child: Container(
                          height: 100,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    // Carte (par-dessus le dégradé)
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 120,
            left: 20,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.83,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text('Select Type',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          value: selectedValue,
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                          ),
                          underline: SizedBox(),
                          items: options.map((String value) {
                            return DropdownMenuItem<String>(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Categorie',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.tertiary,
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<CategoryT>(
                          value: selectedCategory,
                          isExpanded: true,
                          dropdownColor: Colors.white,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 30,
                          ),
                          underline: SizedBox(),
                          items: categories.map((Category) {
                            return DropdownMenuItem(
                              child: Text(Category.name),
                              value: Category,
                            );
                          }).toList()
                            ..add(DropdownMenuItem(
                              child: Text(
                                'Add NEw category',
                                style: TextStyle(color: Colors.blue),
                              ),
                              value: null,
                            )),
                          onChanged: (newValue) {
                            if (newValue == null) {
                              _showAddCategoriesDialog();
                            } else {
                              setState(() {
                                selectedCategory = newValue;
                              });
                            }
                          },
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Amount',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary, // Couleur de fond
                        border: Border.all(
                            color: Colors.grey, width: 2), // Bordure autour
                        borderRadius:
                            BorderRadius.circular(10), // Coins arrondis
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              '\$',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter amount',
                                border: InputBorder
                                    .none, // Supprime la bordure par défaut
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 9), // Ajuste l'espacement
                              ),
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'USD',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Add transaction',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
