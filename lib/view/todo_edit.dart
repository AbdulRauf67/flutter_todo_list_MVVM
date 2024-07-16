
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_mvvm_rest_api/model/todo_model.dart';
import '../viewModel/todo_viewmodel.dart';

class TodoEdit extends StatefulWidget {

  const TodoEdit({super.key, required this.data});

  final TodoModel data;


  @override
  State<TodoEdit> createState() => _TabState();
}

class _TabState extends State<TodoEdit> {

  GlobalKey<FormState> _globalKey=GlobalKey();


  @override
  Widget build(BuildContext context) {
    final todocontroler=Provider.of<TodoViewmodel>(context);
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Edit todo List Item'),
        ),
        body: Form(
            key: _globalKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 25,),
                    Container(
                      width: 400,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextFormField(
                        controller: todocontroler.titleController,
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'Required Field';
                          }else{
                            return null;
                          }
                        },
                        style: TextStyle(color: Colors.red),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter title',
                            hintStyle: TextStyle(color: Colors.grey)
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    Container(
                      width: 400,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextFormField(
                        controller: todocontroler.descriptionController,
                        minLines: 3,
                        maxLines: 5,
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'Required Field';
                          }else{
                            return null;
                          }
                        },
                        style: TextStyle(color: Colors.red),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter description',
                            hintStyle: TextStyle(color: Colors.grey)
                        ),
                      ),
                    ),

                    SizedBox(height: 25,),
                    GestureDetector(
                      onTap: (){
                        if(_globalKey.currentState!.validate()){
                          todocontroler.editTodo(widget.data.tdID);
                        }
                      },
                      child: Container(
                        width: 400,
                        height: 55,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child:Center(
                            child:  Text('Save',
                              style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }
}
