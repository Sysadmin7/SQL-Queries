SELECT v_ActiveClients.Client_Version AS 'Version', Count(v_ActiveClients.Client_Version) AS 'Count'
FROM v_ActiveClients v_ActiveClients
GROUP BY v_ActiveClients.Client_Version
ORDER BY v_ActiveClients.Client_Version DESC