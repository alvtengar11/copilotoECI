package es.eci.datamanager.products;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.StringReader;
import java.nio.file.FileVisitResult;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;

import org.json.JSONArray;
import org.json.JSONObject;


public class SearchSterlingCodes {



	public static void main(String[] args) {
		//String pathRaiz=".";
		String pathRegresion=".\\regresion";
		String pathPrimeriti=".\\primeriti";
		
		try {
			final Path csvFile =  Paths.get(".\\regresion\\csv\\sterling\\stock_total.csv");	
			String contentCSV = new String ( Files.readAllBytes( csvFile ) );
			StringBuilder contentSQL = new StringBuilder();
			
			FileVisitor<Path> ficherosSQL = new SimpleFileVisitor<Path>() {
				@Override
				public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
					return FileVisitResult.CONTINUE;
				}
	
				@Override
				public FileVisitResult visitFile(Path visitedFile, BasicFileAttributes fileAttributes) throws IOException {
					StringBuilder filename=new StringBuilder(visitedFile.getParent().toString()).append("\\").append(visitedFile.getFileName());
					
					//System.out.println(filename);
					
					if(filename.indexOf("_ECI_INVENTORY.sql")>0) {
					    try
					    {
					    	String content = new String ( Files.readAllBytes( visitedFile ) );
					    	contentSQL.append(content.replaceAll(" ", ""));
					    	
						} catch (IOException x) {
							System.err.format("IOException: %s%n", x);
						}
					}
					
					return FileVisitResult.CONTINUE;
				}
			};

			
			FileVisitor<Path> ficherosJson = new SimpleFileVisitor<Path>() {
				@Override
				public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
					return FileVisitResult.CONTINUE;
				}
	
				@Override
				public FileVisitResult visitFile(Path visitedFile, BasicFileAttributes fileAttributes) throws IOException {
					StringBuilder filename=new StringBuilder(visitedFile.getParent().toString()).append("\\").append(visitedFile.getFileName());
					
					//System.out.println(filename);
					
					if(filename.indexOf("json\\skus")>0) {
					    try
					    {
					    	String content = new String ( Files.readAllBytes( visitedFile ) );
							JSONObject jsonObject = new JSONObject(content);
							String uniqueCode=uniqueCode(jsonObject);
							//Imprime el listado de productos que no realizan carga de stock en Sterling 
							if(uniqueCode!=null&&!contentCSV.contains(uniqueCode)) {
								System.out.println(uniqueCode);
							}
						} catch (IOException x) {
							System.err.format("IOException: %s%n", x);
						}
						
					}
					
					
					return FileVisitResult.CONTINUE;
				}
			};
			Path rootRegresion = Paths.get(pathRegresion);
			Path rootPrimeriti = Paths.get(pathPrimeriti);
			//Path root= Paths.get(pathRaiz);
			
			System.out.println("Imprime el listado de productos que no realizan carga de stock en Sterling");
			Files.walkFileTree(rootRegresion, ficherosJson);
			Files.walkFileTree(rootRegresion, ficherosSQL);
			Files.walkFileTree(rootPrimeriti, ficherosSQL);
			
			BufferedReader listado=new BufferedReader(new StringReader(contentCSV));
			String line = null;
			System.out.println("Imprime el listado de productos del CSV que no están en regresión");
			while ((line = listado.readLine()) != null) {
				String codes[]=line.split(",");
				String comparativa="'"+codes[1].substring(3)+"','"+codes[0]+"'";
				if(contentSQL.indexOf(comparativa)<0) {
					System.out.println(comparativa);
				}
			}
			
			
			//csvFile.close();
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
