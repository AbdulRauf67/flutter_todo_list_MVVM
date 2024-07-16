
class TodoModel{
  String? tdID;
  String? todo_title;
  String? todo_description;

  TodoModel(this.tdID, this.todo_title,this.todo_description);

  TodoModel.fromJson(Map<String,dynamic> json){
    tdID=json['_id'];
    todo_title=json['todo_title'];
    todo_description=json['description'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data= <String,dynamic>{};

    data['_id']=tdID;
    data['todo_title']=todo_title;
    data['description']=todo_description;

    return data;
  }
}