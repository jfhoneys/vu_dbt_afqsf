with aqb__batchitemautomatedsoftcredit__c as ( select * from {{ source('sfdc_aqb','aqb__batchitemautomatedsoftcredit__c') }}
), 
final 
as ( select  
 trim(id) as aqb__batchitemautomatedsoftcredit__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__batchitem__c) as aqb__batchitem__c
,trim(aqb__account__c) as aqb__account__c
,aqb__anonymous__c as aqb__anonymous__c
,aqb__giftsareanonymous__c as aqb__giftsareanonymous__c
,trim(aqb__linkindicator__c) as aqb__linkindicator__c
,trim(aqb__linktopledge__c) as aqb__linktopledge__c
,aqb__verified__c as aqb__verified__c
,aqb__numberofpayments__c as aqb__numberofpayments__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqb__linktobatchitemtransaction__c) as aqb__linktobatchitemtransaction__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__batchitemautomatedsoftcredit__c
) 
select * from final 
