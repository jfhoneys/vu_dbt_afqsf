with aqb__llinteresttype__c as ( select * from {{ source('sfdc_aqb','aqb__llinteresttype__c') }}
), 
final 
as ( select  
 trim(id) as aqb__llinteresttype__c_id
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
,trim(aqb__comments__c) as aqb__comments__c
,trim(aqb__interestgroup__c) as aqb__interestgroup__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__llinteresttype__c
) 
select * from final 
