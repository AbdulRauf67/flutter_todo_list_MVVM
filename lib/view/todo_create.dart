
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewModel/todo_viewmodel.dart';

class TodoCreate extends StatefulWidget {

  const TodoCreate({super.key, required this.title});

  final String title;


  @override
  State<TodoCreate> createState() => _TabState();
}

class _TabState extends State<TodoCreate> {

  GlobalKey<FormState> _globalKey=GlobalKey();


  @override
  Widget build(BuildContext context) {
    final todocontroler=Provider.of<TodoViewmodel>(context);
    return Scaffold(
      backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
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
                      todocontroler.createTodo();
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
