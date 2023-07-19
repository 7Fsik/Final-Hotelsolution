package com.hotelsolution.fire.workout.controller;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@RequestMapping("workout")
public class WorkOutController {

	@GetMapping("attendance")
	public void attendance() {
		
	}
	
}
