select 
sys.Name0 as 'Computer Name',
sys.User_Name0 as 'User Name',
summ.ClientStateDescription,
case when summ.ClientActiveStatus = 0 then 'Inactive'
	when summ.ClientActiveStatus = 1 then 'Active'
	end as 'ClientActiveStatus',
summ.LastActiveTime,
case when summ.IsActiveDDR = 0 then 'Inactive'
	when summ.IsActiveDDR = 1 then 'Active'
	end as 'IsActiveDDR',
case when summ.IsActiveHW = 0 then 'Inactive'
	when summ.IsActiveHW = 1 then 'Active'
	end as 'IsActiveHW',
case when summ.IsActiveSW = 0 then 'Inactive'
	when summ.IsActiveSW = 1 then 'Active'
	end as 'IsActiveSW',
case when summ.ISActivePolicyRequest = 0 then 'Inactive'
	when summ.ISActivePolicyRequest = 1 then 'Active'
	end as 'ISActivePolicyRequest',
case when summ.IsActiveStatusMessages = 0 then 'Inactive'
	when summ.IsActiveStatusMessages = 1 then 'Active'
	end as 'IsActiveStatusMessages',
summ.LastOnline,
summ.LastDDR,
summ.LastHW,
summ.LastSW,
summ.LastPolicyRequest,
summ.LastStatusMessage,
summ.LastHealthEvaluation,
case when LastHealthEvaluationResult = 1 then 'Not Yet Evaluated'
	when LastHealthEvaluationResult = 2 then 'Not Applicable'
	when LastHealthEvaluationResult = 3 then 'Evaluation Failed'
	when LastHealthEvaluationResult = 4 then 'Evaluated Remediated Failed'
	when LastHealthEvaluationResult = 5 then 'Not Evaluated Dependency Failed'
	when LastHealthEvaluationResult = 6 then 'Evaluated Remediated Succeeded'
	when LastHealthEvaluationResult = 7 then 'Evaluation Succeeded'
	end as 'Last Health Evaluation Result',
case when LastEvaluationHealthy = 1 then 'Pass'
	when LastEvaluationHealthy = 2 then 'Fail'
	when LastEvaluationHealthy = 3 then 'Unknown'
	end as 'Last Evaluation Healthy',
case when summ.ClientRemediationSuccess = 1 then 'Pass'
	when summ.ClientRemediationSuccess = 2 then 'Fail'
	else ''
	end as 'ClientRemediationSuccess',
summ.ExpectedNextPolicyRequest
from v_CH_ClientSummary summ
inner join v_R_System sys on summ.ResourceID = sys.ResourceID
where summ.IsActivePolicyRequest = 0
order by summ.LastPolicyRequest Desc