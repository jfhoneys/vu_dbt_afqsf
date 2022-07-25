with aqb__classnote__c as ( select * from {{ source('sfdc_aqb','aqb__classnote__c') }}
), 
final 
as ( select  
 trim(id) as aqb__classnote__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__contactauthor__c) as aqb__contactauthor__c
,trim(aqb__contactid__c) as aqb__contactid__c
,trim(aqb__note__c) as aqb__note__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__type__c) as aqb__type__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__classnote__c
) 
select * from final 
