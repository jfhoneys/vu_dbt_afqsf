with aqb__batch_item__c as ( select * from {{ source('sfdc_aqb','aqb__batch_item__c') }}
), 
final 
as ( select  
 trim(id) as aqb__batch_item__c_id
,trim(ownerid) as ownerid
,isdeleted as isdeleted
,trim(name) as name
,trim(recordtypeid) as recordtypeid
,createddate as createddate
,trim(createdbyid) as createdbyid
,lastmodifieddate as lastmodifieddate
,trim(lastmodifiedbyid) as lastmodifiedbyid
,systemmodstamp as systemmodstamp
,trim(aqb__accountexternalid__c) as aqb__accountexternalid__c
,trim(aqb__accountgreeting__c) as aqb__accountgreeting__c
,trim(aqb__accountmatchconfidence__c) as aqb__accountmatchconfidence__c
,trim(aqb__accountmatchindicator__c) as aqb__accountmatchindicator__c
,trim(aqb__accountname__c) as aqb__accountname__c
,trim(aqb__account_id__c) as aqb__account_id__c
,trim(aqb__account__c) as aqb__account__c
,trim(aqb__acknowledgement__c) as aqb__acknowledgement__c
,aqb__amount2__c as aqb__amount2__c
,aqb__amount3__c as aqb__amount3__c
,aqb__amount4__c as aqb__amount4__c
,aqb__amount5__c as aqb__amount5__c
,aqb__amount__c as aqb__amount__c
,aqb__annualreceipt__c as aqb__annualreceipt__c
,trim(aqb__anonymitylevel__c) as aqb__anonymitylevel__c
,trim(aqb__appraiseraddress__c) as aqb__appraiseraddress__c
,trim(aqb__appraisername__c) as aqb__appraisername__c
,aqb__approvereceipt__c as aqb__approvereceipt__c
,trim(aqb__batchitemgroup__c) as aqb__batchitemgroup__c
,trim(aqb__batchitemmatchaccountstatus__c) as aqb__batchitemmatchaccountstatus__c
,trim(aqb__batchitemmessage__c) as aqb__batchitemmessage__c
,aqb__batchitemmultiacknowledgements__c as aqb__batchitemmultiacknowledgements__c
,aqb__batchitemmulticampaignappeals__c as aqb__batchitemmulticampaignappeals__c
,aqb__batchitemmultidesignations__c as aqb__batchitemmultidesignations__c
,aqb__batchitemmultimethods__c as aqb__batchitemmultimethods__c
,trim(aqb__batchitemprocess__c) as aqb__batchitemprocess__c
,trim(aqb__batchitemstatus__c) as aqb__batchitemstatus__c
,trim(aqb__batch__c) as aqb__batch__c
,aqb__bypassgiftrecognitionlogic__c as aqb__bypassgiftrecognitionlogic__c
,trim(aqb__campaignappeal__c) as aqb__campaignappeal__c
,trim(aqb__chartofaccounts2__c) as aqb__chartofaccounts2__c
,trim(aqb__chartofaccounts3__c) as aqb__chartofaccounts3__c
,trim(aqb__chartofaccounts4__c) as aqb__chartofaccounts4__c
,trim(aqb__chartofaccounts5__c) as aqb__chartofaccounts5__c
,trim(aqb__chartofaccounts__c) as aqb__chartofaccounts__c
,trim(aqb__checknumber2__c) as aqb__checknumber2__c
,trim(aqb__checknumber3__c) as aqb__checknumber3__c
,trim(aqb__checknumber4__c) as aqb__checknumber4__c
,trim(aqb__checknumber5__c) as aqb__checknumber5__c
,aqb__checknumber__c as aqb__checknumber__c
,trim(aqb__city__c) as aqb__city__c
,aqb__conditionalpledge__c as aqb__conditionalpledge__c
,aqb__contact1birthdate__c as aqb__contact1birthdate__c
,trim(aqb__contact1businessemail__c) as aqb__contact1businessemail__c
,trim(aqb__contact1businessphone__c) as aqb__contact1businessphone__c
,trim(aqb__contact1externalid__c) as aqb__contact1externalid__c
,trim(aqb__contact1external_id__c) as aqb__contact1external_id__c
,trim(aqb__contact1firstname__c) as aqb__contact1firstname__c
,trim(aqb__contact1gender__c) as aqb__contact1gender__c
,trim(aqb__contact1giftrecognitioncredittype__c) as aqb__contact1giftrecognitioncredittype__c
,trim(aqb__contact1homephone__c) as aqb__contact1homephone__c
,trim(aqb__contact1lastname__c) as aqb__contact1lastname__c
,trim(aqb__contact1middlename__c) as aqb__contact1middlename__c
,trim(aqb__contact1mobilephone__c) as aqb__contact1mobilephone__c
,trim(aqb__contact1mobileworkphone__c) as aqb__contact1mobileworkphone__c
,trim(aqb__contact1otheremail__c) as aqb__contact1otheremail__c
,trim(aqb__contact1otherphone__c) as aqb__contact1otherphone__c
,trim(aqb__contact1personalemail__c) as aqb__contact1personalemail__c
,trim(aqb__contact1salutation__c) as aqb__contact1salutation__c
,trim(aqb__contact1schoolemail__c) as aqb__contact1schoolemail__c
,trim(aqb__contact1suffix__c) as aqb__contact1suffix__c
,trim(aqb__contact1__c) as aqb__contact1__c
,aqb__contact2birthdate__c as aqb__contact2birthdate__c
,trim(aqb__contact2businessemail__c) as aqb__contact2businessemail__c
,trim(aqb__contact2businessphone__c) as aqb__contact2businessphone__c
,trim(aqb__contact2externalid__c) as aqb__contact2externalid__c
,trim(aqb__contact2external_id__c) as aqb__contact2external_id__c
,trim(aqb__contact2firstname__c) as aqb__contact2firstname__c
,trim(aqb__contact2gender__c) as aqb__contact2gender__c
,trim(aqb__contact2giftrecognitioncredittype__c) as aqb__contact2giftrecognitioncredittype__c
,trim(aqb__contact2greeting__c) as aqb__contact2greeting__c
,trim(aqb__contact2homephone__c) as aqb__contact2homephone__c
,trim(aqb__contact2lastname__c) as aqb__contact2lastname__c
,trim(aqb__contact2middlename__c) as aqb__contact2middlename__c
,trim(aqb__contact2mobilephone__c) as aqb__contact2mobilephone__c
,trim(aqb__contact2mobileworkphone__c) as aqb__contact2mobileworkphone__c
,trim(aqb__contact2otheremail__c) as aqb__contact2otheremail__c
,trim(aqb__contact2otherphone__c) as aqb__contact2otherphone__c
,trim(aqb__contact2personalemail__c) as aqb__contact2personalemail__c
,trim(aqb__contact2salutation__c) as aqb__contact2salutation__c
,trim(aqb__contact2schoolemail__c) as aqb__contact2schoolemail__c
,trim(aqb__contact2suffix__c) as aqb__contact2suffix__c
,trim(aqb__contact2__c) as aqb__contact2__c
,trim(aqb__contact_1_greeting__c) as aqb__contact_1_greeting__c
,trim(aqb__country__c) as aqb__country__c
,aqb__createnewaccount__c as aqb__createnewaccount__c
,trim(aqb__creditcard__c) as aqb__creditcard__c
,aqb__creditedyearoverridedate2__c as aqb__creditedyearoverridedate2__c
,aqb__creditedyearoverridedate3__c as aqb__creditedyearoverridedate3__c
,aqb__creditedyearoverridedate4__c as aqb__creditedyearoverridedate4__c
,aqb__creditedyearoverridedate5__c as aqb__creditedyearoverridedate5__c
,aqb__creditedyearoverridedate__c as aqb__creditedyearoverridedate__c
,aqb__currencyexchangerate__c as aqb__currencyexchangerate__c
,aqb__currencyunits__c as aqb__currencyunits__c
,trim(aqb__currency__c) as aqb__currency__c
,aqb__dailyhigh__c as aqb__dailyhigh__c
,aqb__dailylow__c as aqb__dailylow__c
,aqb__datedue__c as aqb__datedue__c
,aqb__dateoftransfer__c as aqb__dateoftransfer__c
,aqb__date__c as aqb__date__c
,trim(aqb__description2__c) as aqb__description2__c
,trim(aqb__description3__c) as aqb__description3__c
,trim(aqb__description4__c) as aqb__description4__c
,trim(aqb__description5__c) as aqb__description5__c
,trim(aqb__description__c) as aqb__description__c
,aqb__donotlinktoopportunity__c as aqb__donotlinktoopportunity__c
,aqb__donotlinktopledge__c as aqb__donotlinktopledge__c
,aqb__donotlinktorecurringgift__c as aqb__donotlinktorecurringgift__c
,aqb__documentedlegaldate__c as aqb__documentedlegaldate__c
,aqb__donordate__c as aqb__donordate__c
,trim(aqb__duesnumber__c) as aqb__duesnumber__c
,aqb__dues__c as aqb__dues__c
,aqb__exceedsapprovalamount__c as aqb__exceedsapprovalamount__c
,trim(aqb__expirationmonth__c) as aqb__expirationmonth__c
,trim(aqb__expirationyear__c) as aqb__expirationyear__c
,aqb__frequency__c as aqb__frequency__c
,trim(aqb__fundraisingcampaignforgift__c) as aqb__fundraisingcampaignforgift__c
,trim(aqb__giftdescription__c) as aqb__giftdescription__c
,trim(aqb__giftrecordtype__c) as aqb__giftrecordtype__c
,trim(aqb__gift__c) as aqb__gift__c
,aqb__hours__c as aqb__hours__c
,trim(aqb__imageurl__c) as aqb__imageurl__c
,aqb__individualpaymentoriginalcurrency__c as aqb__individualpaymentoriginalcurrency__c
,aqb__initialnetpresentvalue__c as aqb__initialnetpresentvalue__c
,trim(aqb__instrumentdescriptor__c) as aqb__instrumentdescriptor__c
,trim(aqb__instrument__c) as aqb__instrument__c
,trim(aqb__last4digitsoncard__c) as aqb__last4digitsoncard__c
,trim(aqb__linktoduespledge__c) as aqb__linktoduespledge__c
,trim(aqb__linktoopportunity__c) as aqb__linktoopportunity__c
,trim(aqb__linktopledge__c) as aqb__linktopledge__c
,trim(aqb__linktorecurringgift__c) as aqb__linktorecurringgift__c
,trim(aqb__linktotransaction2__c) as aqb__linktotransaction2__c
,trim(aqb__linktotransaction3__c) as aqb__linktotransaction3__c
,trim(aqb__linktotransaction4__c) as aqb__linktotransaction4__c
,trim(aqb__linktotransaction5__c) as aqb__linktotransaction5__c
,trim(aqb__linktotransaction__c) as aqb__linktotransaction__c
,trim(aqb__maritalstatus__c) as aqb__maritalstatus__c
,trim(aqb__matchlink__c) as aqb__matchlink__c
,trim(aqb__matchmethod__c) as aqb__matchmethod__c
,aqb__matchinggift__c as aqb__matchinggift__c
,aqb__maturitydate__c as aqb__maturitydate__c
,trim(aqb__method__c) as aqb__method__c
,aqb__missingdesignations__c as aqb__missingdesignations__c
,aqb__multipletransactions__c as aqb__multipletransactions__c
,trim(aqb__nameoncard__c) as aqb__nameoncard__c
,aqb__noreceipt__c as aqb__noreceipt__c
,aqb__numberoflinkedfiles__c as aqb__numberoflinkedfiles__c
,aqb__numberofmissingdesignations__c as aqb__numberofmissingdesignations__c
,aqb__numberofopenopportunities__c as aqb__numberofopenopportunities__c
,aqb__numberofopenpledges__c as aqb__numberofopenpledges__c
,aqb__numberofpayments__c as aqb__numberofpayments__c
,aqb__numberofrecurringgifts__c as aqb__numberofrecurringgifts__c
,aqb__numberofshares2__c as aqb__numberofshares2__c
,aqb__numberofshares3__c as aqb__numberofshares3__c
,aqb__numberofshares4__c as aqb__numberofshares4__c
,aqb__numberofshares5__c as aqb__numberofshares5__c
,aqb__numberofshares__c as aqb__numberofshares__c
,trim(aqb__opportunitylinkindicator__c) as aqb__opportunitylinkindicator__c
,aqb__opportunitylinkverified__c as aqb__opportunitylinkverified__c
,trim(aqb__origins__c) as aqb__origins__c
,trim(aqb__paymentmethod__c) as aqb__paymentmethod__c
,aqb__pledgeenddate__c as aqb__pledgeenddate__c
,trim(aqb__pledgeinterval__c) as aqb__pledgeinterval__c
,trim(aqb__pledgelinkindicator__c) as aqb__pledgelinkindicator__c
,aqb__pledgelinkverified__c as aqb__pledgelinkverified__c
,aqb__pledgepayment__c as aqb__pledgepayment__c
,trim(aqb__pledgescheduletype__c) as aqb__pledgescheduletype__c
,aqb__pledgestartdate__c as aqb__pledgestartdate__c
,trim(aqb__pledgetype__c) as aqb__pledgetype__c
,trim(aqb__pledgewriteoffnotation__c) as aqb__pledgewriteoffnotation__c
,trim(aqb__postalcode__c) as aqb__postalcode__c
,aqb__proportionalgiftcredit__c as aqb__proportionalgiftcredit__c
,aqb__rate__c as aqb__rate__c
,aqb__recurringgiftamount__c as aqb__recurringgiftamount__c
,trim(aqb__recurringgiftexternalreference_number__c) as aqb__recurringgiftexternalreference_number__c
,trim(aqb__recurringgiftlinkindicator__c) as aqb__recurringgiftlinkindicator__c
,aqb__recurringgiftlinkverified__c as aqb__recurringgiftlinkverified__c
,trim(aqb__reference2__c) as aqb__reference2__c
,trim(aqb__reference3__c) as aqb__reference3__c
,trim(aqb__reference4__c) as aqb__reference4__c
,trim(aqb__reference5__c) as aqb__reference5__c
,trim(aqb__referenceid__c) as aqb__referenceid__c
,trim(aqb__reference__c) as aqb__reference__c
,aqb__revocable__c as aqb__revocable__c
,aqb__sendpledgereminder__c as aqb__sendpledgereminder__c
,trim(aqb__servicetype__c) as aqb__servicetype__c
,trim(aqb__signator__c) as aqb__signator__c
,trim(aqb__stateprovince__c) as aqb__stateprovince__c
,trim(aqb__streetline1__c) as aqb__streetline1__c
,trim(aqb__streetline2__c) as aqb__streetline2__c
,trim(aqb__street_line_3__c) as aqb__street_line_3__c
,aqb__taxamount__c as aqb__taxamount__c
,aqb__thirdpartypayoff__c as aqb__thirdpartypayoff__c
,trim(aqb__tickersymbol__c) as aqb__tickersymbol__c
,aqb__totalamount__c as aqb__totalamount__c
,aqb__totalassetamount__c as aqb__totalassetamount__c
,aqb__totalpledgeoriginalcurrency__c as aqb__totalpledgeoriginalcurrency__c
,trim(aqb__transaction1propertycategory__c) as aqb__transaction1propertycategory__c
,aqb__transaction1transfer__c as aqb__transaction1transfer__c
,trim(aqb__transaction2propertycategory__c) as aqb__transaction2propertycategory__c
,aqb__transaction2transfer__c as aqb__transaction2transfer__c
,trim(aqb__transaction3propertycategory__c) as aqb__transaction3propertycategory__c
,aqb__transaction3transfer__c as aqb__transaction3transfer__c
,aqb__transaction4transfer__c as aqb__transaction4transfer__c
,trim(aqb__transaction5propertycategory__c) as aqb__transaction5propertycategory__c
,aqb__transaction5transfer__c as aqb__transaction5transfer__c
,trim(aqb__transaction_4_property_category__c) as aqb__transaction_4_property_category__c
,aqb__usepotentialaccountmatch__c as aqb__usepotentialaccountmatch__c
,aqb__userselectedaccount__c as aqb__userselectedaccount__c
,trim(aqb__verifyactivities__c) as aqb__verifyactivities__c
,trim(aqb__verifymatchpotentials__c) as aqb__verifymatchpotentials__c
,trim(aqb__verifyrecognitions__c) as aqb__verifyrecognitions__c
,trim(aqb__verifytransactions__c) as aqb__verifytransactions__c
,trim(aqb__verifytributes__c) as aqb__verifytributes__c
,aqb__isaccountmatched__c as aqb__isaccountmatched__c
,aqb__batchitemactivitycount__c as aqb__batchitemactivitycount__c
,aqb__batchitemmatchpotentialcount__c as aqb__batchitemmatchpotentialcount__c
,aqb__batchitemmembershipcount__c as aqb__batchitemmembershipcount__c
,aqb__batchitemrecognitionscount__c as aqb__batchitemrecognitionscount__c
,aqb__batchitemtransactioncount__c as aqb__batchitemtransactioncount__c
,aqb__batchitemtributecount__c as aqb__batchitemtributecount__c
,aqb__numberofcredits__c as aqb__numberofcredits__c
,aqb__numberoffuzzymatches__c as aqb__numberoffuzzymatches__c
,aqb__numberofmissingtributecontacts__c as aqb__numberofmissingtributecontacts__c
,aqb__numberofsoftcreditpayments__c as aqb__numberofsoftcreditpayments__c
,aqb__numberofsoftcreditsnotverified__c as aqb__numberofsoftcreditsnotverified__c
,aqb__pledgepaymenttotal__c as aqb__pledgepaymenttotal__c
,aqb__total_amount__c as aqb__total_amount__c
,trim(aqcv_conversionid__c) as aqcv_conversionid__c
,trim(aqb__contact1professionalsuffix__c) as aqb__contact1professionalsuffix__c
,trim(aqb__contact2professionalsuffix__c) as aqb__contact2professionalsuffix__c
,aqb__dailyhigh2__c as aqb__dailyhigh2__c
,aqb__dailyhigh3__c as aqb__dailyhigh3__c
,aqb__dailyhigh4__c as aqb__dailyhigh4__c
,aqb__dailyhigh5__c as aqb__dailyhigh5__c
,aqb__dailylow2__c as aqb__dailylow2__c
,aqb__dailylow3__c as aqb__dailylow3__c
,aqb__dailylow4__c as aqb__dailylow4__c
,aqb__dailylow5__c as aqb__dailylow5__c
,aqb__dateoftransfer2__c as aqb__dateoftransfer2__c
,aqb__dateoftransfer3__c as aqb__dateoftransfer3__c
,aqb__dateoftransfer4__c as aqb__dateoftransfer4__c
,aqb__dateoftransfer5__c as aqb__dateoftransfer5__c
,trim(aqb__ownerunit__c) as aqb__ownerunit__c
,trim(aqb__tickersymbol2__c) as aqb__tickersymbol2__c
,trim(aqb__tickersymbol3__c) as aqb__tickersymbol3__c
,trim(aqb__tickersymbol4__c) as aqb__tickersymbol4__c
,trim(aqb__tickersymbol5__c) as aqb__tickersymbol5__c
,aqb__feeexempt__c as aqb__feeexempt__c
,aqb__batchitemsolicitationscount__c as aqb__batchitemsolicitationscount__c
,aqb__fee1exemptcount__c as aqb__fee1exemptcount__c
,aqb__fee2exemptcount__c as aqb__fee2exemptcount__c
,aqb__iradistribution2__c as aqb__iradistribution2__c
,aqb__iradistribution3__c as aqb__iradistribution3__c
,aqb__iradistribution4__c as aqb__iradistribution4__c
,aqb__iradistribution5__c as aqb__iradistribution5__c
,aqb__iradistribution__c as aqb__iradistribution__c
,matillion_batch_id as matillion_batch_id
,matillion_updated_timestamp as matillion_updated_timestamp
,'sfdc_aqb'  as source_name 
  from aqb__batch_item__c
) 
select * from final 
