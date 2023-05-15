import 'package:final_project_tpm_pizza/base/base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<List<dynamic>> loadPizza() {
    return BaseNetwork.getList("pizzas"); // get api pizza
    // "https://pizza-and-desserts.p.rapidapi.com/pizzas?rapidapi-key=014e1274d4msh92616d462e08163p11eeabjsn372db3b2da98"
  }

  Future<Map<String, dynamic>> loadDetailPizza(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("pizzas/$id"); // get api pizza
    // "https://pizza-and-desserts.p.rapidapi.com/pizzas/1?rapidapi-key=014e1274d4msh92616d462e08163p11eeabjsn372db3b2da98"
  }

  Future<List<dynamic>> loadDessert() {
    return BaseNetwork.getList("desserts"); // get api pizza
    // "https://pizza-and-desserts.p.rapidapi.com/desserts?rapidapi-key=014e1274d4msh92616d462e08163p11eeabjsn372db3b2da98"
  }

  Future<Map<String, dynamic>> loadDetailDessert(int idDiterima) {
    String id = idDiterima.toString();
    return BaseNetwork.get("desserts/$id"); // get api pizza
    // "https://pizza-and-desserts.p.rapidapi.com/desserts/1?rapidapi-key=014e1274d4msh92616d462e08163p11eeabjsn372db3b2da98"
  }
}