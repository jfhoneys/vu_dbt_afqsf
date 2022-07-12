with aqb__batchitemactivity__c as ( select * from {{ source('sfdc_aqb','aqb__batchitemactivity__c') }}
), 
final 
as ( select  
 trim(id) as aqb__batchitemactivity__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__batchitemid__c) as aqb__batchitemid__c
,aqb__accepted__c as aqb__accepted__c
,trim(aqb__account__c) as aqb__account__c
,trim(aqb__batchitemreferenceid__c) as aqb__batchitemreferenceid__c
,trim(aqb__comment__c) as aqb__comment__c
,aqb__datefulfilled__c as aqb__datefulfilled__c
,trim(aqb__item__c) as aqb__item__c
,trim(aqb__quidspecificationnbr__c) as aqb__quidspecificationnbr__c
,aqb__value__c as aqb__value__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqb__linktobatchitemtransaction__c) as aqb__linktobatchitemtransaction__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__batchitemactivity__c
) 
select * from final 
