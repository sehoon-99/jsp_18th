package dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import dto.Report;

public class ReportRepository {
	ArrayList<Report> ReportList = new ArrayList<Report>();
	
	private static ReportRepository instance = new ReportRepository();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date now = new Date();
    String formattedDate = sdf.format(now);
	
	public static ReportRepository getInstance() {
		return instance;
	}
	 
     
 
	
	public ReportRepository() {
		Report report1 = new Report("01063898063","제보합니다!") ;
		report1.setReportText("저희 OO고등학교 교사의 비리를 고발합니다.");
		report1.setFile1("");
		report1.setFile2("");
		report1.setFile3("");
		report1.setDate("2025-01-30 00:55:10");

		
		
		
		ReportList.add(report1);

		
	}
	
	
	public ArrayList<Report> getAllReport(){
		return ReportList;
		
		
	}
	
	public Report getDate(String date) {
		Report dates = null;
		
		for(int i=0;i<ReportList.size();i++) {
			Report report = ReportList.get(i);
			if(report != null &&report.getDate() !=null && report.getDate().equals(date)) {
				dates = report;
				break;
			}
		}
		return dates;
		//각자의 객체를 리턴
	}
	public void addReport(Report report) {
		ReportList.add(report);
	}
	
}
