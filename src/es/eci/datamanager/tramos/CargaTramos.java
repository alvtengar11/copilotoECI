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

public class CargaTramos {

	//private static String DATABASE="jdbc:oracle:thin:@db.uat002.azure.cloud.elcorteingles.es:1524/worker"; //cloud02 - apunta Desarrollo (cloud001,cloud007, local)
	private static String DATABASE="jdbc:oracle:thin:@db.uat008.azure.cloud.elcorteingles.es:1524/worker"; //cloud08 - apunta PRE (cloud002, cloud008, cloud010, NFT)
	private static String DBUSER="ECI_INVENTORY";
	private static String DBPWD="ECI_INVENTORY";

	public static void main(String[] args) {
		

		Connection con1=null;
		PreparedStatement psInsert=null, psQuery=null, psDelete=null;
		
		String query="select count(*) FROM ECI_INVENTORY.ECI_EXPRESS_CAPACITY " + 
				" WHERE CENTRE_ID=? and SERVICE_TYPE =? and START_DATE >= ?";

		String delete="DELETE FROM ECI_INVENTORY.ECI_EXPRESS_CAPACITY " + 
				" WHERE CENTRE_ID=? and SERVICE_TYPE =? and START_DATE >= ?";

		
		String insert="Insert into ECI_INVENTORY.ECI_EXPRESS_CAPACITY " + 
				" (START_DATE, COMPANY_ID, CENTRE_ID, SERVICE_TYPE, RESTRICTIONS, CAPACITY, END_DATE)" + 
				" Values (?, ?, ?, ?, ?, ?, ?)";
		
		String company="001";
		List<String[]> centros=cargaCentros();
		List<String[]> centrosDelete=cargaCentrosDelete();
		int capacity=2000;
		String restrictionsNoFood="alcohol,bread";
		String restrictionsFood="alcohol,bread,supermarket,frozen,refrigerated,preparation_required";
		
		DateTimeFormatter formatoFecha= DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		
		try {
			con1=DriverManager.getConnection(DATABASE, DBUSER, DBPWD);

			//Borrado de centro conflictivos
			psDelete=con1.prepareStatement(delete);
			
			psInsert=con1.prepareStatement(insert);
			psQuery=con1.prepareStatement(query);
			
			LocalDateTime fecha=LocalDateTime.now();
			
			int nDias=365;
			int nTramos=16;

				
			LocalDateTime fechaActual=fecha.withHour(8).withMinute(0);

			for (String[] centro:centrosDelete) {
				psDelete.setString(1,  centro[0]);
				psDelete.setString(2,  centro[1]);
				psDelete.setString(3,  fechaActual.format(formatoFecha));
				psDelete.addBatch();
			}
			psDelete.executeBatch();
			
			for (String[] centro:centros) {
				
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
			
			psInsert.executeBatch();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(psDelete!=null) psDelete.close();
				if(psQuery!=null) psQuery.close();
				if(psInsert!=null) psInsert.close();
				if(con1!=null) con1.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

	private static List<String[]> cargaCentrosDelete(){
		
		ArrayList<String[]> listaCentros=new ArrayList<String[]>();
		
		listaCentros.add(new String[]{"0001", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0001", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0002", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0002", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0003", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0003", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0004", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0004", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0005", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0005", "FOOD"}); 
		listaCentros.add(new String[]{"0005", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0006", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0006", "FOOD"}); 
		listaCentros.add(new String[]{"0006", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0007", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0007", "FOOD"}); 
		listaCentros.add(new String[]{"0007", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0008", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0008", "FOOD"}); 
		listaCentros.add(new String[]{"0008", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0009", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0009", "FOOD"}); 
		listaCentros.add(new String[]{"0009", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0010", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0010", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0011", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0011", "FOOD"}); 
		listaCentros.add(new String[]{"0011", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0012", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0012", "FOOD"}); 
		listaCentros.add(new String[]{"0012", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0013", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0013", "FOOD"}); 
		listaCentros.add(new String[]{"0013", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0014", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0014", "FOOD"}); 
		listaCentros.add(new String[]{"0014", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0015", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0015", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0017", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0017", "FOOD"}); 
		listaCentros.add(new String[]{"0017", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0018", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0018", "FOOD"}); 
		listaCentros.add(new String[]{"0018", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0019", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0019", "FOOD"}); 
		listaCentros.add(new String[]{"0019", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0020", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0020", "FOOD"}); 
		listaCentros.add(new String[]{"0020", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0021", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0021", "FOOD"}); 
		listaCentros.add(new String[]{"0021", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0022", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0022", "FOOD"}); 
		listaCentros.add(new String[]{"0022", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0023", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0023", "FOOD"}); 
		listaCentros.add(new String[]{"0023", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0026", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0026", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0027", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0027", "FOOD"}); 
		listaCentros.add(new String[]{"0027", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0029", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0029", "FOOD"}); 
		listaCentros.add(new String[]{"0029", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0033", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0033", "FOOD"}); 
		listaCentros.add(new String[]{"0033", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0036", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0036", "FOOD"}); 
		listaCentros.add(new String[]{"0036", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0037", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0037", "FOOD"}); 
		listaCentros.add(new String[]{"0037", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0097", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0097", "FOOD"}); 
		listaCentros.add(new String[]{"0097", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0098", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0098", "FOOD"}); 
		listaCentros.add(new String[]{"0098", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0246", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0246", "FOOD"}); 
		listaCentros.add(new String[]{"0246", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0251", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0251", "FOOD"}); 
		listaCentros.add(new String[]{"0251", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0370", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0370", "FOOD"}); 
		listaCentros.add(new String[]{"0370", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0374", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0375", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0375", "FOOD"}); 
		listaCentros.add(new String[]{"0375", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0376", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0376", "FOOD"}); 
		listaCentros.add(new String[]{"0376", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0378", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0378", "FOOD"}); 
		listaCentros.add(new String[]{"0378", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0380", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0380", "FOOD"}); 
		listaCentros.add(new String[]{"0380", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0440", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0440", "FOOD"}); 
		listaCentros.add(new String[]{"0440", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0481", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0481", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0489", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0489", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0499", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0499", "FOOD"}); 
		listaCentros.add(new String[]{"0499", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0533", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0533", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0607", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0607", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0616", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0616", "FOOD"}); 
		listaCentros.add(new String[]{"0616", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0646", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0646", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0647", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0647", "FOOD"}); 
		listaCentros.add(new String[]{"0647", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0677", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0677", "FOOD"}); 
		listaCentros.add(new String[]{"0677", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0683", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0683", "FOOD"}); 
		listaCentros.add(new String[]{"0683", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0692", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0692", "FOOD"}); 
		listaCentros.add(new String[]{"0692", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0693", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0693", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0695", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0695", "FOOD"}); 
		listaCentros.add(new String[]{"0695", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0696", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0696", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0697", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0697", "FOOD"}); 
		listaCentros.add(new String[]{"0697", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0698", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0698", "FOOD"}); 
		listaCentros.add(new String[]{"0698", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0705", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0714", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0718", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0718", "FOOD"}); 
		listaCentros.add(new String[]{"0718", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0721", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0723", "FOOD"}); 
		listaCentros.add(new String[]{"0727", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0732", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0733", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0733", "FOOD"}); 
		listaCentros.add(new String[]{"0735", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0810", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0810", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0811", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0811", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0813", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0813", "FOOD"}); 
		listaCentros.add(new String[]{"0813", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0814", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0814", "FOOD"}); 
		listaCentros.add(new String[]{"0814", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0864", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0864", "FOOD"}); 
		listaCentros.add(new String[]{"0864", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0872", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0872", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0876", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0876", "FOOD"}); 
		listaCentros.add(new String[]{"0876", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0900", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0900", "FOOD"}); 
		listaCentros.add(new String[]{"0900", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0901", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0901", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0906", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0906", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0907", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0907", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0910", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0911", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0911", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0912", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0912", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0913", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0913", "FOOD"}); 
		listaCentros.add(new String[]{"0913", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0914", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0915", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0915", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0916", "CATERING"}); 
		listaCentros.add(new String[]{"0916", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0916", "FOOD"}); 
		listaCentros.add(new String[]{"0916", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0923", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0923", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0941", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0942", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0942", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0945", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0948", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0948", "FOOD"}); 
		listaCentros.add(new String[]{"0948", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0969", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0969", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0970", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0970", "FOOD"}); 
		listaCentros.add(new String[]{"0970", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0974", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0974", "FOOD"}); 
		listaCentros.add(new String[]{"0974", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0975", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0975", "FOOD"}); 
		listaCentros.add(new String[]{"0975", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0983", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0983", "FOOD"}); 
		listaCentros.add(new String[]{"0983", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0989", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0989", "FOOD"}); 
		listaCentros.add(new String[]{"0989", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0994", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0994", "FOOD"}); 
		listaCentros.add(new String[]{"0994", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0995", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0995", "NO_FOOD"}); 

		return listaCentros;
	}
	
	private static List<String[]> cargaCentros(){
	
		ArrayList<String[]> listaCentros=new ArrayList<String[]>();
		
		listaCentros.add(new String[]{"0001", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0001", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0002", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0002", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0003", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0003", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0004", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0004", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0005", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0005", "FOOD"}); 
		listaCentros.add(new String[]{"0005", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0006", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0006", "FOOD"}); 
		listaCentros.add(new String[]{"0006", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0007", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0007", "FOOD"}); 
		listaCentros.add(new String[]{"0007", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0008", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0008", "FOOD"}); 
		listaCentros.add(new String[]{"0008", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0009", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0009", "FOOD"}); 
		listaCentros.add(new String[]{"0009", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0010", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0010", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0011", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0011", "FOOD"}); 
		listaCentros.add(new String[]{"0011", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0012", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0012", "FOOD"}); 
		listaCentros.add(new String[]{"0012", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0013", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0013", "FOOD"}); 
		listaCentros.add(new String[]{"0013", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0014", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0014", "FOOD"}); 
		listaCentros.add(new String[]{"0014", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0015", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0015", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0017", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0017", "FOOD"}); 
		listaCentros.add(new String[]{"0017", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0018", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0018", "FOOD"}); 
		listaCentros.add(new String[]{"0018", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0019", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0019", "FOOD"}); 
		listaCentros.add(new String[]{"0019", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0020", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0020", "FOOD"}); 
		listaCentros.add(new String[]{"0020", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0021", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0021", "FOOD"}); 
		listaCentros.add(new String[]{"0021", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0022", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0022", "FOOD"}); 
		listaCentros.add(new String[]{"0022", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0023", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0023", "FOOD"}); 
		listaCentros.add(new String[]{"0023", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0026", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0026", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0027", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0027", "FOOD"}); 
		listaCentros.add(new String[]{"0027", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0029", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0029", "FOOD"}); 
		listaCentros.add(new String[]{"0029", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0033", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0033", "FOOD"}); 
		listaCentros.add(new String[]{"0033", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0036", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0036", "FOOD"}); 
		listaCentros.add(new String[]{"0036", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0037", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0037", "FOOD"}); 
		listaCentros.add(new String[]{"0037", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0097", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0097", "FOOD"}); 
		listaCentros.add(new String[]{"0097", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0098", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0098", "FOOD"}); 
		listaCentros.add(new String[]{"0098", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0246", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0246", "FOOD"}); 
		listaCentros.add(new String[]{"0246", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0251", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0251", "FOOD"}); 
		listaCentros.add(new String[]{"0251", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0370", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0370", "FOOD"}); 
		listaCentros.add(new String[]{"0370", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0374", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0375", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0375", "FOOD"}); 
		listaCentros.add(new String[]{"0375", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0376", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0376", "FOOD"}); 
		listaCentros.add(new String[]{"0376", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0378", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0378", "FOOD"}); 
		listaCentros.add(new String[]{"0378", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0380", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0380", "FOOD"}); 
		listaCentros.add(new String[]{"0380", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0440", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0440", "FOOD"}); 
		listaCentros.add(new String[]{"0440", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0481", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0481", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0489", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0489", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0499", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0499", "FOOD"}); 
		listaCentros.add(new String[]{"0499", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0533", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0533", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0607", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0607", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0616", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0616", "FOOD"}); 
		listaCentros.add(new String[]{"0616", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0646", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0646", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0647", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0647", "FOOD"}); 
		listaCentros.add(new String[]{"0647", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0677", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0677", "FOOD"}); 
		listaCentros.add(new String[]{"0677", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0683", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0683", "FOOD"}); 
		listaCentros.add(new String[]{"0683", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0692", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0692", "FOOD"}); 
		listaCentros.add(new String[]{"0692", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0693", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0693", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0695", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0695", "FOOD"}); 
		listaCentros.add(new String[]{"0695", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0696", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0696", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0697", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0697", "FOOD"}); 
		listaCentros.add(new String[]{"0697", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0698", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0698", "FOOD"}); 
		listaCentros.add(new String[]{"0698", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0705", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0714", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0718", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0718", "FOOD"}); 
		listaCentros.add(new String[]{"0718", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0721", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0723", "FOOD"}); 
		listaCentros.add(new String[]{"0727", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0732", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0733", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0733", "FOOD"}); 
		listaCentros.add(new String[]{"0735", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0810", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0810", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0811", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0811", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0813", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0813", "FOOD"}); 
		listaCentros.add(new String[]{"0813", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0814", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0814", "FOOD"}); 
		listaCentros.add(new String[]{"0814", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0864", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0864", "FOOD"}); 
		listaCentros.add(new String[]{"0864", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0872", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0872", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0876", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0876", "FOOD"}); 
		listaCentros.add(new String[]{"0876", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0900", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0900", "FOOD"}); 
		listaCentros.add(new String[]{"0900", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0901", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0901", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0906", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0906", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0907", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0907", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0910", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0911", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0911", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0912", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0912", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0913", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0913", "FOOD"}); 
		listaCentros.add(new String[]{"0913", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0914", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0915", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0915", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0916", "CATERING"}); 
		listaCentros.add(new String[]{"0916", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0916", "FOOD"}); 
		listaCentros.add(new String[]{"0916", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0923", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0923", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0941", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0942", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0942", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0945", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0948", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0948", "FOOD"}); 
		listaCentros.add(new String[]{"0948", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0969", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0969", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0970", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0970", "FOOD"}); 
		listaCentros.add(new String[]{"0970", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0974", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0974", "FOOD"}); 
		listaCentros.add(new String[]{"0974", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0975", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0975", "FOOD"}); 
		listaCentros.add(new String[]{"0975", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0983", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0983", "FOOD"}); 
		listaCentros.add(new String[]{"0983", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0989", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0989", "FOOD"}); 
		listaCentros.add(new String[]{"0989", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0994", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0994", "FOOD"}); 
		listaCentros.add(new String[]{"0994", "NO_FOOD"}); 
		listaCentros.add(new String[]{"0995", "CLICK_AND_CAR"});
		listaCentros.add(new String[]{"0995", "NO_FOOD"}); 

		return listaCentros;
	}
	
}
