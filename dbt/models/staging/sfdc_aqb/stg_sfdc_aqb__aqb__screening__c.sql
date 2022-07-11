with aqb__screening__c as ( select * from {{ source('sfdc_aqb','aqb__screening__c') }}
), 
final 
as ( select  
 trim(id) as aqb__screening__c_id
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
,trim(aqb__fundraisingcampaign__c) as aqb__fundraisingcampaign__c
,aqb__opinionamount__c as aqb__opinionamount__c
,aqb__opiniondate__c as aqb__opiniondate__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__rating__c) as aqb__rating__c
,trim(aqb__screenedaccount__c) as aqb__screenedaccount__c
,trim(aqb__screenedcontact__c) as aqb__screenedcontact__c
,trim(aqb__screener__c) as aqb__screener__c
,trim(aqb__session__c) as aqb__session__c
,trim(aqb__userscreener__c) as aqb__userscreener__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(vu_event__c) as vu_event__c
,trim(vu_notes__c) as vu_notes__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__screening__c
) 
select * from final 
