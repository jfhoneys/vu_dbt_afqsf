with aqb__names__c as ( select * from {{ source('sfdc_aqb','aqb__names__c') }}
), 
final 
as ( select  
 trim(id) as aqb__names__c_id
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
,trim(aqb__comments__c) as aqb__comments__c
,trim(aqb__contactid__c) as aqb__contactid__c
,trim(aqb__firstname__c) as aqb__firstname__c
,trim(aqb__fullname__c) as aqb__fullname__c
,trim(aqb__greetingoverride__c) as aqb__greetingoverride__c
,trim(aqb__greeting__c) as aqb__greeting__c
,trim(aqb__lastname__c) as aqb__lastname__c
,trim(aqb__middlename__c) as aqb__middlename__c
,trim(aqb__namegroupingoverride__c) as aqb__namegroupingoverride__c
,trim(aqb__namegrouping__c) as aqb__namegrouping__c
,trim(aqb__nameoverride__c) as aqb__nameoverride__c
,trim(aqb__nametype__c) as aqb__nametype__c
,trim(aqb__name__c) as aqb__name__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__salutationlookupoverride__c) as aqb__salutationlookupoverride__c
,trim(aqb__salutationlookup__c) as aqb__salutationlookup__c
,trim(aqb__salutation__c) as aqb__salutation__c
,trim(aqb__source__c) as aqb__source__c
,trim(aqb__suffix__c) as aqb__suffix__c
,trim(aqb__title__c) as aqb__title__c
,trim(aqb__type__c) as aqb__type__c
,aqb__useasalternatename__c as aqb__useasalternatename__c
,aqb__useascommunityname__c as aqb__useascommunityname__c
,aqb__useasformalname__c as aqb__useasformalname__c
,aqb__useaspreferredname__c as aqb__useaspreferredname__c
,trim(aqb__uses__c) as aqb__uses__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__names__c
) 
select * from final 
