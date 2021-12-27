import { Component, ViewChild } from '@angular/core';
import { tap } from 'rxjs';
import { AddStatusComponent } from './add-status/add-status.component';
import { StatusService } from './service/status.service';
import { TransitionsComponent } from './transitions/transitions.component';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'app'; 
  @ViewChild(TransitionsComponent,{static:false}) transComponent :TransitionsComponent ={} as TransitionsComponent ;
  @ViewChild(AddStatusComponent,{static:false}) addSatusComponent :AddStatusComponent ={} as AddStatusComponent ;
  
  constructor( private statusService: StatusService){}
  hasSttusesChanges( ){
      this.transComponent.initStatuses();
  }
  
  hasSttusesChanges1( ){
    this.transComponent.initTransitions()
  }
  
  hasTransitionsChanges( ){
    this.addSatusComponent.getStatuses();
  }
  reset(){
    this.statusService.reset().pipe(
      tap(_=>this. hasSttusesChanges( )),
      tap(_=>this.transComponent.initTransitions( )),
    ).subscribe();
  }
}
