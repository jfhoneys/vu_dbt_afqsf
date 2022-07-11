with aqb__financials__c as ( select * from {{ source('sfdc_aqb','aqb__financials__c') }}
), 
final 
as ( select  
 trim(id) as aqb__financials__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,aqb__approvedspendingpercent__c as aqb__approvedspendingpercent__c
,aqb__associatedfees__c as aqb__associatedfees__c
,trim(aqb__comment__c) as aqb__comment__c
,aqb__corpusamount__c as aqb__corpusamount__c
,aqb__dateevaluated__c as aqb__dateevaluated__c
,aqb__datevaluesupdated__c as aqb__datevaluesupdated__c
,aqb__growthamount__c as aqb__growthamount__c
,aqb__growthpercentage__c as aqb__growthpercentage__c
,trim(aqb__llchartofaccountsid__c) as aqb__llchartofaccountsid__c
,aqb__marketvalue__c as aqb__marketvalue__c
,trim(aqb__numbersarefinal__c) as aqb__numbersarefinal__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__financials__c
) 
select * from final 
