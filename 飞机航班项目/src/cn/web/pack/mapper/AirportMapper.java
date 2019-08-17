package cn.web.pack.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.web.pack.object.Airport;

public interface AirportMapper {

	@Select("select airport_id 'id',airport_name 'name',airport_address 'address' from airport")
	List<Airport> all();

	@Select("select airport_id 'id',airport_name 'name',airport_address 'address' from airport where airport_id=#{id}")
	Airport getAirport(@Param("id") int id);
}
