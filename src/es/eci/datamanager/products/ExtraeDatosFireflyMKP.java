package es.eci.datamanager.products;

import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;


import org.json.JSONObject;


public class ExtraeDatosFireflyMKP {



	public static void main(String[] args) {
		String pathRegresion=".\\firefly\\json\\MarketplaceUAT\\offers";
		final Path csvFile =  Paths.get(".\\firefly\\firefly_MKP_UAT.csv");	
		
		try {
		    final FileWriter datosCSV= new FileWriter(csvFile.toFile());
			String cabecera="ean;Offer_id\n";
			
			datosCSV.write(cabecera);
			
			
			FileVisitor<Path> ficherosJson = new SimpleFileVisitor<Path>() {
				@Override
				public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
					return FileVisitResult.CONTINUE;
				}
	
				@Override
				public FileVisitResult visitFile(Path visitedFile, BasicFileAttributes fileAttributes) throws IOException {
					StringBuilder filename=new StringBuilder(visitedFile.getParent().toString()).append("\\").append(visitedFile.getFileName());
					
					System.out.println(filename);
					
					//if(filename.indexOf("json\\skus\\")>0) {
					    try
					    {
					    	String content = new String ( Files.readAllBytes( visitedFile ) );
							StringBuilder lineaDatos = new StringBuilder();
							JSONObject jsonObject = new JSONObject(content);
							String ean=ean(jsonObject);
							int offer_id=offerId(jsonObject);

							lineaDatos.append(ean).append(";").append(offer_id).append("\n");
							
							datosCSV.write(lineaDatos.toString());
					    } catch (IOException x) {
							System.err.format("IOException: %s%n", x);
						}
						
					//}
					
					
					return FileVisitResult.CONTINUE;
				}
			};

			
			Path rootRegresion = Paths.get(pathRegresion);
			
			Files.walkFileTree(rootRegresion, ficherosJson);
			
			
			datosCSV.close();
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}

 	
	private static String ean(JSONObject jsonObject){
        String ean = null;
    	JSONObject entity = jsonObject.optJSONObject("entity");
        if (entity!=null){
        	ean = entity.getString("product_sku"); 
        }
        return ean;        
    }

	private static int offerId(JSONObject jsonObject){
        int offerId = 0;
    	JSONObject entity = jsonObject.optJSONObject("entity");
        if (entity!=null){
        	offerId = entity.getInt("id"); 
        }
        return offerId;        
    }

	
	
}
