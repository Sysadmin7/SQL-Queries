select cdr.Name,
cdr.CP_Status as 'Status' ,
cp.InitialRequestDate as 'Initial Attempt Date' ,
cdr.CP_LatestProcessingAttempt as 'Most Recent Attempt Date',
cp.NumProcessAttempts as 'Number of Attempts',
cdr.DeviceOS,
cdr.CP_LastInstallationError  as 'Last Installation Error Code'
from v_CombinedDeviceResources cdr
inner join v_CP_Machine cp on cdr.MachineID = cp.MachineID
where 
cdr.IsClient = 0
and cdr.DeviceOS like '%Windows%'
order by cdr.Name