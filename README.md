# power.betfair

Power.betfair is a PowerShell module which allows you to automate betting and account operations via the Betfair API. This module leverages JSON-RPC calls to the Betfair API, making it more lightweight compared to JSON-REST.
More information on the Betfair API can be found here: <a href="https://betfair-developer-docs.atlassian.net/wiki/spaces/1smk3cen4v3lu3yomq5qye0ni/overview?mode=global">Betfair API Guide 📖</a>

## Overview
This module contains the following functions:
### Account Operations:
Connect-BetFairAccount     
Get-BetfairAccountDetails     
Get-BetfairAccountFunds       
Get-BetfairAccountStatement   
Get-BetfairAppKey             
New-BetfairAppKey             

### Betting Operations
Get-BetfairClearedOrder       
Get-BetfairCompetition        
Get-BetfairCountry            
Get-BetfairCurrentOrder       
Get-BetfairEvent              
Get-BetfairEventType          
Get-BetfairMarketBook         
Get-BetfairMarketCatalogue    
Get-BetfairMarketProfitAndLoss  
Get-BetfairMarketType         
Get-BetfairRunnerBook         
Get-BetfairTimeRange  
New-BetfairOrder  
Edit-BetfairOrder   
Remove-BetfairOrder

## Examples
You will first need to authenticate to the Betfair exchange. This will require you to have an App Key prior. To receive an app key with access to real-time data you may need to reach out to Betfair support.

Connect-BetFairAccount -Username "john.snow@got.com" -Password $secureString -APIKey $apiKey

Get-BetfairEventType -eventTypeId 7
