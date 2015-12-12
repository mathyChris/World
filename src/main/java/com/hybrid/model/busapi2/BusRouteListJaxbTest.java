package com.hybrid.model.busapi2;

import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class BusRouteListJaxbTest {

	public static void main(String[] args) {
		
//		JAXB (Java Architecture  And XML Binding) / Architecture == object 
		
		try {
			
			JAXBContext ctx = JAXBContext.newInstance(ServiceResult_.class) ;
			
			ServiceResult_ result = new ServiceResult_() ; 
			MsgHeader msgHeader = new MsgHeader(); 
			
			msgHeader.setHeaderCd("100");
			msgHeader.setHeaderMsg("Normal result ... ");
			msgHeader.setItemCount(999);
			
			result.setMsgHeader(msgHeader);
			
			/*
			 * Marshal
			 * */
			Marshaller marshaller = ctx.createMarshaller() ; 
			
			marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
			
			marshaller.marshal(result, System.out);
			
//			---------------------------------------------------------------------
			
			/*
			 * UnMarshaller
			 * */
			
			Unmarshaller unmarshaller = ctx.createUnmarshaller() ;
			
		
			
//			String strSrch = "6628"; 
//			String serviceKey = "s8HvbWYxtg7rY%2FNlvj4%2F6feKJu66XO%2BLNI3zC%2B7KEUdV0R1Iu2%2B33bKui8OAE%2BV6uJXTKtb9Hcnp94LSG4fajA%3D%3D" ; 
//			String str = "http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?strSrch={strSrch}&serviceKey={serviceKey}"; // 개발 가이드 / 요청 주소 
			
			String str = "http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?strSrch=6628&serviceKey=s8HvbWYxtg7rY%2FNlvj4%2F6feKJu66XO%2BLNI3zC%2B7KEUdV0R1Iu2%2B33bKui8OAE%2BV6uJXTKtb9Hcnp94LSG4fajA%3D%3D"; // 개발 가이드 / 요청 주소 
			
			
			
			URL url = new URL(str); 
			
			
			ServiceResult_ busResult = (ServiceResult_) unmarshaller.unmarshal(url); 
			
			
			marshaller.marshal(busResult, System.out);
			
			
		} catch (JAXBException e) {

			e.printStackTrace();
		
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

	}

}
