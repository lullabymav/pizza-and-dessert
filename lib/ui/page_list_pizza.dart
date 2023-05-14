import 'package:final_project_tpm_pizza/base/api_data_source.dart';
import 'package:final_project_tpm_pizza/model/list_pizza_model.dart';
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
          ListPizzaModel listPizzaModel = ListPizzaModel.fromJson(snapshot.data);
          return _buildSuccessSection(listPizzaModel);
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

Widget _buildSuccessSection(ListPizzaModel data){
  return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      itemBuilder: (context, index){
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
  );
}
