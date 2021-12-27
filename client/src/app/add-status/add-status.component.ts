 
import { ThisReceiver } from '@angular/compiler';
import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';  
import { tap, map} from 'rxjs'; 
import { status } from '../data/status';
import { StatusService } from '../service/status.service';

@Component({
  selector: 'app-add-status',
  templateUrl: './add-status.component.html',
  styleUrls: ['./add-status.component.scss']
})
export class AddStatusComponent implements OnInit {
  status1!: status;
  arr:status[]=[]
  
  formGroup!: FormGroup;
  statusName!:status;
  @Output() hasChange :EventEmitter<any>   = new EventEmitter<any> ();

  constructor(private formBuilder: FormBuilder,
    private statusService: StatusService
  ) { }

  ngOnInit() {
    this.getStatuses();
    this.formGroup = this.formBuilder.group({
      name: this.formBuilder.control(''),
    })
  }
  getStatuses(){
    this.statusService.getStatuses().pipe(
      tap(result => this.arr = !!result? result: []),
      tap(_=>this.hasChange.emit(null ))
    ).subscribe();
  }

  add() {
     
   this.status1={name:this.formGroup.value.name}
    this.statusService.addStatus(this.status1).pipe(
      tap(_=>this.getStatuses())
    ).subscribe( )
    this.formGroup.reset()
   
  }

  delete(name: any) {
    //this.statusName={name1:name}
    this.statusService.deleteStatusByName(name).pipe(
      tap(_=>this.getStatuses())
    ).subscribe();
  }

  setInput(name: any) {
    console.log(name);
    
    this.statusService.UpdateSetInit(name).pipe(
      tap( _=>this.getStatuses())
    ).subscribe(s => console.log(s));
 
    

  }

}
