package domain.dto;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Data
@Slf4j
public class PageDto {
	
		private Criteria cri;
		private long total;
		
		private int start;
		private int end;
		
		private boolean left;
		private boolean right;
		
		private boolean doubleLeft;
		private boolean doubleRight;
		
		private int realEnd;
		
		public PageDto(Criteria cri, long total) {
			this.cri = cri;
			this.total = total;
			
			end = (cri.getPage() + 9) / 10 * 10;
			start = end - 9;
			realEnd = (int)((total  + cri.getAmount() - 1) / cri.getAmount());
			
			if(end > realEnd) {
				end = realEnd;   // 만약 
			}
			
			
			left = start > 1; // start가 1인지 여부를 따지는
			right = end < realEnd; 
			
			doubleLeft = cri.getPage() > 1;
			doubleRight = cri.getPage() < realEnd;
		}
}
		
		
