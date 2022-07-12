with aqb__financial_asset__c as ( select * from {{ source('sfdc_aqb','aqb__financial_asset__c') }}
), 
final 
as ( select  
 trim(id) as aqb__financial_asset__c_id
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
,trim(aqb__comment__c) as aqb__comment__c
,trim(aqb__contact__c) as aqb__contact__c
,aqb__dateofacquisition__c as aqb__dateofacquisition__c
,aqb__dateofdisposition__c as aqb__dateofdisposition__c
,aqb__dateofvaluation__c as aqb__dateofvaluation__c
,trim(aqb__description__c) as aqb__description__c
,trim(aqb__lastverifiedby__c) as aqb__lastverifiedby__c
,aqb__lastverifiedon__c as aqb__lastverifiedon__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__source__c) as aqb__source__c
,aqb__value__c as aqb__value__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__financial_asset__c
) 
select * from final 
