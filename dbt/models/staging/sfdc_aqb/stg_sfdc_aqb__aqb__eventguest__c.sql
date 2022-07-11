with aqb__eventguest__c as ( select * from {{ source('sfdc_aqb','aqb__eventguest__c') }}
), 
final 
as ( select  
 trim(id) as aqb__eventguest__c_id
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__event_registration__c) as aqb__event_registration__c
,trim(aqb__attendance__c) as aqb__attendance__c
,aqb__attended_event__c as aqb__attended_event__c
,trim(aqb__comment__c) as aqb__comment__c
,trim(aqb__contact__c) as aqb__contact__c
,aqb__eventenddate__c as aqb__eventenddate__c
,trim(aqb__eventguestexternalid__c) as aqb__eventguestexternalid__c
,aqb__eventstartdateandtime__c as aqb__eventstartdateandtime__c
,aqb__eventstopdateandtime__c as aqb__eventstopdateandtime__c
,trim(aqb__eventvenue__c) as aqb__eventvenue__c
,aqb__event_date__c as aqb__event_date__c
,trim(aqb__event_location__c) as aqb__event_location__c
,trim(aqb__event__c) as aqb__event__c
,trim(aqb__guestfirstname__c) as aqb__guestfirstname__c
,trim(aqb__guestfullname__c) as aqb__guestfullname__c
,trim(aqb__guestlastname__c) as aqb__guestlastname__c
,trim(aqb__guesttitle__c) as aqb__guesttitle__c
,trim(aqb__lead__c) as aqb__lead__c
,trim(aqb__registeredby__c) as aqb__registeredby__c
,trim(aqb__suffix__c) as aqb__suffix__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(vu_guest_type__c) as vu_guest_type__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__eventguest__c
) 
select * from final 
