export class status {
    name?:string;
    init?:string;
    final?:string;
    orphan?:string;
    

    constructor(n?:string,statusI?:string,statusF?:string,statusO?:string) {
        this.name = n;
        this.init=statusI;
        this.final=statusF;
        this.orphan=statusO;
    }

}