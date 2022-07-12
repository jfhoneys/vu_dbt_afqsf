with aqb__interest__c as ( select * from {{ source('sfdc_aqb','aqb__interest__c') }}
), 
final 
as ( select  
 trim(id) as aqb__interest__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__comment__c) as aqb__comment__c
,trim(aqb__contactid__c) as aqb__contactid__c
,trim(aqb__interestgroup__c) as aqb__interestgroup__c
,trim(aqb__llinteresttype__c) as aqb__llinteresttype__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__position__c) as aqb__position__c
,trim(aqb__source__c) as aqb__source__c
,trim(aqb__startday__c) as aqb__startday__c
,trim(aqb__startmonth__c) as aqb__startmonth__c
,trim(aqb__startyear__c) as aqb__startyear__c
,trim(aqb__stopdate__c) as aqb__stopdate__c
,trim(aqb__stopmonth__c) as aqb__stopmonth__c
,trim(aqb__stopyear__c) as aqb__stopyear__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(institutional_unit__c) as institutional_unit__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__interest__c
) 
select * from final 
