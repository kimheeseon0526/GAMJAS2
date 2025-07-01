package domain;

import org.apache.ibatis.type.Alias;

import domain.en.TicketStatusType;

@Alias("TicketHistory")
public class TicketHistory {

	private int logNo;
	private int memNo;
	private int missionNo;	//미션 번호
	private int rewardNo;	//보상 번호
	private int amount;	//변화량
	private TicketStatusType amountType;	//변화 타입 earn, use, cancle
	private String logDate;	//기록 시간
	
}
