with aqb__inventory__c as ( select * from {{ source('sfdc_aqb','aqb__inventory__c') }}
), 
final 
as ( select  
 trim(id) as aqb__inventory__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,aqb__acquisitioncost__c as aqb__acquisitioncost__c
,trim(aqb__divisionunit__c) as aqb__divisionunit__c
,aqb__fairmarketvalue__c as aqb__fairmarketvalue__c
,aqb__lowinventorywarning__c as aqb__lowinventorywarning__c
,aqb__numberonhand__c as aqb__numberonhand__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__salescost__c as aqb__salescost__c
,trim(aqb__type__c) as aqb__type__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqc_account_string__c) as aqc_account_string__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__inventory__c
) 
select * from final 
