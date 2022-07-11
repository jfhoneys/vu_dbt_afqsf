with aqb__tribute__c as ( select * from {{ source('sfdc_aqb','aqb__tribute__c') }}
), 
final 
as ( select  
 trim(id) as aqb__tribute__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,aqb__amount__c as aqb__amount__c
,trim(aqb__campaignfund__c) as aqb__campaignfund__c
,trim(aqb__contactid__c) as aqb__contactid__c
,aqb__date__c as aqb__date__c
,trim(aqb__description__c) as aqb__description__c
,trim(aqb__detail__c) as aqb__detail__c
,trim(aqb__donoraccount__c) as aqb__donoraccount__c
,trim(aqb__honoreeaccount__c) as aqb__honoreeaccount__c
,trim(aqb__honoreename__c) as aqb__honoreename__c
,trim(aqb__originatinggift__c) as aqb__originatinggift__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__type__c) as aqb__type__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__tribute__c
) 
select * from final 
