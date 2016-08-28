var express = require("express");

express()
  .get("*", function(req,res){
    res.send("Hai there");
  })
  .listen(3000, function(err){
    if(err){
      console.error(err);
      return;
    }

    console.log("Express is listening..");
  })
;
