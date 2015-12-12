package com.hybrid.model.busapi2;

import java.net.URLDecoder;

import org.springframework.web.client.RestTemplate;

public class BusRouteListTest {
	
	public static void main(String[] args){
		
//		URL을 사용하여 경로를 주고 data 받음. 
		
		RestTemplate rest = new RestTemplate() ;
		
		String url = "http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?strSrch={strSrch}&serviceKey={serviceKey}"; // 개발 가이드 / 요청 주소 
		// 노선 번호 , 서비스 키 정보만 있으면 된다. ?strSrch={strSrch}&serviceKey={serviceKey} 을 추가
		
		String strSrch = "6628"; 
		String serviceKey = URLDecoder.decode("s8HvbWYxtg7rY%2FNlvj4%2F6feKJu66XO%2BLNI3zC%2B7KEUdV0R1Iu2%2B33bKui8OAE%2BV6uJXTKtb9Hcnp94LSG4fajA%3D%3D") ; 
		// serviceKey 는 기본적으로 encoding 이 되어 있다.RestTemplate 는 기본으로 encoding 을 하기 때문에 decoding 을 해줘야 한다. 
		// 따라서 URLDecode를 사용 
		
		
//		String result = rest.getForObject(url, String.class, strSrch, serviceKey) ; 
		ServiceResult_ result = rest.getForObject(url, ServiceResult_.class, strSrch, serviceKey) ; 
	
		//1. jsxb 에서 인식할 수 있는 객체 타입이 아니기 때문에 Error 발생 ==> @xmlrootelement를 ServiceResult class 추가하여 Jaxb가 인삭하게 함.  
		
		System.out.println(result.getMsgHeader().getHeaderCd()); 
		System.out.println(result.getMsgHeader().getHeaderMsg()); 
		System.out.println(result.getMsgHeader().getItemCount()); 
		

		
//		String busRouteId ; 
//		String busRouteNm ; 
//		String corpNm ; 
//		String edStationNm ; 
//		String firstBusTm ; 
//		String firstLowTm ; 
//		String lastBusTm ; 
//		String lastBusYn ; 
//		String lastLowTm ; 
//		String length ; 
//		String routeType ; 
//		String stStationNm ; 
//		String term ;
		
		
		int size = result.getMsgBody().getItemList().size() ; 
	
		for(int index = 0 ; index < size ; index++){
			
		System.out.println("======================");	
		
		System.out.println("busRouteId = " + result.getMsgBody().getItemList().get(index).getBusRouteId());
		System.out.println("busRouteNm = " + result.getMsgBody().getItemList().get(index).getBusRouteNm());
		System.out.println("corpNm = " + result.getMsgBody().getItemList().get(index).getCorpNm());
		System.out.println("edStationNm = " + result.getMsgBody().getItemList().get(index).getEdStationNm());
		System.out.println("firstBusTm = " + result.getMsgBody().getItemList().get(index).getFirstBusTm());
		System.out.println("firstLowTm = " + result.getMsgBody().getItemList().get(index).getFirstLowTm());
		System.out.println("lastBusTm = " + result.getMsgBody().getItemList().get(index).getLastBusTm());
		System.out.println("lastBusYn = " + result.getMsgBody().getItemList().get(index).getLastBusYn());
		System.out.println("lastLowTm = " + result.getMsgBody().getItemList().get(index).getLastLowTm());
		System.out.println("length = " + result.getMsgBody().getItemList().get(index).getLength());
		System.out.println("routeType = " + result.getMsgBody().getItemList().get(index).getRouteType());
		System.out.println("stStationNm = " + result.getMsgBody().getItemList().get(index).getStStationNm());
		System.out.println("term = " + result.getMsgBody().getItemList().get(index).getTerm());
		
		}
		
		System.out.println("======================");
		
//		System.out.println(result.getMsgBody().getItemList().size());
//		System.out.println(result.getMsgBody().getItemList().get(0).getBusRouteId());
		

		
		
	}

}





