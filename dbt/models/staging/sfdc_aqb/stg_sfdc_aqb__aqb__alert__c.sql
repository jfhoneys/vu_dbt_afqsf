with aqb__alert__c as ( select * from {{ source('sfdc_aqb','aqb__alert__c') }}
), 
final 
as ( select  
 trim(id) as aqb__alert__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__account__c) as aqb__account__c
,aqb__activeflag__c as aqb__activeflag__c
,trim(aqb__alerttext__c) as aqb__alerttext__c
,trim(aqb__color__c) as aqb__color__c
,trim(aqb__contact__c) as aqb__contact__c
,aqb__enddate__c as aqb__enddate__c
,trim(aqb__opportunity__c) as aqb__opportunity__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__startdate__c as aqb__startdate__c
,aqb__withaccount__c as aqb__withaccount__c
,aqb__withcontacts__c as aqb__withcontacts__c
,aqb__withopportunities__c as aqb__withopportunities__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqb__engagementscorecategory__c) as aqb__engagementscorecategory__c
,aqb__engagementscoreoverride__c as aqb__engagementscoreoverride__c
,aqb__engagementscore__c as aqb__engagementscore__c
,trim(aqb__chartofaccount__c) as aqb__chartofaccount__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__alert__c
) 
select * from final 
