with aqb__llpostalcodes__c as ( select * from {{ source('sfdc_aqb','aqb__llpostalcodes__c') }}
), 
final 
as ( select  
 trim(id) as aqb__llpostalcodes__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,trim(aqb__district__c) as aqb__district__c
,trim(aqb__institutionalarea1__c) as aqb__institutionalarea1__c
,trim(aqb__institutionalarea2__c) as aqb__institutionalarea2__c
,trim(aqb__institutionalarea3__c) as aqb__institutionalarea3__c
,trim(aqb__institutionalarea4__c) as aqb__institutionalarea4__c
,trim(aqb__region__c) as aqb__region__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__llpostalcodes__c
) 
select * from final 
