package cn.web.pack.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import cn.web.pack.object.Plane;

public interface PlaneMapper {

	/**
	 * o ��ѯ�ɻ���Ϣ
	 * 
	 * @return
	 */
	@Select("select plane_id 'id',plane_name 'name',plane_type 'type' from plane")
	List<Plane> all();

	/**
	 * o ���ݱ�Ų�ѯ��Ϣ
	 * 
	 * @param id
	 * @return
	 */
	@Select("select plane_id 'id',plane_name 'name',plane_type 'type' from plane where plane_id=#{0}")
	Plane getPlane(int id);
}
