db.getCollection('skus').update({ean:{$in:[
"2401995970930",
"2401995970947",
"2401995970954",
"2401995970961",
"2401995970985",
"2401620890749",
"2401620890756",
"2401620890763",
"2401620890770",
"2401620890787"
]}},{$set:{
    "reference_type" : "12",
    "available_date" : ISODate("2019-08-07T08:33:23.791Z"),
    "main_square_image" : "http://sgfm.elcorteingles.pre/SGFM/dctm/MARKET/000/000/000/0000000000124_00_640x640.jpg",
    "main_image" : "http://sgfm.elcorteingles.pre/SGFM/dctm/MARKET/000/000/000/0000000000124_00_440x440.jpg"
	}},{multi:true})