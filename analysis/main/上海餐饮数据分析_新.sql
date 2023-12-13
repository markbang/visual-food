-- use db_dianping;

-- 求人均消费的中位数、平均数、各种评分的平均数
select 不同地区人均价格中位数_table.area as area, mid_人均, avg_价格, avg_口味, avg_环境, avg_服务, avg_星级 -- 这是选择连接后的总表的每一列（为了去除两个相同的area）
from -- 这里选择左表，即不同地区人均价格中位数表
	(select area, sum(价格)/count(*) as mid_人均 -- 满足排在中间的价格（见下方注释）之和除以个数（当排在中间的只有一个时就是自己除以1，当排在中间有两个时就是二者平均数）
	from -- 这里建立子查询一个价格的顺序数和逆序数表
		(select 价格, area,
						row_number() over(partition by area order by 价格 desc, id desc) as desc_价格, -- 这里输出逆序数
						row_number() over(partition by area order by 价格 asc, id asc) as asc_价格 -- 这里输出顺序数
		 from sh_rest) as 价格顺序和逆序_table
	where asc_价格 in (desc_价格, desc_价格 + 1, desc_价格 - 1) -- 条件是顺序数等于逆序数或者顺序数和逆序数差一，即刚好排在中间
	group by area) as 不同地区人均价格中位数_table 	
inner join -- 这里等值连接右表，即不同地区人均价格平均数，口味、环境、服务、星级平均数表
	(select area, avg(价格) as avg_价格, avg(口味_补缺) as avg_口味, avg(环境_补缺) as avg_环境, avg(服务_补缺) as avg_服务, avg(星级) as avg_星级
	 from sh_rest
	 group by area) as 不同地区人均价格平均数，口味、环境、服务、星级平均数_table -- 这里是分组然后聚合函数
on 不同地区人均价格中位数_table.area = 不同地区人均价格平均数，口味、环境、服务、星级平均数_table.area; -- 这里利用左右表的area相同作为连接条件

-- 不同经纬度的评分和人均价格
select  lng, lat, 价格 as 人均价格, 星级, 口味_补缺 as 口味, 环境_补缺 as 环境, 服务_补缺 as 服务
from sh_rest
where 价格 is not null 
	and 口味_补缺 is not null 
	and 环境_补缺 is not null
	and 服务_补缺 is not null
	and lng is not null
	and lat is not null;

