with event as (select * from  {{ ref ('stg_sfdc_aqb__aqb__event__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

event_transform as (
    select event.aqb__event__c_id as event__id
, event.ownerid as event_owner_id
, event.isdeleted as event_isdeleted
, event.name as event_name
, event.recordtypeid as event_record_type_id
-- , event.createddate as event_createddate
, event.createdbyid as event_created_by_id
-- , event.lastmodifieddate as event_lastmodifieddate
, event.lastmodifiedbyid as event_last_modified_by_id
-- , event.systemmodstamp as event_systemmodstamp
-- , event.lastactivitydate as event_lastactivitydate
-- , event.lastvieweddate as event_lastvieweddate
-- , event.lastreferenceddate as event_lastreferenceddate
-- , event.aqb__affiliatedorganizationsponsor__c as event_affiliated_organizationsponsor
, event.aqb__city__c as event_city
-- , event.aqb__comment__c as event_comment
-- , event.aqb__country__c as event_country
, event.aqb__date__c as event_date
, event.aqb__enddate__c as event_enddate
-- , event.aqb__eventexternalid__c as event_externalid
-- , event.aqb__eventlocality__c as event_locality
, event.aqb__event_type__c as event__type
-- , event.aqb__hostingaccount__c as event_hostingaccount
, event.aqb__note__c as event_note
-- , event.aqb__ownerunit__c as event_ownerunit
-- , event.aqb__startdateandtime__c as event_startdateandtime
, event.aqb__state__c as event_state
, event.aqb__status__c as event_status
-- , event.aqb__stopdateandtime__c as event_stopdateandtime
-- , event.aqb__venuestreetaddresslinethree__c as event_venuestreetaddresslinethree
-- , event.aqb__venuestreetaddressone__c as event_venuestreetaddressone
-- , event.aqb__venuestreetaddresstwo__c as event_venuestreetaddresstwo
, event.aqb__venue__c as event_venue
, event.aqb__totalnumberofguests__c as event_totalnumberofguests
, event.aqb__totalnumberofregistrants__c as event_totalnumberofregistrants
, event.aqb__total_numberofguestsattended__c as event_total_numberofguestsattended
, event.aqb__total_registration_revenue__c as event_total_registration_revenue
-- , event.aqcv_conversionid__c as event_aqcv_conversionid
, event.vud_signature_event__c as event_vud_signature_event
-- , event.aqc_event_source__c as event_aqc_event_source
, event.aqc_chapter_code__c as event_aqc_chapter_code
-- , event.aqc_net_promoter_score__c as event_aqc_net_promoter_score
-- , event.institutional_unit__c as event_institutional_unit
-- , event.vud_capacity_c__c as event_vud_capacity_c
-- , event.vu_start_time__c as event_vu_start_time
-- , event.vu_end_time__c as event_vu_end_time
-- , event.vud_lpe_event_type_c__c as event_vud_lpe_event_type_c
-- , event.vud_number_pending_c__c as event_vud_number_pending_c
-- , event.vud_number_invited_c__c as event_vud_number_invited_c
-- , event.vud_number_declined_c__c as event_vud_number_declined_c
-- , event.vud_number_attending_c__c as event_vud_number_attending_c
, event.matillion_batch_id as event_matillion_batch_id
, event.matillion_updated_timestamp as event_matillion_updated_timestamp
, event.source_name as event_source_name
    from event
    ),

final as (select
             event_transform.*
--             , owner.name as event_owner_name
             , created_by.name as event_creator_name
             , last_modified_by.name as event_last_modified_by_name
        from event_transform
             join owner on event_transform.event_owner_id = owner.user_id
             join created_by on event_transform.event_created_by_id = created_by.user_id
             join last_modified_by on event_transform.event_last_modified_by_id = last_modified_by.user_id
)
select * from final
