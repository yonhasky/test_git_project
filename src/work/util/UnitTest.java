package work.util;

import java.util.Date;
import java.util.Locale;

public class UnitTest {

	public static void main(String[] args) {
		//현재날짜 생성해서 출력
		Date date = new Date();
		System.out.println(date);
		
		//유틸리티 메서드 호출
		String date1 = Utility.getCurrentDate();
		System.out.println(date1);
		
		System.out.println(Utility.getCurrentDate("yyyy.MM.dd"));
		System.out.println(Utility.getCurrentDate("HH:mm"));
		System.out.println(Utility.getCurrentDate("a hh:mm"));
		System.out.println(Utility.getCurrentDate("a hh:mm", Locale.US));
		
		//숫자 데이터 천 단위마다 컴마 표기: 가독성
		int data1 = 123456789; //123,456,789=>문자열 
		String convertData1 = Utility.convertNumber(data1);
		System.out.println(data1 + ":" + convertData1);
		
		//통화 숫자 데이터  맨 앞에 화폐단위 표기하고, 천 단위마다 컴마 표기
		//메서드 명: convertCurrency()  기본화쳬단위 - 원
		String convertData11 = Utility.convertCurrency(data1, Locale.US);
		System.out.println(data1 + ":" + convertData11);
		
		//암호 정보출력
		//pass01->pa****
		//메서드명 convertSecureCode()
		
		String pass = "ddlll";
		System.out.println(Utility.convertSecureCode(pass));
	}
}
