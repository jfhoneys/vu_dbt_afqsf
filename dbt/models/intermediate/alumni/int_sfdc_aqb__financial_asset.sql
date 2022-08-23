with financial_asset as (select * from  {{ ref ('stg_sfdc_aqb__aqb__financial_asset__c')}} where not isdeleted),
owner as (select * from {{ref ('stg_sfdc_aqb__user')}}),
created_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),
last_modified_by as (select * from {{ref ('stg_sfdc_aqb__user')}}),

financial_asset_transform as
(select
 financial_asset.aqb__financial_asset__c_id as financial_asset_id
, financial_asset.ownerid as financial_asset_ownerid
-- , financial_asset.isdeleted as financial_asset_isdeleted
, financial_asset.name as financial_asset_name
-- , financial_asset.createddate as financial_asset_createddate
, financial_asset.createdbyid as financial_asset_createdbyid
-- , financial_asset.lastmodifieddate as financial_asset_lastmodifieddate
, financial_asset.lastmodifiedbyid as financial_asset_lastmodifiedbyid
-- , financial_asset.systemmodstamp as financial_asset_systemmodstamp
-- , financial_asset.lastactivitydate as financial_asset_lastactivitydate
-- , financial_asset.aqb__account__c as financial_asset_account
-- , financial_asset.aqb__comment__c as financial_asset_comment
-- , financial_asset.aqb__contact__c as financial_asset_contact
-- , financial_asset.aqb__dateofacquisition__c as financial_asset_dateofacquisition
-- , financial_asset.aqb__dateofdisposition__c as financial_asset_dateofdisposition
, financial_asset.aqb__dateofvaluation__c as financial_asset_dateofvaluation
-- , financial_asset.aqb__description__c as financial_asset_description
-- , financial_asset.aqb__lastverifiedby__c as financial_asset_lastverifiedby
-- , financial_asset.aqb__lastverifiedon__c as financial_asset_lastverifiedon
-- , financial_asset.aqb__ownerunit__c as financial_asset_ownerunit
, financial_asset.aqb__source__c as financial_asset_source
-- , financial_asset.aqb__value__c as financial_asset_value
-- , financial_asset.aqcv_conversionid__c as financial_asset_aqcv_conversionid
, financial_asset.matillion_batch_id as financial_asset_matillion_batch_id
, financial_asset.matillion_updated_timestamp as financial_asset_matillion_updated_timestamp
, financial_asset.source_name as financial_asset_source_name

    from financial_asset
    ),

final as (select
             financial_asset_transform.*
             , owner.name as financial_asset_owner_name
             , created_by.name as financial_asset_creator_name
             , last_modified_by.name as financial_asset_last_modified_by_name
        from financial_asset_transform
             join owner on financial_asset_transform.financial_asset_ownerid = owner.user_id
             join created_by on financial_asset_transform.financial_asset_createdbyid = created_by.user_id
             join last_modified_by on financial_asset_transform.financial_asset_lastmodifiedbyid = last_modified_by.user_id
)
select * from final