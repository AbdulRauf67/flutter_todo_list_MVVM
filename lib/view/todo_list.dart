
import 'package:flutter/material.dart';
import 'package:todo_list_mvvm_rest_api/viewModel/todo_viewmodel.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {

  @override
  State<TodoList> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TodoList> {



  // Widget _displayStudentsRecord(){
  //   final todocontroler=Provider.of<TodoViewmodel>(context);
  //   return ListView.builder(
  //       itemCount: todocontroler.allTodos.length,
  //     shrinkWrap: true,
  //     physics:  const ClampingScrollPhysics(),
  //     itemBuilder: (BuildContext context, int index) {
  //       List<Card> _tilesList=[];
  //
  //       todocontroler.allTodos!.forEach((element){
  //         Card _tile=Card(
  //           child: ListTile(
  //             title: Text(todocontroler.allTodos[index].todo_title.toString()),
  //             subtitle: Text(todocontroler.allTodos[index].todo_description.toString()),
  //             trailing: PopupMenuButton(
  //               child: Icon(Icons.more_vert),
  //               itemBuilder: (BuildContext context) =>
  //               <PopupMenuEntry<String>>[
  //                 const PopupMenuItem(
  //                   child: Text('Edit'),
  //                   value: 'edit',
  //                 ),
  //                 const PopupMenuItem(
  //                   child: Text('Delete'),
  //                   value: 'delete',
  //                 )
  //               ],
  //               onSelected: (String value){
  //                 if(value=='edit'){
  //                   todocontroler.navigateToEdit(todocontroler.allTodos[index]);
  //                 }
  //                 if(value=='delete'){
  //                   todocontroler.deleteTodo(todocontroler.allTodos[index].tdID.toString(), index);
  //                 }
  //               },
  //             ),
  //           ),
  //         );
  //         _tilesList.add(_tile);
  //       });
  //       return Column(
  //         children: _tilesList,
  //       );
  //
  //     },);
  // }

  @override
  Widget build(BuildContext context) {
    final todocontroler=Provider.of<TodoViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("TODO List, MVVM, REST API"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todocontroler.navigateToCreate();
        },
        backgroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: todocontroler.allTodos.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection:Axis.vertical,
                itemBuilder: (context,index){
                return Padding(padding: EdgeInsets.all(5),
                  child: Card(
                    child: ListTile(
                      title: Text(todocontroler.allTodos[index].todo_title.toString()),
                      subtitle: Text(todocontroler.allTodos[index].todo_description.toString()),
                      trailing: PopupMenuButton(
                        child: Icon(Icons.more_vert),
                        itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                          const PopupMenuItem(
                            child: Text('Edit'),
                            value: 'edit',
                          ),
                          const PopupMenuItem(
                            child: Text('Delete'),
                            value: 'delete',
                          )
                        ],
                        onSelected: (String value){
                          if(value=='edit'){
                            todocontroler.navigateToEdit(todocontroler.allTodos[index]);
                          }
                          if(value=='delete'){
                            todocontroler.deleteTodo(todocontroler.allTodos[index].tdID.toString(), index);
                          }
                        },
                      ),
                    ),
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
