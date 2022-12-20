

//this class is going to describe how every task will be.yani bu class her task nasil olacagini karar vereck/belirleyeck


class Task  {
 final String name;
bool isDone;

Task({required this.name , this.isDone=false});//defulat value verince required kelimesi yazamayiz

void toggleDone() {//toggle yani geçiş demeki
  isDone=!isDone;//bu fonks calisinca eger isDone degiskeni false ise true olur veya true ise false olur tersi/degili aliyoz yani

}
}