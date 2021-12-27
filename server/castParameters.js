module.exports=function castP(obj){
    let param=''
    for(let item in obj){
        param=param+`'`+obj[item]+`'`+', '
    }
    param=param.substr(0,param.length-2)
    return param;
}