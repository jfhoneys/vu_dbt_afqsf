with alternateid as (select * from  {{ ref ('stg_sfdc_aqb__aqb__alternateid__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),



alternateid_transform as
(select
, alternateid.aqb__alternateid__c_id as alternateid_alternateid_id
--, alternateid.ownerid as alternateid_ownerid
, alternateid.isdeleted as alternateid_isdeleted
, alternateid.name as alternateid_name
--, alternateid.createddate as alternateid_createddate
--, alternateid.createdbyid as alternateid_createdbyid
--, alternateid.lastmodifieddate as alternateid_lastmodifieddate
--, alternateid.lastmodifiedbyid as alternateid_lastmodifiedbyid
--, alternateid.systemmodstamp as alternateid_systemmodstamp
, alternateid.lastvieweddate as alternateid_lastvieweddate
, alternateid.lastreferenceddate as alternateid_lastreferenceddate
, alternateid.aqb__accountreferenced__c as alternateid_accountreferenced
--, alternateid.aqb__alternateid__c as alternateid_alternateid
, alternateid.aqb__contactreferenced__c as alternateid_contactreferenced
, alternateid.aqb__nonuniquealternateid__c as alternateid_nonuniquealternateid
--, alternateid.aqb__ownerunit__c as alternateid_ownerunit
, alternateid.aqb__type__c as alternateid_type
--, alternateid.aqcv_conversionid__c as alternateid_aqcv_conversionid
, alternateid.matillion_batch_id as alternateid_matillion_batch_id
, alternateid.matillion_updated_timestamp as alternateid_matillion_updated_timestamp
, alternateid.source_name as alternateid_source_name
    from alternateid
    ),

final as (select -- select count(1) as cnt from trans
             alternateid_transform.*
             , owner.name as alternateid_owner_name
             , created_by.name as alternateid_creator_name
             , last_modified_by.name as alternateid_last_modified_by_name
        from alternateid_transform
             join owner on alternateid_transform.alternateid_ownerid = owner.user_id
             join created_by on alternateid_transform.alternateid_createdbyid = created_by.user_id
             join last_modified_by on alternateid_transform.alternateid_lastmodifiedbyid = last_modified_by.user_id
)

/*clean select*/
select * from final