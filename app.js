const express = require('express');
const bodyParser = require('body-parser')
const https = require('https');
const md5File = require('md5-file')

const app = express();

app.use(express.static("public"))
app.use(bodyParser.urlencoded({extended: true}))

// app.get("/", function(req,res){
//     res.sendFile(__dirname + "/index.html")
// })

app.post("/", function(req, res){
    console.log(req.body.version)
    console.log(req.body.variant)
    console.log(req.body.arch)
    console.log(req.body.theme)

    if (req.body.button == "download") {
    res.redirect("https://vanced.app/downloads/YouTube_Vanced-v" + req.body.version + "-" + req.body.variant + "-" + req.body.arch + "-" + req.body.theme + ".apks")
    } else {
        md5File('downloads/YouTube_Vanced-v' + req.body.version + "-" + req.body.variant + "-" + req.body.arch + "-" + req.body.theme + ".apks", (err, hash) => {
            if (err) throw err
           
            res.send(`The MD5 sum of YouTube_Vanced-v'${ + req.body.version + "-" + req.body.variant + "-" + req.body.arch + "-" + req.body.theme + ".apks"}: ${hash}`)
        })
    }
})

const port = 3000
app.listen(port, () => console.log(`server is running on port ${port}!`))

