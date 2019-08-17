package cn.web.pack.service;

import java.util.List;

import cn.web.pack.object.Shuttle;

public interface ShuttleService {

	/**
	 * o ��ʾ���ж���
	 * 
	 * @return
	 */
	List<Shuttle> getShuttles();

	/**
	 * o ����ֵ��ʾ����
	 * 
	 * @param startvalue
	 * @param stopvalue
	 * @return
	 */
	List<Shuttle> getList(int startvalue, int stopvalue);

}
