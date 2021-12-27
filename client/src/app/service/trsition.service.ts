import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders, HttpRequest } from '@angular/common/http';
import { transition } from '../data/transition';


@Injectable({
  providedIn: 'root'
})
export class TrsitionService {
  url='http://localhost:1000';

  options={
    headers:new HttpHeaders({'Content-Type':'application/json'})
  };
  constructor(private http:HttpClient) { }

  getTransitions():Observable<transition[]>{
    return this.http.get<transition[]>(`${this.url}/router/allTransitions`);
  }

  addTransition(t:transition):Observable<transition[]>{
    return this.http.post<transition[]>(`${this.url}/router/addTransition`,t,this.options)
  }
  
  deleteTransition(t:transition):Observable<transition[]>{
    return this.http.post<transition[]>(`${this.url}/router/deleteTransition`,t,this.options)
  }
}
