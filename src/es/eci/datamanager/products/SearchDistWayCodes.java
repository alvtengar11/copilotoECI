package es.eci.datamanager.products;

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


public class SearchDistWayCodes {



	public static void main(String[] args) {
		String pathRaiz=".\\regresion";
		String pathSprint=".\\sprint";
		try {
			
			
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
					
					if(filename.indexOf("_ECI_DISTRIBUTION_WAYS.sql")>0) {
					    try
					    {
					    	String content = new String ( Files.readAllBytes( visitedFile ) );
					    	contentSQL.append(content);
					    	
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
					
					if(filename.indexOf("json\\skus\\")>0) {
					    try
					    {
					    	String content = new String ( Files.readAllBytes( visitedFile ) );
							JSONObject jsonObject = new JSONObject(content);
							String refEci=eciRef(jsonObject);
							//Imprime el listado de productos que no cargan precio 
							if( refEci!=null && contentSQL.indexOf(refEci.substring(4,15))<0) {
								System.out.println("'"+refEci.substring(4,15)+"',");
							}
						} catch (IOException x) {
							System.err.format("IOException: %s%n", x);
						}
						
					}
					
					
					return FileVisitResult.CONTINUE;
				}
			};
			Path rootPath = Paths.get(pathRaiz);
			
			Files.walkFileTree(rootPath, ficherosSQL);
			Files.walkFileTree(rootPath, ficherosJson);
			
			for(int version=56;version<100;version++) {
				Path rootSprint = Paths.get(pathSprint+Integer.toUnsignedString(version));
				
				System.out.println(rootSprint.getFileName());
				if (Files.exists(rootSprint)) {
					Files.walkFileTree(rootSprint, ficherosSQL);
					Files.walkFileTree(rootSprint, ficherosJson);
				} else {
				
					System.out.println("No existe");
				}

			}
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}

	private static String eciRef(JSONObject jsonObject){
        String uniqueCode = null;
        if (getFirstLChildren(jsonObject)!=null ){
        	uniqueCode = findIdInArray(getFirstLChildren(jsonObject), "RefECI");
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
