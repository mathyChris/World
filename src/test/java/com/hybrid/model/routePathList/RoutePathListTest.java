package com.hybrid.model.routePathList;

import java.net.URLDecoder;

import org.springframework.web.client.RestTemplate;

import com.hybrid.model.busapi2.ServiceResult_;

public class RoutePathListTest {

	public static void main(String[] args) {

		RestTemplate rest = new RestTemplate(); // RestTemplate 는 고급 함수(메서드)
		
		String url = "http://ws.bus.go.kr/api/rest/busRouteInfo/getRoutePath?busRouteId={busRouteId}&serviceKey={serviceKey}"; 
			String busRouteId = "100100305"; 
			String serviceKey = URLDecoder.decode("s8HvbWYxtg7rY%2FNlvj4%2F6feKJu66XO%2BLNI3zC%2B7KEUdV0R1Iu2%2B33bKui8OAE%2BV6uJXTKtb9Hcnp94LSG4fajA%3D%3D"); 
		
		ServiceResult service = rest.getForObject(url, ServiceResult.class, busRouteId, serviceKey) ;
		
	
//		String gpsX ;  
//		String gpsY ; 
//		String no ; 
//		String posX ; 
//		String posY ;
		
		int size = service.getMsgBody().getItemList().size() ;
		
		System.out.println(size);
		
		for(int i = 0 ; i < size ; i++){
			
			System.out.println(" gpsX = " + service.getMsgBody().getItemList().get(i).getGpsX());
			System.out.println(" gpsY = " + service.getMsgBody().getItemList().get(i).getGpsY());
			System.out.println(" no = " + service.getMsgBody().getItemList().get(i).getNo());
			System.out.println(" posX = " + service.getMsgBody().getItemList().get(i).getPosX());
			System.out.println(" posY = " + service.getMsgBody().getItemList().get(i).getPosY());
			
		}
		
		
	}

}







