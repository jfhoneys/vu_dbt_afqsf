with aqb__alternateid__c as ( select * from {{ source('sfdc_aqb','aqb__alternateid__c') }}
), 
final 
as ( select  
 trim(id) as aqb__alternateid__c_id
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
,trim(aqb__accountreferenced__c) as aqb__accountreferenced__c
,trim(aqb__alternateid__c) as aqb__alternateid__c
,trim(aqb__contactreferenced__c) as aqb__contactreferenced__c
,trim(aqb__nonuniquealternateid__c) as aqb__nonuniquealternateid__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__type__c) as aqb__type__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__alternateid__c
) 
select * from final 
