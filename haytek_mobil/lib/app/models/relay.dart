class RelayModel{
  RelayModel({required this.id,required this.name,required this.type , required this.relay,required this.pwd, required this.isActive,required this.time});
  int id ;
  int type;
  String name;
  int relay;
  bool isActive=false;
  int time;
  int pwd;
}