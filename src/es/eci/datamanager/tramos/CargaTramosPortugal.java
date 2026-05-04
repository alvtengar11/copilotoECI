package es.eci.datamanager.tramos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class CargaTramosPortugal {

	//private static String DATABASE="jdbc:oracle:thin:@db.uat002.azure.cloud.elcorteingles.es:1524/worker"; //cloud02 - apunta Desarrollo (cloud001,cloud007, local)
	private static String DATABASE="jdbc:oracle:thin:@db.uat008.azure.cloud.elcorteingles.es:1524/worker"; //cloud08 - apunta PRE (cloud002, cloud008, cloud010, NFT)
	private static String DBUSER="ECI_INVENTORY";
	private static String DBPWD="ECI_INVENTORY";

	public static void main(String[] args) {
		

		Connection con1=null;
		PreparedStatement psInsert=null, psQuery=null, psDelete=null;
		
		String query="select count(*) FROM ECI_INVENTORY.ECI_EXPRESS_CAPACITY " + 
				" WHERE CENTRE_ID=? and SERVICE_TYPE =? and START_DATE > ?";

		String delete="DELETE FROM ECI_INVENTORY.ECI_EXPRESS_CAPACITY " + 
				" WHERE CENTRE_ID=? and SERVICE_TYPE =? and START_DATE >= ?";

		
		String insert="Insert into ECI_INVENTORY.ECI_EXPRESS_CAPACITY " + 
				" (START_DATE, COMPANY_ID, CENTRE_ID, SERVICE_TYPE, RESTRICTIONS, CAPACITY, END_DATE)" + 
				" Values (?, ?, ?, ?, ?, ?, ?)";
		
		List<String> companies=cargaCompany();
		List<String[]> centros=cargaCentros();
		List<String[]> centrosDelete=cargaCentrosDelete();
		int capacity=20;
		String restrictionsNoFood="alcohol";
		String restrictionsFood="alcohol,preparation_required,frozen,refrigerated";
		
		DateTimeFormatter formatoFecha= DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		
		try {
			con1=DriverManager.getConnection(DATABASE, DBUSER, DBPWD);
			psInsert=con1.prepareStatement(insert);
			psQuery=con1.prepareStatement(query);
			//Borrado de centro conflictivos
			psDelete=con1.prepareStatement(delete);
			
			LocalDateTime fecha=LocalDateTime.now();
			
			int nDias=365;
			int nTramos=16;

				
			LocalDateTime fechaActual=fecha.withHour(10).withMinute(0);

			for (String[] centro:centrosDelete) {
				psDelete.setString(1,  centro[0]);
				psDelete.setString(2,  centro[1]);
				psDelete.setString(3,  fechaActual.format(formatoFecha));
				psDelete.addBatch();
			}
			psDelete.executeBatch();

			
			
			for (String[] centro:centros) {
				for (String company:companies) {
				
					psQuery.setString(1,  centro[0]);
					psQuery.setString(2,  centro[1]);
					psQuery.setString(3,  fechaActual.format(formatoFecha));
					
					ResultSet rs=psQuery.executeQuery();
					if(rs.next() && rs.getInt(1)==0) {
					
						for (long j=0;j<nDias;j++) {
							LocalDateTime fechaDia=fechaActual.plusDays(j);
							for (int i=0;i<nTramos;i++) {
								
								LocalDateTime fechaTramo=fechaDia.plusHours(i);
								String initTramo=fechaTramo.format(formatoFecha);
								String endTramo=fechaTramo.plusMinutes(59).format(formatoFecha);
								psInsert.setString(1, initTramo);
								psInsert.setString(2, company);
								psInsert.setString(3, centro[0]);
								psInsert.setString(4, centro[1]);
								
								String restriction=null;
								if (fechaTramo.getHour()>21) {
									if(centro[1].equals("NO_FOOD")) {
										restriction= restrictionsNoFood;
									}else if (centro[1].equals("FOOD")||centro[1].equals("CLICK_AND_CAR")) {
										restriction= restrictionsFood;
									}
								}
								
								psInsert.setString(5, restriction);
								psInsert.setInt(6, Integer.valueOf(capacity));
								psInsert.setString(7, endTramo);
								//System.out.println(initTramo+" "+company+" "+centro[0]+" "+centro[1]+" "+restriction+" "+capacity);
								psInsert.addBatch();
							}
						}
					}
				}
			}
			psInsert.executeBatch();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(psInsert!=null) psInsert.close();
				if(con1!=null) con1.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	private static List<String> cargaCompany(){
		
		ArrayList<String> listaCompany=new ArrayList<String>();
		
		listaCompany.add("001");
		listaCompany.add("004"); 
		
		return listaCompany;
	}
	
	private static List<String[]> cargaCentrosDelete(){
		
		ArrayList<String[]> listaCentros=new ArrayList<String[]>();
		

		listaCentros.add(new String[]{"0140", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0140", "FOOD"}); 
		listaCentros.add(new String[]{"0140", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0142", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0142", "FOOD"}); 
		listaCentros.add(new String[]{"0142", "NO_FOOD"}); 
		return listaCentros;
	}

	private static List<String[]> cargaCentros(){
	
		ArrayList<String[]> listaCentros=new ArrayList<String[]>();
		

		listaCentros.add(new String[]{"0140", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0140", "FOOD"}); 
		listaCentros.add(new String[]{"0140", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0142", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0142", "FOOD"}); 
		listaCentros.add(new String[]{"0142", "NO_FOOD"}); 
		return listaCentros;
	}
	
}
