with event_guest as (select * from  {{ ref ('stg_sfdc_aqb__aqb__eventguest__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

event_guest_transform as (
    select event_guest.aqb__eventguest__c_id as event_guest_event_guest_id
, event_guest.ownerid as event_guest_owner_id
, event_guest.isdeleted as event_guest_isdeleted
, event_guest.name as event_guest_name
, event_guest.recordtypeid as event_guest_record_type_id
-- , event_guest.createddate as event_guest_createddate
, event_guest.createdbyid as event_guest_created_by_id
-- , event_guest.lastmodifieddate as event_guest_last_modified_date
, event_guest.lastmodifiedbyid as event_guest_lastmodified_by_id
-- , event_guest.systemmodstamp as event_guest_systemmodstamp
-- , event_guest.lastactivitydate as event_guest_lastactivitydate
, event_guest.aqb__event_registration__c as event_guest_event_registration
, event_guest.aqb__attendance__c as event_guest_attendance
, event_guest.aqb__attended_event__c as event_guest_attended_event
-- , event_guest.aqb__comment__c as event_guest_comment
, event_guest.aqb__contact__c as event_guest_contact
, event_guest.aqb__eventenddate__c as event_guest_event_end_date
-- , event_guest.aqb__event_guestexternalid__c as event_guest_event_guestexternalid
, event_guest.aqb__eventstartdateandtime__c as event_guest_event_start_date_and_time
, event_guest.aqb__eventstopdateandtime__c as event_guest_event_stop_date_and_time
, event_guest.aqb__eventvenue__c as event_guest_event_venue
, event_guest.aqb__event_date__c as event_guest_event_date
, event_guest.aqb__event_location__c as event_guest_event_location
, event_guest.aqb__event__c as event_guest_event
, event_guest.aqb__guestfirstname__c as event_guest_guest_first_name
, event_guest.aqb__guestfullname__c as event_guest_guest_full_name
, event_guest.aqb__guestlastname__c as event_guest_guest_last_name
, event_guest.aqb__guesttitle__c as event_guest_guest_title
-- , event_guest.aqb__lead__c as event_guest_lead
, event_guest.aqb__registeredby__c as event_guest_registered_by
, event_guest.aqb__suffix__c as event_guest_suffix
-- , event_guest.aqcv_conversionid__c as event_guest_aqcv_conversionid
, event_guest.vu_guest_type__c as event_guest_vu_guest_type
, event_guest.matillion_batch_id as event_guest_matillion_batch_id
, event_guest.matillion_updated_timestamp as event_guest_matillion_updated_timestamp
, event_guest.source_name as event_guest_source_name
    from event_guest
    ),

final as (select -- select count(1) as cnt from trans
             event_guest_transform.*
             , owner.name as event_guest_owner_name
             , created_by.name as event_guest_creator_name
             , last_modified_by.name as event_guest_last_modified_by_name
        from event_guest_transform
             join owner on event_guest_transform.event_guest_owner_id = owner.user_id
             join created_by on event_guest_transform.event_guest_created_by_id = created_by.user_id
             join last_modified_by on event_guest_transform.event_guest_last_modified_by_id = last_modified_by.user_id
)

/*clean select*/
select * from final
