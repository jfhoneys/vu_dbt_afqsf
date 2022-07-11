with aqb__matchpotential1__c as ( select * from {{ source('sfdc_aqb','aqb__matchpotential1__c') }}
), 
final 
as ( select  
 trim(id) as aqb__matchpotential1__c_id
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__gift__c) as aqb__gift__c
,aqb__amount__c as aqb__amount__c
,trim(aqb__campaignfund__c) as aqb__campaignfund__c
,trim(aqb__designation__c) as aqb__designation__c
,trim(aqb__donoraccount__c) as aqb__donoraccount__c
,trim(aqb__matchingaccount__c) as aqb__matchingaccount__c
,trim(aqb__matching_account_dtd_id__c) as aqb__matching_account_dtd_id__c
,trim(aqb__matching_account_id__c) as aqb__matching_account_id__c
,trim(aqb__matching_account_name__c) as aqb__matching_account_name__c
,aqb__potentialamount__c as aqb__potentialamount__c
,aqb__potential_employer_match_amount__c as aqb__potential_employer_match_amount__c
,aqb__matchmultiple1__c as aqb__matchmultiple1__c
,aqb__totalperemployee1__c as aqb__totalperemployee1__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqb__matchingaccounthepid__c) as aqb__matchingaccounthepid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__matchpotential1__c
) 
select * from final 
