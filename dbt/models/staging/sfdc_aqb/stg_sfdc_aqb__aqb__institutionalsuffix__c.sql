with aqb__institutionalsuffix__c as ( select * from {{ source('sfdc_aqb','aqb__institutionalsuffix__c') }}
), 
final 
as ( select  
 trim(id) as aqb__institutionalsuffix__c_id
,isdeleted as isdeleted
,trim(name) as name
,trim(setupownerid) as setupownerid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__setting__c) as aqb__setting__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__institutionalsuffix__c
) 
select * from final 
