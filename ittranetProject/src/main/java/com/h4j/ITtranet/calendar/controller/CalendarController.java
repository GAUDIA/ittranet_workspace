package com.h4j.ITtranet.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.h4j.ITtranet.calendar.model.service.CalendarService;

@Controller
public class CalendarController {

	/*
	@Autowired
	private CalendarService cService;
	*/
	
	@RequestMapping("viewCalendar.ca")
	public String viewCalendar() {
		return "calendar/calendar";
	}
	
	
	
	
}