package com.project.online_nursery_store.model;

import javax.persistence.CascadeType;
//import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Table(name = "orders")
@Entity(name = "orders")

public class Order {

	private long order_id;
	private String order_user_id;
	private String order_total;
	private String order_status;
	private String order_date;
	private String order_tracking_id;
	private String order_delivery_id;
	
	public Order() {
		
	}

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getOrder_id() {
		return order_id;
	}

	public String getOrder_user_id() {
		return order_user_id;
	}

	public void setOrder_user_id(String order_user_id) {
		this.order_user_id = order_user_id;
	}

	public String getOrder_total() {
		return order_total;
	}

	public void setOrder_total(String order_total) {
		this.order_total = order_total;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getOrder_tracking_id() {
		return order_tracking_id;
	}

	public void setOrder_tracking_id(String order_tracking_id) {
		this.order_tracking_id = order_tracking_id;
	}

	public String getOrder_delivery_id() {
		return order_delivery_id;
	}

	public void setOrder_delivery_id(String order_delivery_id) {
		this.order_delivery_id = order_delivery_id;
	}

	public void setOrder_id(long order_id) {
		this.order_id = order_id;
	}

	public Order(long order_id, String order_user_id, String order_total, String order_status, String order_date,
			String order_tracking_id, String order_delivery_id) {
		super();
		this.order_id = order_id;
		this.order_user_id = order_user_id;
		this.order_total = order_total;
		this.order_status = order_status;
		this.order_date = order_date;
		this.order_tracking_id = order_tracking_id;
		this.order_delivery_id = order_delivery_id;
	}

	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", order_user_id=" + order_user_id + ", order_total=" + order_total
				+ ", order_status=" + order_status + ", order_date=" + order_date + ", order_tracking_id="
				+ order_tracking_id + ", order_delivery_id=" + order_delivery_id + "]";
	}

	
}
