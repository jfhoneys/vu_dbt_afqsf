with aqb__namedefinitionscontacts__c as ( select * from {{ source('sfdc_aqb','aqb__namedefinitionscontacts__c') }}
), 
final 
as ( select  
 trim(id) as aqb__namedefinitionscontacts__c_id
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
,trim(aqb__enclosemaidenname__c) as aqb__enclosemaidenname__c
,trim(aqb__enclosenickname__c) as aqb__enclosenickname__c
,trim(aqb__greetingsalutation__c) as aqb__greetingsalutation__c
,trim(aqb__notes__c) as aqb__notes__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__usefirst__c) as aqb__usefirst__c
,aqb__useforthealternatename__c as aqb__useforthealternatename__c
,aqb__useforthecommunityname__c as aqb__useforthecommunityname__c
,aqb__useforthedefaultaddresssalutation__c as aqb__useforthedefaultaddresssalutation__c
,aqb__useforthedefaultgreetingsalutation__c as aqb__useforthedefaultgreetingsalutation__c
,aqb__usefortheformalname__c as aqb__usefortheformalname__c
,aqb__useforthepreferredname__c as aqb__useforthepreferredname__c
,trim(aqb__useinstitutionalsuffix__c) as aqb__useinstitutionalsuffix__c
,trim(aqb__uselast__c) as aqb__uselast__c
,trim(aqb__usemaiden__c) as aqb__usemaiden__c
,trim(aqb__usemiddle__c) as aqb__usemiddle__c
,trim(aqb__usenickname__c) as aqb__usenickname__c
,trim(aqb__usesalutation__c) as aqb__usesalutation__c
,trim(aqb__usesuffix__c) as aqb__usesuffix__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__namedefinitionscontacts__c
) 
select * from final 
