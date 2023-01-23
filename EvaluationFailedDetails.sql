select
NetBiosName as 'Computer Name',
EvalTime,
case when Result = 1 then 'Not Yet Evaluated'
when Result = 2 then 'Not Applicable'
when Result = 3 then 'Evaluation Failed'
when Result = 4 then 'Evaluated Remediated Failed'
when Result = 5 then 'Not Evaluated Dependency Failed'
when Result = 6 then 'Evaluated Remediated Succeeded'
when Result = 7 then 'Evaluation Succeeded'
end as 'Evaluation Result',
HealthCheckDescription,
ResultDetail,
ResultCode,
ResultType
from v_CH_EvalResults
where Result < 6
Order by EvalTime Desc