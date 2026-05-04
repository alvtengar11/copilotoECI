db.getCollection('offersRead').update({ean:{$in:[
"2401995970930",
"2401995970947",
"2401995970985"
]}},{$set:{inStorePickup:true}},{multi:true})



db.getCollection('offers').update({ean:{$in:[
"2401995970930",
"2401995970947",
"2401995970985"
]}},{$set:{inStorePickup:true}},{multi:true})