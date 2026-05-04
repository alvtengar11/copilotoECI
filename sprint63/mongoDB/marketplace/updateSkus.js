db.getCollection('skus').update({ean:{$in:[
"8718939970289",
"0023800000020",
"9999999888548",
"8433611089881"
]}},{$set:{status_published:"PUBLISH",searchable:true}},{multi:true})