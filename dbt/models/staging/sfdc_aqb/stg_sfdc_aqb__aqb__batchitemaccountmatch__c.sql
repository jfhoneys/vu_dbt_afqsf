with aqb__batchitemaccountmatch__c as ( select * from {{ source('sfdc_aqb','aqb__batchitemaccountmatch__c') }}
), 
final 
as ( select  
 trim(id) as aqb__batchitemaccountmatch__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__batchitem__c) as aqb__batchitem__c
,trim(aqb__account__c) as aqb__account__c
,trim(aqb__details__c) as aqb__details__c
,aqb__matchconfidence__c as aqb__matchconfidence__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__batchitemaccountmatch__c
) 
select * from final 
