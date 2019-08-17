
-- 查询plane
select *
from plane

select plane_id 'id',plane_name 'name',plane_type 'type' from plane

-- 添加plane信息
insert into plane (plane_id,plane_name,plane_type) values (default,'中国国航CA1557','全新空客 A350-900')

-- 查询airport
select *
from airport

select airport_id 'id',airport_name 'name',airport_address 'address' from airport

-- 添加airport信息
insert into airport (airport_id,airport_name,airport_address) values (default,'南苑机场','北京')

-- 查询shuttle信息
select* 
from shuttle

-- 添加shuttle信息
insert into shuttle (shuttle_id,plane_id,startairport_id,stopairport_id,time,price) values (default,5,3,1,180,1200)

-- 详细查询
select 
				s.shuttle_id 'id',
				p.plane_id,p.plane_name,plane_type,
				a.airport_id 'air_start_id',a.airport_name 'air_start_name',a.airport_address 'air_start_address',
				i.airport_id 'air_stop_id',i.airport_name 'air_stop_name',i.airport_address 'air_stop_address',
				s.time,
				s.price
from 
			plane p,airport a,
			airport i,
			shuttle s
where 
			p.plane_id=s.plane_id and
			s.startairport_id=a.airport_id and
			s.stopairport_id=i.airport_id

select 
				s.shuttle_id 'id',
				p.plane_id,p.plane_name,plane_type,
				a.airport_id 'air_start_id',a.airport_name 'air_start_name',a.airport_address 'air_start_address',
				i.airport_id 'air_stop_id',i.airport_name 'air_stop_name',i.airport_address 'air_stop_address',
				s.time 'time',
				s.price 'price'
		from 
			plane p,airport a,
			airport i,
			shuttle s
		where 
			p.plane_id=s.plane_id and
			s.startairport_id=a.airport_id and
			s.stopairport_id=i.airport_id
			
select 
		s.shuttle_id 'id',
				p.plane_id,p.plane_name,plane_type,
				a.airport_id 'air_start_id',a.airport_name 'air_start_name',a.airport_address 'air_start_address',
				i.airport_id 'air_stop_id',i.airport_name 'air_stop_name',i.airport_address 'air_stop_address',
				s.time 'time',
				s.price 'price'
from 
		shuttle s 
		join plane p on s.plane_id=p.plane_id
		join airport a on s.startairport_id=a.airport_id
		join airport i on s.stopairport_id=i.airport_id


select
			s.shuttle_id as id,
			s.time as time,
			s.price as price,
			p.plane_id as pid,
			p.plane_name as pname,
			p.plane_type as ptype
from
			shuttle s join plane p on s.plane_id=p.plane_id
			
select 
			*
		from 
			shuttle s
			join plane p on s.plane_id=p.plane_id
			join airport a on s.startairport_id=a.airport_id
			join airport i on s.stopairport_id=i.airport_id






























