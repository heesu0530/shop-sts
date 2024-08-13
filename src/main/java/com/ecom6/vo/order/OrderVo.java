package com.ecom6.vo.order;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class OrderVo {
	private int rn;
	private int o_no;
	private int price;
	private int quantity;
	private int stock;
	private int state;
	private int amount;
	private String ordernumber;
	private String o_regdate;
	private String mem_id;//외래키
    private String mem_name;
    private String mem_role;
    private String image;
	private int p_no;//외래키
	private String p_name;
	private int start;
	private int end;
	private String apiUrl;
}
