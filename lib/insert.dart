import 'package:flutter/material.dart';
import 'package:img_attributes/MongoDBModel.dart';
import 'package:img_attributes/dbHelper/mongodb.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class MongoDbInsert extends StatefulWidget{
  MongoDbInsert({Key? key}) : super(key:key);

  @override
  _MongoDbInsertState createState() => _MongoDbInsertState();


}

class _MongoDbInsertState extends State<MongoDbInsert>{
  var aNameController = new TextEditingController();
  var aIDController = new TextEditingController();
  var wTypeController = new TextEditingController();
  var sUsedController = new TextEditingController();
  var aLocController = new TextEditingController();
  var wCodeController = new TextEditingController();
  var wLocController = new TextEditingController();
  var wNameController = new TextEditingController();
  var yCompController = new TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child:
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text("Insert Data",
              style: TextStyle(fontSize: 25),)
              ,SizedBox(height:50,)
              ,TextField(
                controller: aNameController,
                decoration: InputDecoration(labelText: "Asset Name"),
              )
              ,TextField(
                controller: aIDController,
                decoration: InputDecoration(labelText: "Asset ID"),
              )
              ,TextField(
                controller: wTypeController,
                decoration: InputDecoration(labelText: "Work Type"),
              )
              ,TextField(
                controller: sUsedController,
                decoration: InputDecoration(labelText: "Scheme Used"),
              )
              ,TextField(

                controller: aLocController,
                decoration: InputDecoration(labelText: "Asset Location"),
              )
              ,TextField(
                controller: yCompController,
                decoration: InputDecoration(labelText: "Year of Completion"),
              )
              ,TextField(
                controller: wCodeController,
                decoration: InputDecoration(labelText: "Work Code"),
              )
              ,TextField(
                controller: wNameController,
                minLines: 3,
                maxLines: 6,
                decoration: InputDecoration(labelText: "Work Name"),
              )
              ,TextField(
                controller: wLocController,
                decoration: InputDecoration(labelText: "Work Location"),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ElevatedButton(onPressed: (){
                  _insertData(aNameController.text, aIDController.text, wTypeController.text, sUsedController.text, aLocController.text,wCodeController.text, wLocController.text, wNameController.text, yCompController.text);
                }, child: Text("Insert Image Data"))],)

            ],
          ),
        ),
      ),
    );
  }
  Future<void> _insertData(String AssetName, String AssetID, String workType, String schemeUsed, String AssetLocation, String workCode, String workLocation, String workName, String yearofComp) async{
    var _id = M.ObjectId(); //USED FOR UNIQUE ID
    final data = MongoDbModel(id: _id, AssetName: AssetName, AssetID: AssetID, workType: workType, schemeUsed: schemeUsed, AssetLocation: AssetLocation, workCode: workCode, workLocation: workLocation, workName: workName, yearofComp: yearofComp);
    var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Insert ID" + _id.$oid)));
    _clearAll();

  }

  void _clearAll(){
    aNameController.text = "";
    aIDController.text = "";
    wTypeController.text = "";
    sUsedController.text = "";
    aLocController.text = "";
    wCodeController.text = "";
    wLocController.text = "";
    wNameController.text = "";
    yCompController.text = "";
  }
}