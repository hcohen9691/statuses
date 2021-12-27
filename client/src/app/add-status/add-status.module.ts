import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AddStatusComponent } from './add-status.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';



@NgModule({
  declarations: [AddStatusComponent],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule
  ],exports:[AddStatusComponent]
})
export class AddStatusModule { }
