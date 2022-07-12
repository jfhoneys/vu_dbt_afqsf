with aqb__registration__c as ( select * from {{ source('sfdc_aqb','aqb__registration__c') }}
), 
final 
as ( select  
 trim(id) as aqb__registration__c_id
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,trim(aqb__event__c) as aqb__event__c
,trim(aqb__campaign__c) as aqb__campaign__c
,trim(aqb__chartofaccounts__c) as aqb__chartofaccounts__c
,trim(aqb__comment__c) as aqb__comment__c
,trim(aqb__contact__c) as aqb__contact__c
,aqb__date_of_registration__c as aqb__date_of_registration__c
,aqb__eventdate__c as aqb__eventdate__c
,aqb__eventenddate__c as aqb__eventenddate__c
,trim(aqb__eventlocality__c) as aqb__eventlocality__c
,aqb__eventstartdateandtime__c as aqb__eventstartdateandtime__c
,aqb__eventstopdateandtime__c as aqb__eventstopdateandtime__c
,trim(aqb__event_venue__c) as aqb__event_venue__c
,trim(aqb__lead__c) as aqb__lead__c
,trim(aqb__registrationexternalid__c) as aqb__registrationexternalid__c
,trim(aqb__registrationfullname__c) as aqb__registrationfullname__c
,aqb__total_registration_amount__c as aqb__total_registration_amount__c
,aqb__numberofguestsattended__c as aqb__numberofguestsattended__c
,aqb__numberofguests__c as aqb__numberofguests__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,aqc_host__c as aqc_host__c
,tickets_sent__c as tickets_sent__c
,vud_pending_guests_c__c as vud_pending_guests_c__c
,ivud_nvited_guests_c__c as ivud_nvited_guests_c__c
,vud_declined_guests_c__c as vud_declined_guests_c__c
,vud_attending_guests_c__c as vud_attending_guests_c__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__registration__c
) 
select * from final 
