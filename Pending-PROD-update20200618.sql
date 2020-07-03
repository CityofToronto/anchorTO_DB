/*
select * from linear_name_evw
where name_part like '%Morley Callaghan Footbridge%'
 or name_part like '%Prince Edward Viaduct%'
 order by 1
 */
select * from linear_name_evw
where name_part like '%Grandstand Ent%'
 or name_part like '%Highland Creek Overpass%' 
 or name_part like '%Lrtc Li%' 
 or name_part like '%Ontario Place Bridge%' 
 order by 1
 
 
 select distinct usage_status from linear_name