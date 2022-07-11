with aqb__accolade__c as ( select * from {{ source('sfdc_aqb','aqb__accolade__c') }}
), 
final 
as ( select  
 trim(id) as aqb__accolade__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__accolade_name__c) as aqb__accolade_name__c
,trim(aqb__associatedevent__c) as aqb__associatedevent__c
,trim(aqb__contact__c) as aqb__contact__c
,aqb__dateawarded__c as aqb__dateawarded__c
,trim(aqb__description__c) as aqb__description__c
,trim(aqb__granting_entity__c) as aqb__granting_entity__c
,trim(aqb__granting_unit__c) as aqb__granting_unit__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__urlreference__c) as aqb__urlreference__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__accolade__c
) 
select * from final 
