package work.util;

import java.io.UnsupportedEncodingException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

public class Utility {
	// 숫자 4개 랜덤
	public static String getSecureCode() {

		return getSecureCode(4);
	}

	// 숫자 길이만큼 랜덤
	public static String getSecureCode(int length) {
		Random random = new Random();
		StringBuilder nos = new StringBuilder();
		for (int i = 0; i < length; i++) {
			nos.append(random.nextInt(10));

		}
		return nos.toString();
	}

	// 숫자2개 문자2개
	public static String getSecureCodeNumberAndAlphbet() {
		Random random = new Random();
		StringBuilder nos = new StringBuilder();
		for (int i = 0; i < 2; i++) {
			nos.append(random.nextInt(10));
		}
		for (int j = 0; j < 2; j++) {
			nos.append((char) (random.nextInt(26) + 65));
		}
		return nos.toString();
	}

	// 숫자2개 문자2개
	public static String getSecureCodeNumberAndAlphbet(int length) {
		Random random = new Random();
		StringBuilder nos = new StringBuilder();
		for (int i = 0; i < 2; i++) {
			nos.append(random.nextInt(10));
		}
		for (int j = 0; j < length; j++) {
			nos.append((char) (random.nextInt(26) + 65));
		}
		return nos.toString();
	}

	// 알파벳4자리
	public static String getSecureCodeAlphabet() {

		return getSecureCodeAlphabet(4);
	}

	// 알파벳 자리수 받아서 랜덤
	public static String getSecureCodeAlphabet(int length) {
		Random random = new Random();
		StringBuilder nos = new StringBuilder();

		for (int i = 0; i < length; i++) {
			nos.append((char) (random.nextInt(26) + 65));
		}
		return nos.toString();
	}

	public static String[] ascSort(String[] names) {
		for (int j = 0; j < names.length; j++) {
			String temp = null;
			for (int i = 0; i < names.length - 1; i++) {
				if (names[i].compareTo(names[i + 1]) > 0) {
					temp = names[i];
					names[i] = names[i + 1];
					names[i + 1] = temp;
				}
			}
		}
		return names;

	}

	public static String[] descSort(String[] names) {
		for (int j = 0; j < names.length; j++) {
			String temp = null;
			for (int i = 0; i < names.length - 1; i++) {
				if (names[i].compareTo(names[i + 1]) < 0) {
					temp = names[i];
					names[i] = names[i + 1];
					names[i + 1] = temp;
				}
			}
		}
		return names;
	}

	public static int[] ascSort(int[] nums) {
		for (int j = 0; j < nums.length; j++) {
			int temp = 0;
			for (int i = 0; i < nums.length - 1; i++) {
				if (nums[i] > (nums[i + 1])) {
					temp = nums[i];
					nums[i] = nums[i + 1];
					nums[i + 1] = temp;
				}
			}
		}
		return nums;
	}

	public static int[] descSort(int[] nums) {
		for (int j = 0; j < nums.length; j++) {
			int temp = 0;
			for (int i = 0; i < nums.length - 1; i++) {
				if (nums[i] <= (nums[i + 1])) {
					temp = nums[i];
					nums[i] = nums[i + 1];
					nums[i + 1] = temp;
				}
			}
		}
		return nums;
	}

	public static String getCurrentDate() {
		/*
		 * //날짜 형식(기본) : 년4 /월2/ 일2 String pattern = "yyyy-MM-dd";
		 * SimpleDateFormat sdf = new SimpleDateFormat(pattern); return
		 * sdf.format(new Date());
		 */

		return getCurrentDate("yyyy-MM-dd");
	}

	public static String getCurrentDate(String pattern) {
		// 날짜 형식(기본) : 년4 /월2/ 일2
		// String pattern = "yyyy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(new Date());

	}

	public static String getCurrentDate(String pattern, Locale locale) {
		/*
		 * //날짜 형식(기본) : 년4 /월2/ 일2 // String pattern = "yyyy-MM-dd";
		 * SimpleDateFormat sdf = new SimpleDateFormat(pattern, locale); return
		 * sdf.format(new Date());
		 */
		return new SimpleDateFormat(pattern, locale).format(new Date());

	}

	/**
	 * 숫자 데이터를 천 단위마다 컴마표가 반환
	 * 
	 * @see java.text.NumberFormat
	 * 
	 * @param data
	 * @return
	 */

	public static String convertNumber(long data) {
		/*
		 * NumberFormat numberFormat = NumberFormat.getInstance(); return
		 * numberFormat.format(data);
		 */

		return NumberFormat.getInstance().format(data);
	}

	public static String convertCurrency(long data, Locale locale) {
		NumberFormat.getInstance();
		return NumberFormat.getCurrencyInstance(locale).format(data);

	}

	// 암호에 *로 보안
	public static String convertSecureCode(String pass) {
		StringBuilder nos = new StringBuilder(pass.substring(0, 2));
		for (int i = 2; i < pass.length(); i++) {
			nos.append("*");

		}
		return nos.toString();
	}

	public static String convertSecureCode(String pass, int length) {
		StringBuilder nos = new StringBuilder(pass.substring(0, length));
		for (int i = length; i < pass.length(); i++) {
			nos.append("*");

		}
		return nos.toString();
	}

	/**
	 * 웹 어플리케이션의 get방식 한글 인코딩 변환 메서드
	 */
	public static String toKor(String data) {
		try {
			return new String(data.getBytes("8859_1"), "euc-kr");

		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage());
		}
		return data;

	}
}
