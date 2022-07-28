with alternate_id as (select * from  {{ ref ('stg_sfdc_aqb__aqb__alternateid__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),



alternate_id_transform as
(select
alternate_id.aqb__alternateid__c_id as alternate_id_id
, alternate_id.ownerid as alternate_id_ownerid
, alternate_id.isdeleted as alternate_id_isdeleted
, alternate_id.name as alternate_id_name
--, alternate_id.createddate as alternate_id_createddate
, alternate_id.createdbyid as alternate_id_createdbyid
--, alternate_id.lastmodifieddate as alternate_id_lastmodifieddate
, alternate_id.lastmodifiedbyid as alternate_id_lastmodifiedbyid
--, alternate_id.systemmodstamp as alternate_id_systemmodstamp
, alternate_id.lastvieweddate as alternate_id_lastvieweddate
, alternate_id.lastreferenceddate as alternate_id_lastreferenceddate
, alternate_id.aqb__accountreferenced__c as alternate_id_accountreferenced
--, alternate_id.aqb__alternate_id__c as alternate_id_alternate_id
, alternate_id.aqb__contactreferenced__c as alternate_id_contactreferenced
, alternate_id.aqb__nonuniquealternateid__c as alternate_id_nonuniquealternate_id
--, alternate_id.aqb__ownerunit__c as alternate_id_ownerunit
, alternate_id.aqb__type__c as alternate_id_type
--, alternate_id.aqcv_conversionid__c as alternate_id_aqcv_conversionid
, alternate_id.matillion_batch_id as alternate_id_matillion_batch_id
, alternate_id.matillion_updated_timestamp as alternate_id_matillion_updated_timestamp
, alternate_id.source_name as alternate_id_source_name
    from alternate_id
    ),

final as (select -- select count(1) as cnt from trans
             alternate_id_transform.*
             , owner.name as alternate_id_owner_name
             , created_by.name as alternate_id_creator_name
             , last_modified_by.name as alternate_id_last_modified_by_name
        from alternate_id_transform
             join owner on alternate_id_transform.alternate_id_ownerid = owner.user_id
             join created_by on alternate_id_transform.alternate_id_createdbyid = created_by.user_id
             join last_modified_by on alternate_id_transform.alternate_id_lastmodifiedbyid = last_modified_by.user_id
)

/*clean select*/
select * from final