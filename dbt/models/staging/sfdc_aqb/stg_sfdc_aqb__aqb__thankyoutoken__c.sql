with aqb__thankyoutoken__c as ( select * from {{ source('sfdc_aqb','aqb__thankyoutoken__c') }}
), 
final 
as ( select  
 trim(id) as aqb__thankyoutoken__c_id
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
,trim(aqb__comment__c) as aqb__comment__c
,trim(aqb__department_unit__c) as aqb__department_unit__c
,trim(aqb__event__c) as aqb__event__c
,trim(aqb__fundraisingcampaign__c) as aqb__fundraisingcampaign__c
,trim(aqb__item__c) as aqb__item__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__presentationdate__c as aqb__presentationdate__c
,trim(aqb__rational_for_gift__c) as aqb__rational_for_gift__c
,trim(aqb__recipientcontact__c) as aqb__recipientcontact__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__thankyoutoken__c
) 
select * from final 
