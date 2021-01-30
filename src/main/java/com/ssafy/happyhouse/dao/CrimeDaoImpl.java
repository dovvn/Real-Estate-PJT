package com.ssafy.happyhouse.dao;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.dto.CrimeDto;

@Repository
public class CrimeDaoImpl {
	
	static int dist;
	static int minCrime_rate;
	static int maxCrime_rate;

	public List<CrimeDto> getCrimeList() {
		//파일 읽기
		ClassPathResource resource = new ClassPathResource("data/crimereport_seoul.txt");
		List<CrimeDto> crimeList = new ArrayList<>(); //엑셀의 구 순서대로
		try {
		    Path path = Paths.get(resource.getURI());
		    List<String> lines = Files.readAllLines(path);
		    minCrime_rate = Integer.MAX_VALUE; //가장 낮은 범죄율
		    maxCrime_rate = 0; //가장 높은 범죄율
		    
		    //한줄씩 범죄율 리스트 만듦
		    for(int i=1; i<lines.size(); i++) {
		    	String[] datas = lines.get(i).split("	");
		    	CrimeDto dto = new CrimeDto(datas[1], Integer.parseInt(datas[4].trim()) ,Integer.parseInt(datas[5].trim()), Integer.parseInt(datas[6].trim()),
		    			Integer.parseInt(datas[7].trim()), Integer.parseInt(datas[8].trim()), Integer.parseInt(datas[9].trim()));
		    	crimeList.add(dto);
		    	minCrime_rate = Math.min(minCrime_rate, Integer.parseInt(datas[4].trim()));
		    	maxCrime_rate = Math.max(maxCrime_rate, Integer.parseInt(datas[4].trim()));
		    }
		    
		    dist = (maxCrime_rate - minCrime_rate) / 5;
		    
		    for(int i=0; i<crimeList.size(); i++) {
		    	CrimeDto dto = crimeList.get(i); 
		    	int crime_rate = dto.getCrime_rate();
		    	dto.setSafety_level(getSafetyLevel(crime_rate));
		    }
		    
		    
		} catch (IOException e) {
		    System.err.printf("{}", e.getMessage(), e);
		}
		return crimeList;
	}

	private int getSafetyLevel(int crime_rate) {
		int level = 0;
		
		if(crime_rate >= minCrime_rate) level = 1;
		if(crime_rate >= minCrime_rate + dist) level = 2;
		if(crime_rate >= minCrime_rate + dist * 2) level = 3;
		if(crime_rate >= minCrime_rate + dist * 3) level = 4;
		if(crime_rate >= minCrime_rate + dist * 4) level = 5;
		
		return level;
	}
}
