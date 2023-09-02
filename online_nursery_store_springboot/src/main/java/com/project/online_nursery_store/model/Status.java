package com.project.online_nursery_store.model;

//import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "status")
@Entity(name = "status")

public class Status {

	private long status_id;
	private String status_name;
	
	
	
	public Status() {
		
	}

	public Status(long status_id, String status_name) {
		super();
		this.status_id = status_id;
		this.status_name = status_name;
	}


	@Override
	public String toString() {
		return "Status [status_id=" + status_id + ", status_name=" + status_name + "]";
	}


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getStatus_id() {
		return status_id;
	}


	public void setStatus_id(long status_id) {
		this.status_id = status_id;
	}


	public String getStatus_name() {
		return status_name;
	}


	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}
	
}
