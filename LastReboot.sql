select '7 days',Count(sys.Name0),1 SortOrder
from v_R_System sys
left join v_GS_OPERATING_SYSTEM os on os.ResourceId = sys.ResourceId 
where os.LastBootUpTime0 < DATEADD(day,-7, GETDATE())
UNION
select '14 days',Count(sys.Name0),2
from v_R_System sys
left join v_GS_OPERATING_SYSTEM os on os.ResourceId = sys.ResourceId 
where os.LastBootUpTime0 < DATEADD(day,-14, GETDATE())
UNION
select '1 month',Count(sys.Name0),3
from v_R_System sys
left join v_GS_OPERATING_SYSTEM os on os.ResourceId = sys.ResourceId 
where os.LastBootUpTime0 < DATEADD(month,-1, GETDATE())
UNION
select '3 months',Count(sys.Name0),4
from v_R_System sys
left join v_GS_OPERATING_SYSTEM os on os.ResourceId = sys.ResourceId 
where os.LastBootUpTime0 < DATEADD(MONTH,-3, GETDATE())
UNION
select '6 months',Count(sys.Name0),5
from v_R_System sys
left join v_GS_OPERATING_SYSTEM os on os.ResourceId = sys.ResourceId 
where os.LastBootUpTime0 < DATEADD(MONTH,-6, GETDATE())
ORDER BY SortOrder