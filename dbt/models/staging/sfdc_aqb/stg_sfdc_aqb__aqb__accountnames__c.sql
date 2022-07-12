with aqb__accountnames__c as ( select * from {{ source('sfdc_aqb','aqb__accountnames__c') }}
), 
final 
as ( select  
 trim(id) as aqb__accountnames__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__accountid__c) as aqb__accountid__c
,trim(aqb__comments__c) as aqb__comments__c
,trim(aqb__nametype__c) as aqb__nametype__c
,trim(aqb__name__c) as aqb__name__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__type__c) as aqb__type__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__accountnames__c
) 
select * from final 
