package es.eci.datamanager.products;

import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;

import org.json.JSONObject;


public class SearchSkuIdCodes {



	public static void main(String[] args) {
		String pathRaiz=".\\regresion";
		String pathSprint=".\\sprint";
			
			
		cargaFichero(pathRaiz, "00");
		
		for(int version=56;version<100;version++) {
			String pathCompleto=pathSprint+Integer.toUnsignedString(version);
			Path rootSprint = Paths.get(pathCompleto);
			
			
			System.out.println(rootSprint.getFileName());
			if (Files.exists(rootSprint)) {
				cargaFichero(pathCompleto, Integer.toUnsignedString(version));
			} else {
			
				System.out.println("no existe");
			}

		}


	}


	private static void cargaFichero(String path, String version) {
		
		Path msgFile =  Paths.get(path+"\\sql\\0"+version+"_ECI_CATALOG_MSG.sql");	
		
		try {
			String contentMsg = new String ( Files.readAllBytes( msgFile ) );

			FileVisitor<Path> fileSkus = new SimpleFileVisitor<Path>() {
				@Override
				public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
					return FileVisitResult.CONTINUE;
				}
	
				@Override
				public FileVisitResult visitFile(Path visitedFile, BasicFileAttributes fileAttributes) throws IOException {
					StringBuilder filename=new StringBuilder(visitedFile.getParent().toString()).append("\\").append(visitedFile.getFileName());
					
					//System.out.println(filename);
	
					
					if(filename.indexOf("\\json\\skus")>0) {
					    try
					    {
					    	String content = new String ( Files.readAllBytes( visitedFile ) );
							JSONObject jsonObject = new JSONObject(content);
							String skuId=jsonObject.getString("id_Ext");
							//Imprime el listado de productos que no están en el borrado de LAST_UPD_MSG_ID
							if(skuId!=null&&!contentMsg.contains(skuId)) {
								System.out.println("'"+skuId+"',");
							}
						} catch (IOException x) {
							System.err.format("IOException: %s%n", x);
						}
						
					}
					
					
					return FileVisitResult.CONTINUE;
				}
			};
	
			FileVisitor<Path> fileCategories = new SimpleFileVisitor<Path>() {
				@Override
				public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
					return FileVisitResult.CONTINUE;
				}
	
				@Override
				public FileVisitResult visitFile(Path visitedFile, BasicFileAttributes fileAttributes) throws IOException {
					StringBuilder filename=new StringBuilder(visitedFile.getParent().toString()).append("\\").append(visitedFile.getFileName());
					
					//System.out.println(filename);
					
					if(filename.indexOf("json\\categories")>0) {
					    try
					    {
					    	String content = new String ( Files.readAllBytes( visitedFile ) );
							JSONObject jsonObject = new JSONObject(content);
							String catId=jsonObject.getString("id_Ext");
							//Imprime el listado de productos que no están en el borrado de LAST_UPD_MSG_ID
							if(catId!=null&&!contentMsg.contains(catId)) {
								System.out.println("'"+catId+"',");
							}
						} catch (IOException x) {
							System.err.format("IOException: %s%n", x);
						}
						
					}
					
					
					return FileVisitResult.CONTINUE;
				}
			};
			
			
			Path rootPath = Paths.get(path);
			System.out.println("Skus no disponibles");
			Files.walkFileTree(rootPath, fileSkus);
			System.out.println("Categorías no disponibles");
			Files.walkFileTree(rootPath, fileCategories);
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
}
