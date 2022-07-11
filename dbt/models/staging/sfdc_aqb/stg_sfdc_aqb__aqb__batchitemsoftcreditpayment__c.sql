with aqb__batchitemsoftcreditpayment__c as ( select * from {{ source('sfdc_aqb','aqb__batchitemsoftcreditpayment__c') }}
), 
final 
as ( select  
 trim(id) as aqb__batchitemsoftcreditpayment__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__batchitemsoftcredit__c) as aqb__batchitemsoftcredit__c
,trim(aqb__account__c) as aqb__account__c
,aqb__amount__c as aqb__amount__c
,aqb__anonymous__c as aqb__anonymous__c
,aqb__giftsareanonymous__c as aqb__giftsareanonymous__c
,trim(aqb__linktotransaction__c) as aqb__linktotransaction__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__batchitemsoftcreditpayment__c
) 
select * from final 
