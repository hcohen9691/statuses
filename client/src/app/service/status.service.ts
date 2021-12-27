import { HttpClient, HttpHeaders, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { status } from '../data/status';



@Injectable({
  providedIn: 'root'
})
export class StatusService {
  url='http://localhost:1000';

  options={
    headers:new HttpHeaders({'Content-Type':'application/json'})
  };
 

  constructor(private http:HttpClient) { }

  getStatuses():Observable<status[]>{
    return this.http.get<status[]>(`${this.url}/router/allStatus`);
  }

  addStatus(s:status):Observable<status[]>{
    return this.http.post<status[]>(`${this.url}/router/addStatus`,s,this.options)
  }

  
  deleteStatusByName(name:any):Observable<status[]>{
    console.log(name);
    
    return this.http.post<status[]>(`${this.url}/router/deleteStatus`,[name],this.options);
  }

  UpdateSetInit(name:any):Observable<status[]>{
    console.log(name);
    return this.http.post<status[]>(`${this.url}/router/setInitStatus`,[name],this.options);
  }

  reset()  {
   return   this.http.get (`${this.url}/router/reset`);
  }

  
}

  

 
  
  
  