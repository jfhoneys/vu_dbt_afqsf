with aqb__stewardshipplan__c as ( select * from {{ source('sfdc_aqb','aqb__stewardshipplan__c') }}
), 
final 
as ( select  
 trim(id) as aqb__stewardshipplan__c_id
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
,trim(aqb__applicablechartofaccountsitem__c) as aqb__applicablechartofaccountsitem__c
,trim(aqb__contact__c) as aqb__contact__c
,aqb__enddate__c as aqb__enddate__c
,trim(aqb__opportunity__c) as aqb__opportunity__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__startdate__c as aqb__startdate__c
,trim(aqb__strategy__c) as aqb__strategy__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__stewardshipplan__c
) 
select * from final 
