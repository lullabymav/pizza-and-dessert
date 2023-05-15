import 'package:final_project_tpm_pizza/base/api_data_source.dart';
import 'package:final_project_tpm_pizza/model/detail_dessert_model.dart';
import 'package:final_project_tpm_pizza/model/list_dessert_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageDetailDessert extends StatefulWidget {
  final ListDessertModel dessert;
  const PageDetailDessert({Key? key, required this.dessert}) : super(key: key);

  @override
  State<PageDetailDessert> createState() => _PageDetailDessertState();
}

class _PageDetailDessertState extends State<PageDetailDessert> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.dessert.name!),
            backgroundColor: Colors.orange[700],
          ),
          body: _buildDetailDessertBody(widget.dessert.id!),
        )
    );
  }
}

Widget _buildDetailDessertBody(int id){
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: FutureBuilder(
      future: ApiDataSource.instance.loadDetailPizza(id),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(snapshot.hasError){
          return _buildErrorSection();
        }
        if(snapshot.hasData){
          DetailDessertModel detailModel = DetailDessertModel.fromJson(snapshot.data);
          return _buildSuccessSection(context, detailModel);
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

Widget _buildLoadingSection() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator()
      ],
    ),
  );
}

Widget _buildSuccessSection(BuildContext context, DetailDessertModel data){
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          //width: MediaQuery.of(context).size.width,
          child: Image.network(data.img!, fit: BoxFit.cover),
        ),
        SizedBox(height: 6.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(data.name!,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              )
          ),
        ),
        Text(data.description!),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.attach_money),
                  SizedBox(height: 4.0),
                  Text("Rp" + data.price!.toString() + "0.000")
                ],
              ),
              Column(
                children: [
                  Icon(Icons.shopping_basket),
                  SizedBox(height: 4.0),
                  Text(data.quantity!.toString() + " pcs")
                ],
              ),
            ],
          ),
        ),
        //Text(data.sizeandcrust!.toString())
      ],
    ),
  );
}


