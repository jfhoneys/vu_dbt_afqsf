with aqb__ll_accoladename__c as ( select * from {{ source('sfdc_aqb','aqb__ll_accoladename__c') }}
), 
final 
as ( select  
 trim(id) as aqb__ll_accoladename__c_id
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
,trim(aqb__accoladecategory__c) as aqb__accoladecategory__c
,trim(aqb__accolade_type__c) as aqb__accolade_type__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__ll_accoladename__c
) 
select * from final 
