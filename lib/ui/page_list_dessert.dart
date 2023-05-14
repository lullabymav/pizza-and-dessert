import 'package:final_project_tpm_pizza/base/api_data_source.dart';
import 'package:final_project_tpm_pizza/model/list_dessert_model.dart';
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
          ListDessertModel listDessertModel = ListDessertModel.fromJson(snapshot.data);
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 4 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10
              ),
              itemBuilder: (context, index){
                return _buildSuccessSection(listDessertModel);
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

Widget _buildSuccessSection(ListDessertModel data){
  return InkWell(
    onTap: (){},
    child: GridTile(
      child: Image.network(
        data.img!,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black38,
        title: Text(
          data.name!,
          style: TextStyle(
              fontSize: 16
          ),
        ),
        subtitle: Text(
          data.price!.toString(),
          style: TextStyle(
              fontSize: 10
          ),
        ),
      ),
    ),
  );
}
