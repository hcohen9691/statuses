const bd=require('body-parser')
const statusRouter=require('./routers/router')
const express = require('express')
const core=require('cors')
const { Route } = require('express')

const app=express()
app.use(bd.json())
app.use(bd.urlencoded())
app.use(core())




app.use('/router',statusRouter)

app.listen(1000,()=>console.log('localhost:1000'))

