
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_mvvm_rest_api/helper/navigator.dart';
import 'package:todo_list_mvvm_rest_api/helper/network.dart';
import 'package:todo_list_mvvm_rest_api/model/todo_model.dart';
import 'package:todo_list_mvvm_rest_api/view/todo_create.dart';
import 'package:todo_list_mvvm_rest_api/view/todo_edit.dart';
import 'package:todo_list_mvvm_rest_api/view/todo_list.dart';

class TodoViewmodel extends ChangeNotifier{
  final NavigationService _navigationService;
  TodoViewmodel(this._navigationService){
    getAllTodos();
  }
  List<TodoModel> allTodos=[];
  var ApiEndPoint="arar1";

  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();

  navigateToCreate(){
    // this is bad way
    // Navigator.of(context).push(MaterialPageRoute(builder:
    // (context)=> TodoCreate(title:
    // 'Create List Item',)));

    _navigationService.navigate(TodoCreate(title: 'Create list item'));
  }
  navigateToEdit(TodoModel data){
    titleController.text=data.todo_title.toString();
    descriptionController.text=data.todo_description.toString();
    _navigationService.navigate(TodoEdit(data: data));
  }

   getAllTodos()async{
   // _navigationService.showLoader();
    var resData=await ApiProvider().get('/$ApiEndPoint');
    allTodos=resData.map<TodoModel>((item)=>TodoModel.fromJson(item)).toList();
    print(allTodos);
    _navigationService.goBack();
    notifyListeners();
  }
  
  createTodo() async {
    _navigationService.showLoader();
    print(titleController.text);
    print(descriptionController.text);
    var resData=await ApiProvider().post('/$ApiEndPoint',{
      "todo_title": titleController.text,
      "description": descriptionController.text
    });
    if(resData){
      getAllTodos();
      _navigationService.goBack();
     // _navigationService.navigate(TodoList());
      titleController.clear();
      descriptionController.clear();
    }
  }
  editTodo(id) async {
    _navigationService.showLoader();
    print(titleController.text);
    print(descriptionController.text);
    var resData=await ApiProvider().put('/$ApiEndPoint/$id',{
      "todo_title": titleController.text,
      "description": descriptionController.text
    });
    if(resData){
      getAllTodos();
      _navigationService.goBack();
      //_navigationService.navigate(TodoList());
      titleController.clear();
      descriptionController.clear();
    }
  }

  deleteTodo(id,index) async {
    _navigationService.showLoader();
    var resData=await ApiProvider().delete('/$ApiEndPoint/$id');
    _navigationService.goBack();
    if(resData){
      allTodos.removeAt(index);
      notifyListeners();
    }else{
      print("Not Deleted");
    }
  }
}