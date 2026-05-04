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

import org.json.JSONArray;
import org.json.JSONObject;


public class ExtraeDatosFireflyECI {



	public static void main(String[] args) {
		String pathRegresion=".\\firefly\\json\\UAT\\skus";
		//String pathPrimeriti=".\\primeriti";
		final Path csvFile =  Paths.get(".\\firefly\\firefly_UAT.csv");	
		
		try {
		    final FileWriter datosCSV= new FileWriter(csvFile.toFile());
			String cabecera="Product_id;Eci_ref;Unique_code;Display_name;EAN;EANI;Sku_id\n";
			
			datosCSV.write(cabecera);
			
			
			FileVisitor<Path> ficherosJson = new SimpleFileVisitor<Path>() {
				@Override
				public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
					return FileVisitResult.CONTINUE;
				}
	
				@Override
				public FileVisitResult visitFile(Path visitedFile, BasicFileAttributes fileAttributes) throws IOException {
					StringBuilder filename=new StringBuilder(visitedFile.getParent().toString()).append("\\").append(visitedFile.getFileName());
					
					//System.out.println(filename);
					
					//if(filename.indexOf("json\\skus\\")>0) {
					    try
					    {
					    	String content = new String ( Files.readAllBytes( visitedFile ) );
							StringBuilder lineaDatos = new StringBuilder();
							JSONObject jsonObject = new JSONObject(content);
							String uniqueCode=uniqueCode(jsonObject);
							String eciRef=eciRef(jsonObject);
							String codigoA=codigoA(jsonObject);
							String displayName=displayName(jsonObject);
							String ean=ean(jsonObject);
							String eani=eani(jsonObject);
							String skuId=skuId(jsonObject);

							lineaDatos.append(codigoA).append(";").append(eciRef).append(";").append(uniqueCode).append(";")
							.append(displayName).append(";").append(ean).append(";").append(eani).append(";").append(skuId).append("\n");
							
							datosCSV.write(lineaDatos.toString());
					    } catch (IOException x) {
							System.err.format("IOException: %s%n", x);
						}
						
					//}
					
					
					return FileVisitResult.CONTINUE;
				}
			};

			FileVisitor<Path> ficherosJsonAlim = new SimpleFileVisitor<Path>() {
				@Override
				public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
					return FileVisitResult.CONTINUE;
				}
	
				@Override
				public FileVisitResult visitFile(Path visitedFile, BasicFileAttributes fileAttributes) throws IOException {
					StringBuilder filename=new StringBuilder(visitedFile.getParent().toString()).append("\\").append(visitedFile.getFileName());
					
					//System.out.println(filename);
					
					if(filename.indexOf("json\\skusAlim\\")>0) {
					    try
					    {
					    	String content = new String ( Files.readAllBytes( visitedFile ) );
							StringBuilder lineaDatos = new StringBuilder();
							JSONObject jsonObject = new JSONObject(content);
							String uniqueCode=uniqueCode(jsonObject);
							String eciRef=eciRef(jsonObject);
							String codigoA=codigoA(jsonObject);
							String displayName=displayNameAlim(jsonObject);
							String ean=ean(jsonObject);
							String eani=eani(jsonObject);
							String skuId=skuId(jsonObject);

							lineaDatos.append(codigoA).append(";").append(eciRef).append(";").append(uniqueCode).append(";")
							.append(displayName).append(";").append(ean).append(";").append(eani).append(";").append(skuId).append("\n");
							
							datosCSV.write(lineaDatos.toString());
					    } catch (IOException x) {
							System.err.format("IOException: %s%n", x);
						}
						
					}
					
					
					return FileVisitResult.CONTINUE;
				}
			};
			
			Path rootRegresion = Paths.get(pathRegresion);
			//Path root= Paths.get(pathRaiz);
			
			Files.walkFileTree(rootRegresion, ficherosJson);
			//Files.walkFileTree(rootRegresion, ficherosJsonAlim);
			
			//Path rootPrimeriti = Paths.get(pathPrimeriti);
			
			//Files.walkFileTree(rootPrimeriti, ficherosJson);
			
			datosCSV.close();
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}

	private static String uniqueCode(JSONObject jsonObject){
        String uniqueCode = null;
        if (getFirstLChildren(jsonObject)!=null && getSecondLChildren(jsonObject,"General")!=null){
        	uniqueCode = findIdInArray(getSecondLChildren(jsonObject,"General"), "CodigoUnico");
        }
        return uniqueCode;        
    }

	private static String eciRef(JSONObject jsonObject){
        String uniqueCode = null;
        if (getFirstLChildren(jsonObject)!=null ){
        	uniqueCode = findIdInArray(getFirstLChildren(jsonObject), "RefECI");
        }
        return uniqueCode;        
    }
	
	private static String codigoA(JSONObject jsonObject){
        String codigoA = null;
        if (getFirstLChildren(jsonObject)!=null && getSecondLChildren(jsonObject,"Variantes")!=null){
        	codigoA = findIdInArray(getSecondLChildren(jsonObject,"Variantes"), "CodigoVarianteWeb");
        }
        return codigoA;        
    }

	private static String displayName(JSONObject jsonObject){
        String displayName = null;
        if (getFirstLChildren(jsonObject)!=null && getThirdLChildren(jsonObject,"General","DescripcionModeloWeb")!=null){
        	displayName = findIdInArray(getThirdLChildren(jsonObject,"General","DescripcionModeloWeb"), "es_ES");
        }
        return displayName;        
    }
 	
	private static String displayNameAlim(JSONObject jsonObject){
        String displayName = null;
        if (getFirstLChildren(jsonObject)!=null && getSecondLChildren(jsonObject,"General")!=null){
        	displayName = findIdInArray(getSecondLChildren(jsonObject,"General"), "DescripcionModeloWeb");
        }
        return displayName;        
    }
 	
	private static String ean(JSONObject jsonObject){
        String ean = null;
        if (getFirstLChildren(jsonObject)!=null && getSecondLChildren(jsonObject,"General")!=null){
        	ean = findIdInArray(getSecondLChildren(jsonObject,"General"), "EanGtin");
        }
        return ean;        
    }

	private static String eani(JSONObject jsonObject){
        String eani = null;
        if (getFirstLChildren(jsonObject)!=null && getSecondLChildren(jsonObject,"General")!=null){
        	eani = findIdInArray(getSecondLChildren(jsonObject,"General"), "Eani");
        }
        return eani;        
    }

	private static String skuId(JSONObject jsonObject){
        String skuId = null;
        if (getFirstLChildren(jsonObject)!=null ){
        	skuId = findIdInArray(getFirstLChildren(jsonObject), "ExternalCode");
        }
        return skuId;        
    }
	
	/**
     * Get the children array property within coreAttribs property
     * @return JSONArray
     */
    private static JSONArray getFirstLChildren(JSONObject jsonObject) {
        JSONArray coreAttribs = jsonObject.optJSONArray("coreAttribs");
        JSONArray childrenFirstL=null;
        if (coreAttribs.length()>0){
        	childrenFirstL = coreAttribs.optJSONObject(0).optJSONArray("children"); 
        }
        return childrenFirstL;
    }
    
    /**
     * Get the children array property within the first children array in the coreAttrib property  (second level)
     * @param section
     * @return JSONArray
     */
    private static JSONArray getSecondLChildren(JSONObject jsonObject,String section) {
    	JSONArray childrenFirstL=getFirstLChildren(jsonObject);        
        JSONArray childrenSecondL=null;
       int i=0;
        while (i<childrenFirstL.length()){
            JSONObject obj = childrenFirstL.getJSONObject(i);
            if(section.equalsIgnoreCase(obj.getString("id"))){
                childrenSecondL = obj.optJSONArray("children");
                break;
            }
            i++;
        }  
        return childrenSecondL;
    }
    
    /**
     * Get the children array property within the first children array in the coreAttrib property  (second level)
     * @param section
     * @return JSONArray
     */
    private static JSONArray getThirdLChildren(JSONObject jsonObject,String section1,String section2) {
       JSONArray childrenSecondL=getSecondLChildren(jsonObject,section1);
       JSONArray childrenThirdL=null;
       int i=0;
       while (i<childrenSecondL.length()){
            JSONObject obj = childrenSecondL.getJSONObject(i);
            if(section2.equalsIgnoreCase(obj.getString("id"))){
            	childrenThirdL = obj.optJSONArray("children");
                break;
            }
            i++;
        }  
        return childrenThirdL;
    }

    private static String findIdInArray(JSONArray array, String id){
        int i=0;
        String value = null;
        while (i<array.length()){
            JSONObject obj = array.getJSONObject(i);
            if(id.equalsIgnoreCase(obj.getString("id"))){
                value = obj.getString("value");
                break;
            }
            i++;
        }
        return value;
    }

	
}
