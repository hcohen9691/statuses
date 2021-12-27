import { Component, EventEmitter, OnInit, Output, ɵivyEnabled } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { StatusService } from '../service/status.service';
import { status } from '../data/status';
import { tap, map, filter } from 'rxjs';
import { TrsitionService } from '../service/trsition.service';
import { transition } from '../data/transition';



@Component({
  selector: 'app-transitions',
  templateUrl: './transitions.component.html',
  styleUrls: ['./transitions.component.scss']
})
export class TransitionsComponent implements OnInit {
  arr: transition[] = [];
  selectedFrom = ''
  selectedTo = ''
  formGroup!: FormGroup
  @Output() hasChange: EventEmitter<any> = new EventEmitter<any>();

  statuses: string[] = [];
  statuesWithoutFrom: string[] = [];
  constructor(private formBuilder: FormBuilder,
    private statusService: StatusService,
    private transitionService: TrsitionService) { }

  ngOnInit() {
    this.initTransitions();
    this.formGroup = this.formBuilder.group({
      name: this.formBuilder.control(''),
    })
    
  }

  initStatuses() {
    this.statusService.getStatuses().pipe(
      tap(result => this.statuses = ['', ...result.map(status => status.name || '')]),
      tap(result => this.statuesWithoutFrom = ['', ...result.map(status => status.name || '')]),
    ).subscribe();
  }

  updateFrom(value: any) {
    this.selectedFrom = value;
    if (this.selectedFrom) {
      this.statuesWithoutFrom = this.statuses
        .filter((status) => status !== this.selectedFrom);
    }
  }
  updateTo(value: any) {
    this.selectedTo = value;

  }
  add() {
    const t = {
      name: this.formGroup.value.name,
      from: this.selectedFrom, to: this.selectedTo
    };
    
    this.transitionService.addTransition(t).pipe(
      tap(_ => this.initTransitions()),
      tap(_ => this.initStatuses())
    ).subscribe()
    
    
    this.formGroup.reset();
    this.statuses=[];
    this.statuesWithoutFrom=[]
  }

  delete(name: any, from: any, to: any) {
    const t = { name, from, to };

    this.transitionService.deleteTransition(t).pipe(
      tap(_ => this.initTransitions()),
      tap(_ => this.initStatuses())
    ).subscribe()
    this.formGroup.reset();
    
    
  }

  initTransitions() {
    this.transitionService.getTransitions().pipe(
      tap(result => console.log({ result })),
      tap(result => this.arr = result ? result : []),
      tap(_ => this.hasChange.emit(null))
    )
      .subscribe();
  }
  

} 
