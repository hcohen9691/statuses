import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TransitionsComponent } from './transitions.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';




@NgModule({
  declarations: [
    TransitionsComponent
    
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule
  ],
  exports:[TransitionsComponent]
})
export class TransitionsModule { }
