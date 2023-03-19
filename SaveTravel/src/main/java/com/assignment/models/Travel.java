package com.assignment.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="travels")
public class Travel {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min=1, max=255, message="Expense must not be null")
	private String expenseName;
	
	@NotNull
	@Size(min=1, max=255, message="Vendor must not be null")
	private String Vendor;
	
	@Min(1)
	@Max(1000000)
	private Double  Amount;
	
	@NotNull
	@Size(min=1, max=255, message="Description must not be null")
	private String Description;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dddd")
	private Date createdAt;
	 
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dddd")
	private Date updatedAt;
	
	public Travel() {}
	
	public Travel(String expenseName, String Vendor, Double Amount,  String Description) {
		this.expenseName = expenseName;
		this.Vendor = Vendor;
		this.Amount = Amount;
		this.Description=Description;
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getExpenseName() {
		return expenseName;
	}

	public void setExpenseName(String expenseName) {
		this.expenseName = expenseName;
	}

	public String getVendor() {
		return Vendor;
	}

	public void setVendor(String vendor) {
		Vendor = vendor;
	}

	public Double getAmount() {
		return Amount;
	}

	public void setAmount(Double amount) {
		Amount = amount;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	@PrePersist
	protected void onCreatedAt() {
		this.createdAt = new Date();
	}
	
	@PreUpdate
	protected void onUpdatedAt() {
		this.updatedAt = new Date();
	}
	
	
}
