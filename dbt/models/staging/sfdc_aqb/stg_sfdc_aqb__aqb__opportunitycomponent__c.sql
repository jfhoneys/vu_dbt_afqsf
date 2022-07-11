with aqb__opportunitycomponent__c as ( select * from {{ source('sfdc_aqb','aqb__opportunitycomponent__c') }}
), 
final 
as ( select  
 trim(id) as aqb__opportunitycomponent__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__opportunity__c) as aqb__opportunity__c
,trim(aqb__account__c) as aqb__account__c
,aqb__amount__c as aqb__amount__c
,trim(aqb__description__c) as aqb__description__c
,trim(aqb__goalcategoryformula__c) as aqb__goalcategoryformula__c
,trim(aqb__goalcategory__c) as aqb__goalcategory__c
,trim(aqb__goalformula__c) as aqb__goalformula__c
,trim(aqb__goal__c) as aqb__goal__c
,trim(aqb__institutionalunit__c) as aqb__institutionalunit__c
,trim(aqb__proposeddesignation__c) as aqb__proposeddesignation__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqc_prospect_interest__c) as aqc_prospect_interest__c
,trim(vu_goal_category__c) as vu_goal_category__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__opportunitycomponent__c
) 
select * from final 
