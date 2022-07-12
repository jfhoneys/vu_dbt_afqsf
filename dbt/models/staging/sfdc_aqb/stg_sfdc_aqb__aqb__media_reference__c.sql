with aqb__media_reference__c as ( select * from {{ source('sfdc_aqb','aqb__media_reference__c') }}
), 
final 
as ( select  
 trim(id) as aqb__media_reference__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__account__c) as aqb__account__c
,trim(aqb__contact__c) as aqb__contact__c
,aqb__date__c as aqb__date__c
,trim(aqb__description__c) as aqb__description__c
,trim(aqb__issue__c) as aqb__issue__c
,trim(aqb__media_type__c) as aqb__media_type__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__page__c) as aqb__page__c
,trim(aqb__reference_name__c) as aqb__reference_name__c
,trim(aqb__source__c) as aqb__source__c
,trim(aqb__text_of_reference__c) as aqb__text_of_reference__c
,trim(aqb__url__c) as aqb__url__c
,trim(aqb__volume__c) as aqb__volume__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__media_reference__c
) 
select * from final 
