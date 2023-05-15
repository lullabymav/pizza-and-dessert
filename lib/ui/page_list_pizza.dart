import 'package:final_project_tpm_pizza/base/api_data_source.dart';
import 'package:final_project_tpm_pizza/model/list_pizza_model.dart';
import 'package:final_project_tpm_pizza/ui/page_detail_pizza.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageListPizza extends StatefulWidget {
  const PageListPizza({Key? key}) : super(key: key);

  @override
  State<PageListPizza> createState() => _PageListPizzaState();
}

class _PageListPizzaState extends State<PageListPizza> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Pizza List'),
            backgroundColor: Colors.orange[700],
          ),body: _buildListPizzaBody()
        )
    );
  }
}

Widget _buildListPizzaBody(){
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: FutureBuilder(
      future: ApiDataSource.instance.loadPizza(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasError){
          return _buildErrorSection();
        }
        if(snapshot.hasData){
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 4 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index){
                ListPizzaModel listPizzaModel = ListPizzaModel.fromJson(snapshot.data![index]);
                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageDetailPizza(pizza: listPizzaModel))
                    );
                  },
                  child: GridTile(
                    child: Image.network(
                      listPizzaModel.img!,
                      fit: BoxFit.cover,
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.black38,
                      title: Text(
                        listPizzaModel.name!,
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                      subtitle: Text(
                        'price : Rp' + listPizzaModel.price!.toString() + "0.000",
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                );
                  //_buildSuccessSection(listPizzaModel);
              }
          );
        }
        return _buildLoadingSection();
      },
    ),
  );
}

Widget _buildErrorSection(){
  return Container(
    child: Text('Error Occured'),
  );
}

Widget _buildLoadingSection(){
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator()
    ],
    ),
  );
}

// Widget _buildSuccessSection(ListPizzaModel data){
//   return
// }
