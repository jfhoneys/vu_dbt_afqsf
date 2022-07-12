with aqb__usergoal__c as ( select * from {{ source('sfdc_aqb','aqb__usergoal__c') }}
), 
final 
as ( select  
 trim(id) as aqb__usergoal__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,trim(aqb__classification__c) as aqb__classification__c
,aqb__goalcount__c as aqb__goalcount__c
,aqb__goalcurrencyamount__c as aqb__goalcurrencyamount__c
,trim(aqb__goal__c) as aqb__goal__c
,trim(aqb__interval__c) as aqb__interval__c
,aqb__lastgoalintervaldate__c as aqb__lastgoalintervaldate__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__resultcount__c as aqb__resultcount__c
,aqb__resultcurrencyamount__c as aqb__resultcurrencyamount__c
,aqb__resultdate__c as aqb__resultdate__c
,trim(aqb__user__c) as aqb__user__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__usergoal__c
) 
select * from final 
