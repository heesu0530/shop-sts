package com.ecom6.service.pay;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

public interface ApiService {
	Map<String,String> JsonApi(String url, HashMap<String, String> apiMap);
	String getSHA256Hash(String input) throws NoSuchAlgorithmException;
}
