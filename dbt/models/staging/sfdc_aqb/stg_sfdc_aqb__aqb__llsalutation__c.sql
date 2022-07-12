with aqb__llsalutation__c as ( select * from {{ source('sfdc_aqb','aqb__llsalutation__c') }}
), 
final 
as ( select  
 trim(id) as aqb__llsalutation__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,trim(aqb__addresssalutation__c) as aqb__addresssalutation__c
,trim(aqb__greetingsalutation__c) as aqb__greetingsalutation__c
,aqb__honormilitarysalutation__c as aqb__honormilitarysalutation__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__llsalutation__c
) 
select * from final 
