package com.hybrid.model.busapi2;

import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class BusRouteListJaxbTest2 {
	
	public static void main(String[] args){
		
		
		
		try {
			
			JAXBContext ctx = JAXBContext.newInstance(ServiceResult_.class) ;

			Unmarshaller unmarshaller = ctx.createUnmarshaller() ;
			
			String str = "http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?strSrch=6628&serviceKey=s8HvbWYxtg7rY%2FNlvj4%2F6feKJu66XO%2BLNI3zC%2B7KEUdV0R1Iu2%2B33bKui8OAE%2BV6uJXTKtb9Hcnp94LSG4fajA%3D%3D" ; 
			URL url = new URL(str) ;
	
			ServiceResult_ result = (ServiceResult_) unmarshaller.unmarshal(url) ;
			
			System.out.println("Size = " + result.getMsgBody().getItemList().size() );
			
			
			Marshaller marshaller = ctx.createMarshaller() ;
			marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

			marshaller.marshal(result, System.out);
			
			
			
		} catch (JAXBException e) {
			
			e.printStackTrace();
		
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
