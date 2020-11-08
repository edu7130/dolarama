import 'package:dolarama/data_access/dao_dollar.dart';
import 'package:dolarama/model/Dollar.dart';

class Service {
  static Service instance = Service();

  Future<List<Dollar>> getListDollars() async {
    try{
      return await DaoDollar.getDollars();
    }
    catch(e){
      return null;
    }
  }
}
