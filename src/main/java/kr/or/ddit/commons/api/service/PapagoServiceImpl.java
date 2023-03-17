package kr.or.ddit.commons.api.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.stereotype.Service;

import kr.or.ddit.commons.api.vo.PapagoVO;

@Service
public class PapagoServiceImpl implements PapagoService {

	@Override
	public String Papago() {
		
		String test = "";
		return test;
	}

	@Override
	public String koGetChinese(PapagoVO vo) {
		String targetLocale = "zh-CN";
		String target = "ko";
		String korean = vo.getKorean();
		
		String papagoApi = papagoApi(korean, targetLocale, target);
		return papagoApi;
	}

	@Override
	public String koGetEnglish(PapagoVO vo) {
		String targetLocale = "en";
		String target = "ko";
		String korean = vo.getKorean();
		String papagoApi = papagoApi(korean, targetLocale, target);
		return papagoApi;
	}

	@Override
	public String koGetJapanes(PapagoVO vo) {
		String targetLocale = "ja";
		String target = "ko";
		String korean = vo.getKorean();
		String papagoApi = papagoApi(korean, targetLocale, target);
		return papagoApi;
	}
	
	@Override
	public String enGetChinese(PapagoVO vo) {
		String targetLocale = "zh-CN";
		String target = "en";
		String english = vo.getEnglish();
		
		String papagoApi = papagoApi(english, targetLocale, target);
		return papagoApi;
	}
	
	@Override
	public String enGetKorea(PapagoVO vo) {
		String targetLocale = "ko";
		String target = "en";
		String english = vo.getEnglish();
		String papagoApi = papagoApi(english, targetLocale, target);
		return papagoApi;
	}
	
	@Override
	public String enGetJapanes(PapagoVO vo) {
		String targetLocale = "ja";
		String target = "en";
		String english = vo.getEnglish();
		String papagoApi = papagoApi(english, targetLocale, target);
		return papagoApi;
	}
	
	
	public String papagoApi(String vo,String locale1,String locale2) {
//		String english = vo.getEnglish();
		String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
		String text;
		String result = "";
		String line = "";
		String clientId = "cvj1ctgQfL1_QlcTLelW";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "sKTVjHvSk2";//애플리케이션 클라이언트 시크릿값";
		try {
			String param = "source="+locale2+"&target="+locale1+"&text=" + vo;
			URL url = new URL(apiURL);
			HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setUseCaches(false);
			con.setDefaultUseCaches(false);

			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream());
			osw.write(param);
			osw.flush();

			int responseCode = con.getResponseCode();
			result += "responseCode  : " + responseCode;
			result += "\n";
            // 200코드가 아니면 오류인데 무엇이 오류 인지 디버깅 
			if (responseCode != 200) {
				Map<String, List<String>> map = con.getRequestProperties();
				result += "Printing Response Header...\n";
				for (Map.Entry<String, List<String>> entry : map.entrySet()) {
					if (entry.getKey().equals("apikey")) {
						result += "";
					} else {
						result += "Key : " + entry.getKey() + " ,Value : " + entry.getValue();
					}
				}
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            // 여긴 출력 
			while ((line = br.readLine()) != null) {
				result += line + "\n";
			}
			br.close();

		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("인코딩 실패", e);
		} catch (IOException e) {
			result = e.getMessage();
		}
		return result;
	}


	

}
