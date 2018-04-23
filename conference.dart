import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_app/app_component.dart';
@Component(
  selector: 'liste',
  templateUrl :'conference.html',
  styleUrls: const ['conference.css'],
  directives: const [CORE_DIRECTIVES,formDirectives,AppComponent,ListComponent,materialDirectives,],
  providers: const [materialProviders ],
)
class ListComponent {

  String editedConferenceName = '';

  @Input()
  Conference conferenceInput;

  final _removeEvent = new StreamController<Null>();
  @Output()
  get removeConf => _removeEvent.stream;

  bool isSelected;
  bool isEdited = false;

  void addConferenceKids(String newConferenceKidsName){
    if (newConferenceKidsName?.length > 0) {
      var newKidsName = new Conference.onlyName(newConferenceKidsName);
      conferenceInput.conferenceKids.add(newKidsName);
    }

  }
  Conference remove(int index) => conferenceInput.conferenceKids.removeAt(index);
  void removeFromParent() => _removeEvent.add(null);



  void onReorder(ReorderEvent e) =>
      conferenceInput.conferenceKids.insert(e.destIndex,  conferenceInput.conferenceKids.removeAt(e.sourceIndex));

  void onSelect() => isSelected =! isSelected;
  void onEdit() => isEdited =! isEdited;
  void onSubmit() => conferenceInput.conferenceName = editedConferenceName;

}
