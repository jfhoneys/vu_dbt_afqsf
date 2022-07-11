with aqb__batchitemtribute__c as ( select * from {{ source('sfdc_aqb','aqb__batchitemtribute__c') }}
), 
final 
as ( select  
 trim(id) as aqb__batchitemtribute__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__batchitemid__c) as aqb__batchitemid__c
,aqb__amount__c as aqb__amount__c
,trim(aqb__batchitemreferenceid__c) as aqb__batchitemreferenceid__c
,trim(aqb__campaignfund__c) as aqb__campaignfund__c
,aqb__constituent__c as aqb__constituent__c
,trim(aqb__contact__c) as aqb__contact__c
,trim(aqb__description__c) as aqb__description__c
,trim(aqb__donoraccount__c) as aqb__donoraccount__c
,trim(aqb__honoreeaccount__c) as aqb__honoreeaccount__c
,trim(aqb__honoreename__c) as aqb__honoreename__c
,trim(aqb__type__c) as aqb__type__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__batchitemtribute__c
) 
select * from final 
