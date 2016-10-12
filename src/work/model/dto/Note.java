package work.model.dto;

import java.io.Serializable;

/*
 CREATE TABLE NOTES(
N_NO number(10) primary key, -- ���� ��ȣ
N_SENDER varchar2(20) not null, -- ���� �۽���
N_RECEIVER varchar2(20) not null, -- ���� ������
N_TITLE varchar2(100) not null, -- ���� ����
N_CONTENT varchar2(200) not null, -- ���� ����
N_DATE varchar2(15) not null, -- ���� �����
N_STATUS varchar2(1) not null, -- ���� Ȯ�� ����(T:���� F:���� ����)
FOREIGN KEY(N_RECEIVER) REFERENCES STUDENTS(ID)
);
 */
public class Note implements Serializable{
	private int nNo;
	private String nSender;
	private String nReciever;
	private String nTitle;
	private String nContent;
	private String nDate;
	private String nStatus;
	
	public Note() { }
	
	public Note(int nNo, String nSender, String nReciever, String nTitle, String nContent, String nDate,
			String nStatus) {
		this.nNo = nNo;
		this.nSender = nSender;
		this.nReciever = nReciever;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nDate = nDate;
		this.nStatus = nStatus;
	}
	
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getnSender() {
		return nSender;
	}
	public void setnSender(String nSender) {
		this.nSender = nSender;
	}
	public String getnReciever() {
		return nReciever;
	}
	public void setnReciever(String nReciever) {
		this.nReciever = nReciever;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public String getnDate() {
		return nDate;
	}
	public void setnDate(String nDate) {
		this.nDate = nDate;
	}
	public String getnStatus() {
		return nStatus;
	}
	public void setnStatus(String nStatus) {
		this.nStatus = nStatus;
	}
}
