
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/angular_components.dart';

class Conference {
  String conferenceName;
  List<Conference> conferenceKids = new List<Conference>();
  Conference(this.conferenceName,this.conferenceKids);
  Conference.onlyName(this.conferenceName);


}


@Component(
  selector: 'my-app',
  templateUrl : 'app_component.html',
  //styleUrls: const ['list_component.css'],
  directives: const [CORE_DIRECTIVES,formDirectives,Conference,ListComponent, materialDirectives,],
  providers: const [materialProviders ],
)
class AppComponent {

  final title = 'Conference Manager';
  List<Conference> conferences = [];
  Conference newName;
  void addConference(String newConferenceName) {
    if (newConferenceName?.length > 0) {
      newName = new Conference.onlyName(newConferenceName);
      conferences.add(newName);
    }
  }


}

@Component(
  selector: 'liste',
  templateUrl :'conference.html',
  directives: const [CORE_DIRECTIVES,formDirectives,AppComponent,ListComponent,materialDirectives,],
  providers: const [materialProviders ],
)
class ListComponent {

  @Input()
  Conference conferenceInput;

  @Input()
  List<Conference> conferenceListInput;

  @Input()
  int iterator;



  bool isSelected;


  void addConferenceKids(String newConferenceKidsName){
    if (newConferenceKidsName?.length > 0) {
      var newKidsName = new Conference.onlyName(newConferenceKidsName);
      conferenceInput.conferenceKids.add(newKidsName);
    }

  }

  Conference remove(int index) =>  conferenceListInput.removeAt(index);

  void onReorder(ReorderEvent e) =>
      conferenceListInput.insert(e.destIndex,  conferenceListInput.removeAt(e.sourceIndex));
 /**
  ButtonElement deleteButton;
  InputElement toDoInput;


  void main() {
    toDoInput = querySelector('#input-list');
    toDoInput.onChange.listen(addToDoItem);
    deleteButton = querySelector('#delete');
  }

  void addToDoItem(Event e) {
    var newToDo = new LIElement();
    newToDo.text = toDoInput.value;
    deleteButton.onClick.listen((e) => newToDo.remove());
    toDoInput.value = '';

  }
  **/
  void onSelect() => isSelected =! isSelected;

}









