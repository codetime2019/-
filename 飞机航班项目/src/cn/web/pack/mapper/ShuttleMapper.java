package cn.web.pack.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.web.pack.object.Shuttle;

public interface ShuttleMapper {

	List<Shuttle> all();

	List<Shuttle> list(@Param("startaddress") String startaddress, @Param("stopaddress") String stopaddress);
}
