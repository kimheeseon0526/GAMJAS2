package domain.dto;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;

import domain.en.RecommendContentType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
@NoArgsConstructor
@AllArgsConstructor
public class Criteria {
	private int page = 1;
	private int amount = 10;
	private int cno = 1;
	private String type = ""; //TCI
	private String keyword = "";
	
	public int getOffset() {
		int offset = amount * (page - 1);
		return offset;
		
	}
	
	public String[] getTypes() {
		String[] arr = null;
		if(type != null && !type.equals("")) { 
			arr = type.split("");
		}
		return arr;
	}

	public static Criteria init(HttpServletRequest req) {
		Criteria cri = new Criteria();
		try {
			cri.cno = Integer.parseInt(req.getParameter("cno"));
			cri.page = Integer.parseInt(req.getParameter("page"));
			cri.amount= Integer.parseInt(req.getParameter("amount"));
			cri.type = req.getParameter("type");
			cri.keyword = URLDecoder.decode(req.getParameter("keyword"), "utf-8");
		}
		catch (Exception e) {}
		return cri;
	}
	
	public String getQs() {  //문자열 반환하는 메서드
		String[] strs = {"cno=" + cno, "amount=" + amount, "type=" + type, "keyword=" + keyword};
		String str = String.join("&", strs); 
		return str;
	}
	
	public String getQsRecom() {
		String[] strs = {"amount=" + amount, "type=" + type, "keyword=" + keyword};
		String str = String.join("&", strs); 
		return str;
	}
	
	
	public String getQs2() {  //게시글 상세보기, 작성, 수정, 삭제 할 때 사용할거임
		return getQs() + "&page=" + page;
	}
	
	public String getQsRecom2(RecommendContentType recom) { 
		return getQsRecom() + "&page=" + page;
	}

	public Criteria(int page, int amount, String type, String keyword) {
		this.page = page;
		this.amount = amount;
		this.type = type;
		this.keyword = keyword;
	}
	
	

}
