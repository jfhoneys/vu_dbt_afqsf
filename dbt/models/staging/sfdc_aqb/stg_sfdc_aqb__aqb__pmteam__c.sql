with aqb__pmteam__c as ( select * from {{ source('sfdc_aqb','aqb__pmteam__c') }}
), 
final 
as ( select  
 trim(id) as aqb__pmteam__c_id
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
,aqb__active__c as aqb__active__c
,aqb__enddate__c as aqb__enddate__c
,aqb__giftcredit__c as aqb__giftcredit__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__role__c) as aqb__role__c
,aqb__startdate__c as aqb__startdate__c
,trim(aqb__user__c) as aqb__user__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__pmteam__c
) 
select * from final 
