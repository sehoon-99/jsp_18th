package dto;

import java.io.Serializable;

public class Report implements Serializable {

	private String PhoneNumber;
	
	private String title;
	
	private String ReportText;
	
	private String file1;
	
	private String file2;
	
	private String file3;
	
	private String date;
	
	public Report(String PhoneNumber ,String title) {
		this.PhoneNumber = PhoneNumber;
		this.title = title;
	}
	

	public Report() {}



	public String getPhoneNumber() {
		return PhoneNumber;
	}

	public String getTitle() {
		return title;
	}

	public String getReportText() {
		return ReportText;
	}

	public String getFile1() {
		return file1;
	}

	public String getFile2() {
		return file2;
	}

	public String getFile3() {
		return file3;
	}
	
	public String getDate() {
		return date;
	}


	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public void setReportText(String reportText) {
		ReportText = reportText;
	}


	public void setFile1(String file1) {
		this.file1 = file1;
	}


	public void setFile2(String file2) {
		this.file2 = file2;
	}


	public void setFile3(String file3) {
		this.file3 = file3;
	}


	public void setDate(String date) {
		this.date = date;
	}

	
	
}
