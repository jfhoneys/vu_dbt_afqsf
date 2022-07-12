with aqb__rating__c as ( select * from {{ source('sfdc_aqb','aqb__rating__c') }}
), 
final 
as ( select  
 trim(id) as aqb__rating__c_id
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
,trim(aqb__account__c) as aqb__account__c
,aqb__active__c as aqb__active__c
,aqb__amount__c as aqb__amount__c
,trim(aqb__capacity__c) as aqb__capacity__c
,trim(aqb__comments__c) as aqb__comments__c
,aqb__dateofreview__c as aqb__dateofreview__c
,trim(aqb__fundraisingcampaign__c) as aqb__fundraisingcampaign__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__prospectstatus__c) as aqb__prospectstatus__c
,trim(aqb__readiness__c) as aqb__readiness__c
,trim(aqb__reviewedby__c) as aqb__reviewedby__c
,trim(aqb__source__c) as aqb__source__c
,aqb__validending__c as aqb__validending__c
,aqb__validstarting__c as aqb__validstarting__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__rating__c
) 
select * from final 
