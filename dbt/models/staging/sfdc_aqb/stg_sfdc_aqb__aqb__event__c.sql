with aqb__event__c as ( select * from {{ source('sfdc_aqb','aqb__event__c') }}
), 
final 
as ( select  
 trim(id) as aqb__event__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,lastactivitydate as lastactivitydate
,lastvieweddate as lastvieweddate
,lastreferenceddate as lastreferenceddate
,trim(aqb__affiliatedorganizationsponsor__c) as aqb__affiliatedorganizationsponsor__c
,trim(aqb__city__c) as aqb__city__c
,trim(aqb__comment__c) as aqb__comment__c
,trim(aqb__country__c) as aqb__country__c
,aqb__date__c as aqb__date__c
,aqb__enddate__c as aqb__enddate__c
,trim(aqb__eventexternalid__c) as aqb__eventexternalid__c
,trim(aqb__eventlocality__c) as aqb__eventlocality__c
,trim(aqb__event_type__c) as aqb__event_type__c
,trim(aqb__hostingaccount__c) as aqb__hostingaccount__c
,trim(aqb__note__c) as aqb__note__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,aqb__startdateandtime__c as aqb__startdateandtime__c
,trim(aqb__state__c) as aqb__state__c
,trim(aqb__status__c) as aqb__status__c
,aqb__stopdateandtime__c as aqb__stopdateandtime__c
,trim(aqb__venuestreetaddresslinethree__c) as aqb__venuestreetaddresslinethree__c
,trim(aqb__venuestreetaddressone__c) as aqb__venuestreetaddressone__c
,trim(aqb__venuestreetaddresstwo__c) as aqb__venuestreetaddresstwo__c
,trim(aqb__venue__c) as aqb__venue__c
,aqb__totalnumberofguests__c as aqb__totalnumberofguests__c
,aqb__totalnumberofregistrants__c as aqb__totalnumberofregistrants__c
,aqb__total_numberofguestsattended__c as aqb__total_numberofguestsattended__c
,aqb__total_registration_revenue__c as aqb__total_registration_revenue__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,vud_signature_event__c as vud_signature_event__c
,trim(aqc_event_source__c) as aqc_event_source__c
,trim(aqc_chapter_code__c) as aqc_chapter_code__c
,trim(aqc_net_promoter_score__c) as aqc_net_promoter_score__c
,trim(institutional_unit__c) as institutional_unit__c
,vud_capacity_c__c as vud_capacity_c__c
,vu_start_time__c as vu_start_time__c
,vu_end_time__c as vu_end_time__c
,trim(vud_lpe_event_type_c__c) as vud_lpe_event_type_c__c
,vud_number_pending_c__c as vud_number_pending_c__c
,vud_number_invited_c__c as vud_number_invited_c__c
,vud_number_declined_c__c as vud_number_declined_c__c
,vud_number_attending_c__c as vud_number_attending_c__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__event__c
) 
select * from final 
