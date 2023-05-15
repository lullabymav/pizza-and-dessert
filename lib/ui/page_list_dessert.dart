import 'package:final_project_tpm_pizza/base/api_data_source.dart';
import 'package:final_project_tpm_pizza/model/list_dessert_model.dart';
import 'package:final_project_tpm_pizza/ui/page_detail_dessert.dart';
import 'package:flutter/material.dart';

class PageListDessert extends StatefulWidget {
  const PageListDessert({Key? key}) : super(key: key);

  @override
  State<PageListDessert> createState() => _PageListDessertState();
}

class _PageListDessertState extends State<PageListDessert> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Dessert List'),
              backgroundColor: Colors.orange[700],
            ),body: _buildListDessertBody()
        )
    );
  }
}

Widget _buildListDessertBody(){
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: FutureBuilder(
      future: ApiDataSource.instance.loadDessert(),
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
                ListDessertModel listDessertModel = ListDessertModel.fromJson(snapshot.data![index]);
                return InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageDetailDessert(dessert: listDessertModel))
                    );
                  },
                  child: GridTile(
                    child: Image.network(
                      listDessertModel.img!,
                      fit: BoxFit.cover,
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.black38,
                      title: Text(
                        listDessertModel.name!,
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                      subtitle: Text(
                        'price : Rp' + listDessertModel.price!.toString() + "0.000",
                        style: TextStyle(
                            fontSize: 10
                        ),
                      ),
                    ),
                  ),
                );
                  //_buildSuccessSection(listDessertModel);
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

// Widget _buildSuccessSection(ListDessertModel data){
//   return
// }
