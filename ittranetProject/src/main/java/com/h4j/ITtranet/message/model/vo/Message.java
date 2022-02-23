package com.h4j.ITtranet.message.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
@AllArgsConstructor
public class Message {
	
	private int sendMsgNo;
	
	private int receiveMsgNo;

	private int senderNo;
	private int receiverNo;
	
	private String msgContent;
	
	private String sendDate;
	private String readDate;
	
	private String status;
	
	
	

}