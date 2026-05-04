db.getCollection('offersRead').update({offer_id:{$in:[
		12914,
		18718,
		18719,
		18720
	]}},{$set:{status_published:"PUBLISH",quantity:NumberInt("10000"),inStorePickup:true},$unset:{inactivedDate:""}},{multi:true})
