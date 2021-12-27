export class transition {
    name?:string;
    fromStatus?:string;
    toStatus?:string;    

    constructor(n?:string,from?:string,to?:string) {
        this.name = n;
        this.fromStatus=from;
        this.toStatus=to;
        
    }

}