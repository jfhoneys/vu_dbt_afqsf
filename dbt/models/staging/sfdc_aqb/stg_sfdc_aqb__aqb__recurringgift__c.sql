with aqb__recurringgift__c as ( select * from {{ source('sfdc_aqb','aqb__recurringgift__c') }}
), 
final 
as ( select  
 trim(id) as aqb__recurringgift__c_id
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
,aqb__amount__c as aqb__amount__c
,trim(aqb__campaigntext__c) as aqb__campaigntext__c
,trim(aqb__campaign__c) as aqb__campaign__c
,trim(aqb__comments__c) as aqb__comments__c
,aqb__datecommitted__c as aqb__datecommitted__c
,aqb__dateended__c as aqb__dateended__c
,aqb__datestarted__c as aqb__datestarted__c
,trim(aqb__designation__c) as aqb__designation__c
,trim(aqb__externalreferencenumber__c) as aqb__externalreferencenumber__c
,trim(aqb__frequency__c) as aqb__frequency__c
,trim(aqb__fundraisingcampaigntext__c) as aqb__fundraisingcampaigntext__c
,trim(aqb__fundraisingcampaign__c) as aqb__fundraisingcampaign__c
,trim(aqb__method__c) as aqb__method__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__pledgelink__c) as aqb__pledgelink__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqb__type__c) as aqb__type__c
,aqb__periodicamount__c as aqb__periodicamount__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__recurringgift__c
) 
select * from final 
