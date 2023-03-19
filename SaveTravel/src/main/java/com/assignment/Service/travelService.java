package com.assignment.Service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.assignment.models.Travel;
import com.assignment.repository.service.travelRepository;

@Service
public class travelService {
	
	private final travelRepository travelRepo;
	
	
	public travelService(travelRepository travelRepo) {
		 this.travelRepo = travelRepo;
	}
	
	public List<Travel> findAllTravel() {
		return this.travelRepo.findAll();
	}
	
	public Travel createTravel(Travel travel) {
		return this.travelRepo.save(travel);
	}
	
	public Travel editTravel(Travel travel) {
		return this.travelRepo.save(travel);
	}
	
	public Travel optTravel(Long id) {
		Optional<Travel> optTravels = travelRepo.findById(id);
		if (optTravels.isPresent()) {
			return optTravels.get();
			
		}
		
		return null;
	}
	
	public void deleteTravel(Long id) {
		this.travelRepo.deleteById(id);
	}
}
