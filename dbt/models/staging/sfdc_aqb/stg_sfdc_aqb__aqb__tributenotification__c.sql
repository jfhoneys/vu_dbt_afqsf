with aqb__tributenotification__c as ( select * from {{ source('sfdc_aqb','aqb__tributenotification__c') }}
), 
final 
as ( select  
 trim(id) as aqb__tributenotification__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__addressline1__c) as aqb__addressline1__c
,trim(aqb__addressline2__c) as aqb__addressline2__c
,trim(aqb__addressline3__c) as aqb__addressline3__c
,trim(aqb__city__c) as aqb__city__c
,trim(aqb__contact__c) as aqb__contact__c
,trim(aqb__country__c) as aqb__country__c
,trim(aqb__fullname__c) as aqb__fullname__c
,trim(aqb__greeting__c) as aqb__greeting__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__stateprovince__c) as aqb__stateprovince__c
,trim(aqb__tribute__c) as aqb__tribute__c
,trim(aqb__zippostalcode__c) as aqb__zippostalcode__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__tributenotification__c
) 
select * from final 
