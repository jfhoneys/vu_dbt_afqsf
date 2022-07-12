with aqb__llstudentinteresttype__c as ( select * from {{ source('sfdc_aqb','aqb__llstudentinteresttype__c') }}
), 
final 
as ( select  
 trim(id) as aqb__llstudentinteresttype__c_id
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
,aqb__athleticgroup__c as aqb__athleticgroup__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,vud_online_community_use__c as vud_online_community_use__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__llstudentinteresttype__c
) 
select * from final 
