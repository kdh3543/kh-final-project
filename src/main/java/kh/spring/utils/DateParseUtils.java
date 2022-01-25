package kh.spring.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class DateParseUtils {

	public static String parseDate(Timestamp write_date) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
//		long parse_date = sdf.format(write_date);

		long currTime = System.currentTimeMillis();
		long regTime = write_date.getTime();
		long diffTime = (currTime - regTime) / 1000 / 60; // 1분 기준

		if (diffTime < 60) {
			return diffTime + "분 전";
		} else if (diffTime >= 60 && diffTime < 3600) {
			return diffTime / 60 + "시간 전";
		} else if (diffTime >= 3600 && diffTime < 86400) {
			return diffTime / 60 / 24 + "일 전";
		} else {
			return sdf.format(write_date);
		}
	}
}
