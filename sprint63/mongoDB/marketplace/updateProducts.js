db.getCollection('products').update({product_id:{$in:[
	'MP_0436790_78',
	'MP_0001407_2',
	'A17446601',
	'A6328283'
]}},{$set:{status_published:"PUBLISH",searchable:true}},{multi:true})


