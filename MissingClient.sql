select Count(sys.Name0) 
from v_R_System sys
left join v_ActiveClients act on sys.ResourceID = act.MachineResourceID
where Client_Version is NULL
Group By act.Client_Version