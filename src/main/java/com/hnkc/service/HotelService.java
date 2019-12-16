package com.hnkc.service;

import java.util.List;
import java.util.Map;

import com.hnkc.pojo.Hotel;

public interface HotelService {
	List<Hotel> list(Map<String, String> paramMap);
	void add(Hotel hotel);
	void delete(int id);
	void update(Hotel hotel);
	Hotel get(int id);
}
