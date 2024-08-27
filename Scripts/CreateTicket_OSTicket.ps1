# Purpose
#   - Simply create a ticket in osTicket System, script can be modified as necessary to needs and serves as a starting point

# osTicket URL to Tickets.json...
#  - Example: https://_HOSTNAME_/osticket/upload/api/http.php/tickets.json"
$osTicketURL = "URL_HERE"

# Replaces X-API-Key Value with API Key obtained in osTicket. 
$headers = @{
    'X-API-Key' = 'XXXXXXXXXXXXXXXXXX'
    'token' = 'TokenValue'
}


# Adjust body as necessary. Find topicId within osTicket.
$body = @{
	'autorespond' = 'false'
    '"alert'= 'false'
	'source' = "API"
    'topicId' = "XX"
    'name' = '_NAME_'
	'email' = '_email@microsoft.com_'
	'subject' = '_Issue_Summary_'
	'message' = 'Set ticket detials here.'

}

$JsonBody = $Body | ConvertTo-Json

Invoke-RestMethod -Uri $osTicketURL -Method Post -Headers $headers -Body $JsonBody

