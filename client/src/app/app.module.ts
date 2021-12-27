import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { AddStatusModule } from './add-status/add-status.module';
import { StatusService } from './service/status.service';
import { HttpClientModule } from '@angular/common/http';
import { TransitionsModule } from './transitions/transitions.module';
import { TrsitionService } from './service/trsition.service';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AddStatusModule,
  HttpClientModule,
  TransitionsModule
  ],
  providers: [StatusService,TrsitionService],
  bootstrap: [AppComponent]
})
export class AppModule { }
