with aqb__namedefinitionsaccounts__c as ( select * from {{ source('sfdc_aqb','aqb__namedefinitionsaccounts__c') }}
), 
final 
as ( select  
 trim(id) as aqb__namedefinitionsaccounts__c_id
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
,trim(aqb__enclosenickname__c) as aqb__enclosenickname__c
,trim(aqb__institutionalsuffixdelimiter__c) as aqb__institutionalsuffixdelimiter__c
,aqb__lastnamefirst__c as aqb__lastnamefirst__c
,trim(aqb__listadditionalcontacts__c) as aqb__listadditionalcontacts__c
,trim(aqb__mailingnametwolines__c) as aqb__mailingnametwolines__c
,trim(aqb__notes__c) as aqb__notes__c
,aqb__omitdeceased__c as aqb__omitdeceased__c
,aqb__omitdonotcontact__c as aqb__omitdonotcontact__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__primarycontactfirst__c as aqb__primarycontactfirst__c
,trim(aqb__usefirst__c) as aqb__usefirst__c
,aqb__useforaccountname__c as aqb__useforaccountname__c
,aqb__usehonorfornameorder__c as aqb__usehonorfornameorder__c
,trim(aqb__useinstitutional__c) as aqb__useinstitutional__c
,aqb__uselastonce__c as aqb__uselastonce__c
,trim(aqb__uselast__c) as aqb__uselast__c
,aqb__usemalefirstonly__c as aqb__usemalefirstonly__c
,aqb__usemalemiddleonly__c as aqb__usemalemiddleonly__c
,trim(aqb__usemiddle__c) as aqb__usemiddle__c
,trim(aqb__usenickname__c) as aqb__usenickname__c
,trim(aqb__usesalutation__c) as aqb__usesalutation__c
,trim(aqb__usesuffix__c) as aqb__usesuffix__c
,aqb__useforaccountgreeting__c as aqb__useforaccountgreeting__c
,aqb__useforalternatename__c as aqb__useforalternatename__c
,aqb__useformailingname__c as aqb__useformailingname__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__namedefinitionsaccounts__c
) 
select * from final 
