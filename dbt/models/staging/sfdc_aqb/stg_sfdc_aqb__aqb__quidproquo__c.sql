with aqb__quidproquo__c as ( select * from {{ source('sfdc_aqb','aqb__quidproquo__c') }}
), 
final 
as ( select  
 trim(id) as aqb__quidproquo__c_id
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__giftlink__c) as aqb__giftlink__c
,aqb__accepted__c as aqb__accepted__c
,trim(aqb__account__c) as aqb__account__c
,trim(aqb__comment__c) as aqb__comment__c
,aqb__datefullfilled__c as aqb__datefullfilled__c
,trim(aqb__item__c) as aqb__item__c
,trim(aqb__quidspecificationnumber__c) as aqb__quidspecificationnumber__c
,aqb__value__c as aqb__value__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__quidproquo__c
) 
select * from final 
