package com.assignment.repository.service;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.assignment.models.Travel;

@Repository
public interface travelRepository  extends CrudRepository<Travel,Long>{
	List<Travel> findAll();

	
	
	
	
}
