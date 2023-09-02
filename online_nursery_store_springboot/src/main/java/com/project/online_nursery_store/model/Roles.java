package com.project.online_nursery_store.model;

//import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Table(name = "roles")
@Entity(name = "roles")

public class Roles {

	private long roles_id;
	private String roles_name;

	
	public Roles() {
		
	}

	public Roles(long roles_id, String roles_name) {
		super();
		this.roles_id = roles_id;
		this.roles_name = roles_name;
	}


	@Override
	public String toString() {
		return "Roles [roles_id=" + roles_id + ", roles_name=" + roles_name + "]";
	}


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public long getRoles_id() {
		return roles_id;
	}


	public void setRoles_id(long roles_id) {
		this.roles_id = roles_id;
	}


	public String getRoles_name() {
		return roles_name;
	}


	public void setRoles_name(String roles_name) {
		this.roles_name = roles_name;
	}
	
}
