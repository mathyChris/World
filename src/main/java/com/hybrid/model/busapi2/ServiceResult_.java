package com.hybrid.model.busapi2;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement(name="ServiceResult")
@XmlType(propOrder={"msgHeader" , "msgBody"}) //xml 이 출력될 때, 순서가 뒤바뀌는데 원래대로 의  순서에 따라 출력되도록 함. msgHeader 먼저...
public class ServiceResult_ {

	MsgHeader msgHeader;
	MsgBody_ msgBody;

	public MsgHeader getMsgHeader() {
		return msgHeader;
	}

	public void setMsgHeader(MsgHeader msgHeader) {
		this.msgHeader = msgHeader;
	}

	public MsgBody_ getMsgBody() {
		return msgBody;
	}

	public void setMsgBody(MsgBody_ msgBody) {
		this.msgBody = msgBody;
	}
	
	
	
}
