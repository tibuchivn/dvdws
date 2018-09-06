# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180906173823) do

  create_table "AclRecord", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "EntityId", null: false
    t.string "EntityName", limit: 400, null: false
    t.integer "CustomerRoleId", null: false
    t.index ["EntityId", "EntityName"], name: "IX_AclRecord_EntityId_EntityName"
  end

  create_table "ActivityLog", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ActivityLogTypeId", null: false
    t.integer "CustomerId", null: false
    t.text "Comment", null: false
    t.datetime "CreatedOnUtc", null: false
    t.index ["CreatedOnUtc"], name: "IX_ActivityLog_CreatedOnUtc"
  end

  create_table "ActivityLogType", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "SystemKeyword", limit: 100, null: false
    t.string "Name", limit: 200, null: false
    t.boolean "Enabled", null: false
  end

  create_table "Address", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.text "FirstName"
    t.text "LastName"
    t.text "Email"
    t.text "Company"
    t.integer "CountryId"
    t.integer "StateProvinceId"
    t.text "City"
    t.text "Address1"
    t.text "Address2"
    t.text "ZipPostalCode"
    t.text "PhoneNumber"
    t.text "FaxNumber"
    t.datetime "CreatedOnUtc", null: false
    t.text "CustomAttributes"
  end

  create_table "AddressAttribute", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.boolean "IsRequired", null: false
    t.integer "AttributeControlTypeId", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "AddressAttributeValue", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AddressAttributeId", null: false
    t.string "Name", limit: 400, null: false
    t.boolean "IsPreSelected", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "Affiliate", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "AddressId", null: false
    t.boolean "Deleted", null: false
    t.boolean "Active", null: false
    t.text "AdminComment"
    t.text "FriendlyUrlName"
  end

  create_table "ApiLog", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.varchar "UserName", limit: 50, null: false
    t.date "CallDate", null: false
    t.integer "CallCount", null: false
  end

  create_table "BackInStockSubscription", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CustomerId", null: false
    t.datetime "CreatedOnUtc", null: false
    t.integer "StoreId", null: false
    t.integer "ProductId", null: false
  end

  create_table "BlogComment", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.text "CommentText"
    t.integer "BlogPostId", null: false
    t.integer "CustomerId", null: false
    t.datetime "CreatedOnUtc", null: false
  end

  create_table "BlogPost", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "LanguageId", null: false
    t.text "Title", null: false
    t.text "Body", null: false
    t.boolean "AllowComments", null: false
    t.text "Tags"
    t.datetime "CreatedOnUtc", null: false
    t.datetime "StartDateUtc"
    t.datetime "EndDateUtc"
    t.integer "CommentCount", null: false
    t.string "MetaKeywords", limit: 400
    t.string "MetaTitle", limit: 400
    t.text "MetaDescription"
    t.boolean "LimitedToStores", null: false
    t.text "BodyOverview"
  end

  create_table "Campaign", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.text "Name", null: false
    t.text "Subject", null: false
    t.text "Body", null: false
    t.datetime "CreatedOnUtc", null: false
    t.integer "StoreId", null: false
  end

  create_table "Category", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.text "Description"
    t.string "MetaKeywords", limit: 400
    t.text "MetaDescription"
    t.string "MetaTitle", limit: 400
    t.integer "ParentCategoryId", null: false
    t.integer "PictureId", null: false
    t.integer "PageSize", null: false
    t.string "PriceRanges", limit: 400
    t.boolean "ShowOnHomePage", null: false
    t.boolean "Published", null: false
    t.boolean "Deleted", null: false
    t.integer "DisplayOrder", null: false
    t.datetime "CreatedOnUtc", null: false
    t.datetime "UpdatedOnUtc", null: false
    t.integer "CategoryTemplateId", null: false
    t.boolean "AllowCustomersToSelectPageSize", null: false
    t.string "PageSizeOptions", limit: 200
    t.boolean "SubjectToAcl", null: false
    t.boolean "LimitedToStores", null: false
    t.boolean "IncludeInTopMenu", null: false
    t.index ["LimitedToStores"], name: "IX_Category_LimitedToStores"
    t.index ["SubjectToAcl"], name: "IX_Category_SubjectToAcl"
  end

  create_table "CategoryTemplate", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.string "ViewPath", limit: 400, null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "CheckoutAttribute", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.text "TextPrompt"
    t.boolean "IsRequired", null: false
    t.boolean "ShippableProductRequired", null: false
    t.boolean "IsTaxExempt", null: false
    t.integer "TaxCategoryId", null: false
    t.integer "AttributeControlTypeId", null: false
    t.integer "DisplayOrder", null: false
    t.boolean "LimitedToStores", null: false
    t.integer "ValidationMinLength"
    t.integer "ValidationMaxLength"
    t.text "ValidationFileAllowedExtensions"
    t.integer "ValidationFileMaximumSize"
    t.text "DefaultValue"
  end

  create_table "CheckoutAttributeValue", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CheckoutAttributeId", null: false
    t.string "Name", limit: 400, null: false
    t.decimal "PriceAdjustment", precision: 18, scale: 4, null: false
    t.decimal "WeightAdjustment", precision: 18, scale: 4, null: false
    t.boolean "IsPreSelected", null: false
    t.integer "DisplayOrder", null: false
    t.string "ColorSquaresRgb", limit: 100
  end

  create_table "Country", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 100, null: false
    t.boolean "AllowsBilling", null: false
    t.boolean "AllowsShipping", null: false
    t.string "TwoLetterIsoCode", limit: 2
    t.string "ThreeLetterIsoCode", limit: 3
    t.integer "NumericIsoCode", null: false
    t.boolean "SubjectToVat", null: false
    t.boolean "Published", null: false
    t.integer "DisplayOrder", null: false
    t.boolean "LimitedToStores", null: false
  end

  create_table "CrossSellProduct", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ProductId1", null: false
    t.integer "ProductId2", null: false
  end

  create_table "Currency", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 50, null: false
    t.string "CurrencyCode", limit: 5, null: false
    t.decimal "Rate", precision: 18, scale: 4, null: false
    t.string "DisplayLocale", limit: 50
    t.string "CustomFormatting", limit: 50
    t.boolean "Published", null: false
    t.integer "DisplayOrder", null: false
    t.datetime "CreatedOnUtc", null: false
    t.datetime "UpdatedOnUtc", null: false
    t.boolean "LimitedToStores", null: false
  end

  create_table "Customer", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.uuid "CustomerGuid", null: false
    t.string "Username", limit: 1000
    t.string "Email", limit: 1000
    t.text "Password"
    t.integer "PasswordFormatId", null: false
    t.text "PasswordSalt"
    t.text "AdminComment"
    t.boolean "IsTaxExempt", null: false
    t.integer "AffiliateId", null: false
    t.boolean "Active", null: false
    t.boolean "Deleted", null: false
    t.boolean "IsSystemAccount", null: false
    t.string "SystemName", limit: 400
    t.text "LastIpAddress"
    t.datetime "CreatedOnUtc", null: false
    t.datetime "LastLoginDateUtc"
    t.datetime "LastActivityDateUtc", null: false
    t.integer "BillingAddress_Id"
    t.integer "ShippingAddress_Id"
    t.integer "VendorId", null: false
    t.boolean "HasShoppingCartItems", null: false
    t.index ["SystemName"], name: "IX_Customer_SystemName"
  end

  create_table "CustomerAddresses", primary_key: ["Customer_Id", "Address_Id"], force: :cascade do |t|
    t.integer "Customer_Id", null: false
    t.integer "Address_Id", null: false
  end

  create_table "CustomerAttribute", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.boolean "IsRequired", null: false
    t.integer "AttributeControlTypeId", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "CustomerAttributeValue", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CustomerAttributeId", null: false
    t.string "Name", limit: 400, null: false
    t.boolean "IsPreSelected", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "CustomerRole", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 255, null: false
    t.boolean "FreeShipping", null: false
    t.boolean "TaxExempt", null: false
    t.boolean "Active", null: false
    t.boolean "IsSystemRole", null: false
    t.string "SystemName", limit: 255
    t.integer "PurchasedWithProductId", null: false
  end

  create_table "Customer_CustomerRole_Mapping", primary_key: ["CustomerRole_Id", "Customer_Id"], force: :cascade do |t|
    t.integer "CustomerRole_Id", null: false
    t.integer "Customer_Id", null: false
  end

  create_table "DeliveryDate", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "Discount", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 200, null: false
    t.integer "DiscountTypeId", null: false
    t.boolean "UsePercentage", null: false
    t.decimal "DiscountPercentage", precision: 18, scale: 4, null: false
    t.decimal "DiscountAmount", precision: 18, scale: 4, null: false
    t.datetime "StartDateUtc"
    t.datetime "EndDateUtc"
    t.boolean "RequiresCouponCode", null: false
    t.string "CouponCode", limit: 100
    t.integer "DiscountLimitationId", null: false
    t.integer "LimitationTimes", null: false
    t.integer "MaximumDiscountedQuantity"
    t.decimal "MaximumDiscountAmount", precision: 18, scale: 4
    t.boolean "AppliedToSubCategories", null: false
  end

  create_table "DiscountRequirement", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "DiscountId", null: false
    t.text "DiscountRequirementRuleSystemName"
  end

  create_table "DiscountUsageHistory", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "DiscountId", null: false
    t.integer "OrderId", null: false
    t.datetime "CreatedOnUtc", null: false
  end

  create_table "Discount_AppliedToCategories", primary_key: ["Discount_Id", "Category_Id"], force: :cascade do |t|
    t.integer "Discount_Id", null: false
    t.integer "Category_Id", null: false
  end

  create_table "Discount_AppliedToManufacturers", primary_key: ["Discount_Id", "Manufacturer_Id"], force: :cascade do |t|
    t.integer "Discount_Id", null: false
    t.integer "Manufacturer_Id", null: false
  end

  create_table "Discount_AppliedToProducts", primary_key: ["Discount_Id", "Product_Id"], force: :cascade do |t|
    t.integer "Discount_Id", null: false
    t.integer "Product_Id", null: false
  end

  create_table "Download", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.boolean "UseDownloadUrl", null: false
    t.text "DownloadUrl"
    t.binary "DownloadBinary"
    t.text "ContentType"
    t.text "Filename"
    t.text "Extension"
    t.boolean "IsNew", null: false
    t.uuid "DownloadGuid", null: false
  end

  create_table "EdmMetadata", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.text "ModelHash"
  end

  create_table "EmailAccount", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Email", limit: 255, null: false
    t.string "DisplayName", limit: 255
    t.string "Host", limit: 255, null: false
    t.integer "Port", null: false
    t.string "Username", limit: 255, null: false
    t.string "Password", limit: 255, null: false
    t.boolean "EnableSsl", null: false
    t.boolean "UseDefaultCredentials", null: false
  end

  create_table "ExternalAuthenticationRecord", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CustomerId", null: false
    t.text "ExternalIdentifier"
    t.text "ExternalDisplayIdentifier"
    t.text "OAuthToken"
    t.text "OAuthAccessToken"
    t.text "ProviderSystemName"
    t.text "Email"
  end

  create_table "Forums_Forum", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ForumGroupId", null: false
    t.string "Name", limit: 200, null: false
    t.text "Description"
    t.integer "NumTopics", null: false
    t.integer "NumPosts", null: false
    t.integer "LastTopicId", null: false
    t.integer "LastPostId", null: false
    t.integer "LastPostCustomerId", null: false
    t.datetime "LastPostTime"
    t.integer "DisplayOrder", null: false
    t.datetime "CreatedOnUtc", null: false
    t.datetime "UpdatedOnUtc", null: false
  end

  create_table "Forums_Group", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 200, null: false
    t.integer "DisplayOrder", null: false
    t.datetime "CreatedOnUtc", null: false
    t.datetime "UpdatedOnUtc", null: false
  end

  create_table "Forums_Post", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "TopicId", null: false
    t.integer "CustomerId", null: false
    t.text "Text", null: false
    t.string "IPAddress", limit: 100
    t.datetime "CreatedOnUtc", null: false
    t.datetime "UpdatedOnUtc", null: false
  end

  create_table "Forums_PrivateMessage", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "FromCustomerId", null: false
    t.integer "ToCustomerId", null: false
    t.string "Subject", limit: 450, null: false
    t.text "Text", null: false
    t.boolean "IsRead", null: false
    t.boolean "IsDeletedByAuthor", null: false
    t.boolean "IsDeletedByRecipient", null: false
    t.datetime "CreatedOnUtc", null: false
    t.integer "StoreId", null: false
  end

  create_table "Forums_Subscription", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.uuid "SubscriptionGuid", null: false
    t.integer "CustomerId", null: false
    t.integer "ForumId", null: false
    t.integer "TopicId", null: false
    t.datetime "CreatedOnUtc", null: false
  end

  create_table "Forums_Topic", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ForumId", null: false
    t.integer "CustomerId", null: false
    t.integer "TopicTypeId", null: false
    t.string "Subject", limit: 450, null: false
    t.integer "NumPosts", null: false
    t.integer "Views", null: false
    t.integer "LastPostId", null: false
    t.integer "LastPostCustomerId", null: false
    t.datetime "LastPostTime"
    t.datetime "CreatedOnUtc", null: false
    t.datetime "UpdatedOnUtc", null: false
  end

  create_table "GenericAttribute", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "EntityId", null: false
    t.string "KeyGroup", limit: 400, null: false
    t.string "Key", limit: 400, null: false
    t.text "Value", null: false
    t.integer "StoreId", null: false
    t.index ["EntityId", "KeyGroup"], name: "IX_GenericAttribute_EntityId_and_KeyGroup"
  end

  create_table "GiftCard", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "PurchasedWithOrderItemId"
    t.integer "GiftCardTypeId", null: false
    t.decimal "Amount", precision: 18, scale: 4, null: false
    t.boolean "IsGiftCardActivated", null: false
    t.text "GiftCardCouponCode"
    t.text "RecipientName"
    t.text "RecipientEmail"
    t.text "SenderName"
    t.text "SenderEmail"
    t.text "Message"
    t.boolean "IsRecipientNotified", null: false
    t.datetime "CreatedOnUtc", null: false
  end

  create_table "GiftCardUsageHistory", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "GiftCardId", null: false
    t.integer "UsedWithOrderId", null: false
    t.decimal "UsedValue", precision: 18, scale: 4, null: false
    t.datetime "CreatedOnUtc", null: false
  end

  create_table "ImgLink", primary_key: "ID", id: :integer, force: :cascade do |t|
    t.string "linkimg", limit: 2500, null: false
    t.datetime "CreateDate", null: false
    t.boolean "IsDownLoaded"
    t.string "Domain", limit: 1000
    t.string "Counter", limit: 500
    t.string "GroupName", limit: 1000
    t.string "Category", limit: 1000
    t.boolean "IsBadURL"
    t.boolean "IsCheckLive"
    t.integer "HotLevel"
    t.boolean "IsNice"
    t.boolean "IsNude", default: false
    t.boolean "IsShow"
    t.index ["Domain", "IsBadURL"], name: "NonClusteredIndex-Domain-IsBadURL"
    t.index ["IsBadURL", "IsNice"], name: "NonClusteredIndex-IsNice-IsBadURL"
    t.index ["IsBadURL"], name: "NonClusteredIndex-IsBadURL"
    t.index ["IsBadURL"], name: "i1"
    t.index ["IsNice"], name: "NonClusteredIndex-IsNice"
    t.index ["IsNice"], name: "i2"
  end

  create_table "Language", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 100, null: false
    t.string "LanguageCulture", limit: 20, null: false
    t.string "FlagImageFileName", limit: 50
    t.boolean "Published", null: false
    t.integer "DisplayOrder", null: false
    t.string "UniqueSeoCode", limit: 2
    t.boolean "Rtl", null: false
    t.boolean "LimitedToStores", null: false
    t.integer "DefaultCurrencyId", null: false
  end

  create_table "LocaleStringResource", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "LanguageId", null: false
    t.string "ResourceName", limit: 200, null: false
    t.text "ResourceValue", null: false
  end

  create_table "LocalizedProperty", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "EntityId", null: false
    t.integer "LanguageId", null: false
    t.string "LocaleKeyGroup", limit: 400, null: false
    t.string "LocaleKey", limit: 400, null: false
    t.text "LocaleValue", null: false
  end

  create_table "Log", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "LogLevelId", null: false
    t.text "ShortMessage", null: false
    t.text "FullMessage"
    t.string "IpAddress", limit: 200
    t.integer "CustomerId"
    t.text "PageUrl"
    t.text "ReferrerUrl"
    t.datetime "CreatedOnUtc", null: false
  end

  create_table "Manufacturer", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.text "Description"
    t.string "MetaKeywords", limit: 400
    t.text "MetaDescription"
    t.string "MetaTitle", limit: 400
    t.integer "PictureId", null: false
    t.integer "PageSize", null: false
    t.string "PriceRanges", limit: 400
    t.boolean "Published", null: false
    t.boolean "Deleted", null: false
    t.integer "DisplayOrder", null: false
    t.datetime "CreatedOnUtc", null: false
    t.datetime "UpdatedOnUtc", null: false
    t.integer "ManufacturerTemplateId", null: false
    t.boolean "AllowCustomersToSelectPageSize", null: false
    t.string "PageSizeOptions", limit: 200
    t.boolean "SubjectToAcl", null: false
    t.boolean "LimitedToStores", null: false
    t.index ["LimitedToStores"], name: "IX_Manufacturer_LimitedToStores"
    t.index ["SubjectToAcl"], name: "IX_Manufacturer_SubjectToAcl"
  end

  create_table "ManufacturerTemplate", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.string "ViewPath", limit: 400, null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "MeasureDimension", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 100, null: false
    t.string "SystemKeyword", limit: 100, null: false
    t.decimal "Ratio", precision: 18, scale: 8, null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "MeasureWeight", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 100, null: false
    t.string "SystemKeyword", limit: 100, null: false
    t.decimal "Ratio", precision: 18, scale: 8, null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "MessageTemplate", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 200, null: false
    t.string "BccEmailAddresses", limit: 200
    t.string "Subject", limit: 1000
    t.text "Body"
    t.boolean "IsActive", null: false
    t.integer "EmailAccountId", null: false
    t.boolean "LimitedToStores", null: false
    t.integer "AttachedDownloadId", null: false
  end

  create_table "News", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "LanguageId", null: false
    t.text "Title", null: false
    t.text "Short", null: false
    t.text "Full", null: false
    t.boolean "Published", null: false
    t.boolean "AllowComments", null: false
    t.datetime "CreatedOnUtc", null: false
    t.datetime "StartDateUtc"
    t.datetime "EndDateUtc"
    t.boolean "LimitedToStores", null: false
    t.integer "CommentCount", null: false
    t.string "MetaKeywords", limit: 400
    t.string "MetaTitle", limit: 400
    t.text "MetaDescription"
  end

  create_table "NewsComment", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.text "CommentTitle"
    t.text "CommentText"
    t.integer "NewsItemId", null: false
    t.integer "CustomerId", null: false
    t.datetime "CreatedOnUtc", null: false
  end

  create_table "NewsLetterSubscription", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.uuid "NewsLetterSubscriptionGuid", null: false
    t.string "Email", limit: 255, null: false
    t.boolean "Active", null: false
    t.datetime "CreatedOnUtc", null: false
    t.integer "StoreId", null: false
    t.index ["Email", "StoreId"], name: "IX_NewsletterSubscription_Email_StoreId"
  end

  create_table "Order", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.uuid "OrderGuid", null: false
    t.integer "CustomerId", null: false
    t.integer "OrderStatusId", null: false
    t.integer "ShippingStatusId", null: false
    t.integer "PaymentStatusId", null: false
    t.text "PaymentMethodSystemName"
    t.text "CustomerCurrencyCode"
    t.decimal "CurrencyRate", precision: 18, scale: 8, null: false
    t.integer "CustomerTaxDisplayTypeId", null: false
    t.text "VatNumber"
    t.decimal "OrderSubtotalInclTax", precision: 18, scale: 4, null: false
    t.decimal "OrderSubtotalExclTax", precision: 18, scale: 4, null: false
    t.decimal "OrderSubTotalDiscountInclTax", precision: 18, scale: 4, null: false
    t.decimal "OrderSubTotalDiscountExclTax", precision: 18, scale: 4, null: false
    t.decimal "OrderShippingInclTax", precision: 18, scale: 4, null: false
    t.decimal "OrderShippingExclTax", precision: 18, scale: 4, null: false
    t.decimal "PaymentMethodAdditionalFeeInclTax", precision: 18, scale: 4, null: false
    t.decimal "PaymentMethodAdditionalFeeExclTax", precision: 18, scale: 4, null: false
    t.text "TaxRates"
    t.decimal "OrderTax", precision: 18, scale: 4, null: false
    t.decimal "OrderDiscount", precision: 18, scale: 4, null: false
    t.decimal "OrderTotal", precision: 18, scale: 4, null: false
    t.decimal "RefundedAmount", precision: 18, scale: 4, null: false
    t.text "CheckoutAttributeDescription"
    t.text "CheckoutAttributesXml"
    t.integer "CustomerLanguageId", null: false
    t.integer "AffiliateId", null: false
    t.text "CustomerIp"
    t.boolean "AllowStoringCreditCardNumber", null: false
    t.text "CardType"
    t.text "CardName"
    t.text "CardNumber"
    t.text "MaskedCreditCardNumber"
    t.text "CardCvv2"
    t.text "CardExpirationMonth"
    t.text "CardExpirationYear"
    t.text "AuthorizationTransactionId"
    t.text "AuthorizationTransactionCode"
    t.text "AuthorizationTransactionResult"
    t.text "CaptureTransactionId"
    t.text "CaptureTransactionResult"
    t.text "SubscriptionTransactionId"
    t.datetime "PaidDateUtc"
    t.text "ShippingMethod"
    t.text "ShippingRateComputationMethodSystemName"
    t.boolean "Deleted", null: false
    t.datetime "CreatedOnUtc", null: false
    t.integer "BillingAddressId", null: false
    t.integer "ShippingAddressId"
    t.boolean "RewardPointsWereAdded", null: false
    t.integer "StoreId", null: false
    t.text "CustomValuesXml"
    t.boolean "PickUpInStore", null: false
  end

  create_table "OrderItem", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.uuid "OrderItemGuid", null: false
    t.integer "OrderId", null: false
    t.integer "Quantity", null: false
    t.decimal "UnitPriceInclTax", precision: 18, scale: 4, null: false
    t.decimal "UnitPriceExclTax", precision: 18, scale: 4, null: false
    t.decimal "PriceInclTax", precision: 18, scale: 4, null: false
    t.decimal "PriceExclTax", precision: 18, scale: 4, null: false
    t.decimal "DiscountAmountInclTax", precision: 18, scale: 4, null: false
    t.decimal "DiscountAmountExclTax", precision: 18, scale: 4, null: false
    t.text "AttributeDescription"
    t.text "AttributesXml"
    t.integer "DownloadCount", null: false
    t.boolean "IsDownloadActivated", null: false
    t.integer "LicenseDownloadId"
    t.decimal "ItemWeight", precision: 18, scale: 4
    t.integer "ProductId", null: false
    t.decimal "OriginalProductCost", precision: 18, scale: 4, null: false
    t.datetime "RentalStartDateUtc"
    t.datetime "RentalEndDateUtc"
  end

  create_table "OrderNote", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "OrderId", null: false
    t.text "Note", null: false
    t.boolean "DisplayToCustomer", null: false
    t.datetime "CreatedOnUtc", null: false
    t.integer "DownloadId", null: false
  end

  create_table "PermissionRecord", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.text "Name", null: false
    t.string "SystemName", limit: 255, null: false
    t.string "Category", limit: 255, null: false
  end

  create_table "PermissionRecord_Role_Mapping", primary_key: ["PermissionRecord_Id", "CustomerRole_Id"], force: :cascade do |t|
    t.integer "PermissionRecord_Id", null: false
    t.integer "CustomerRole_Id", null: false
  end

  create_table "Picture", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.binary "PictureBinary"
    t.string "MimeType", limit: 40, null: false
    t.boolean "IsNew", null: false
    t.string "SeoFilename", limit: 300
    t.text "TitleAttribute"
    t.text "AltAttribute"
  end

  create_table "Poll", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "LanguageId", null: false
    t.text "Name", null: false
    t.text "SystemKeyword"
    t.boolean "Published", null: false
    t.boolean "ShowOnHomePage", null: false
    t.integer "DisplayOrder", null: false
    t.datetime "StartDateUtc"
    t.datetime "EndDateUtc"
    t.boolean "AllowGuestsToVote", null: false
  end

  create_table "PollAnswer", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "PollId", null: false
    t.text "Name", null: false
    t.integer "NumberOfVotes", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "PollVotingRecord", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "PollAnswerId", null: false
    t.integer "CustomerId", null: false
    t.datetime "CreatedOnUtc", null: false
  end

  create_table "PredefinedProductAttributeValue", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ProductAttributeId", null: false
    t.string "Name", limit: 400, null: false
    t.decimal "PriceAdjustment", precision: 18, scale: 4, null: false
    t.decimal "WeightAdjustment", precision: 18, scale: 4, null: false
    t.decimal "Cost", precision: 18, scale: 4, null: false
    t.boolean "IsPreSelected", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "Product", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.text "ShortDescription"
    t.text "FullDescription"
    t.text "AdminComment"
    t.boolean "ShowOnHomePage", null: false
    t.string "MetaKeywords", limit: 400
    t.text "MetaDescription"
    t.string "MetaTitle", limit: 400
    t.boolean "AllowCustomerReviews", null: false
    t.integer "ApprovedRatingSum", null: false
    t.integer "NotApprovedRatingSum", null: false
    t.integer "ApprovedTotalReviews", null: false
    t.integer "NotApprovedTotalReviews", null: false
    t.boolean "Published", null: false
    t.boolean "Deleted", null: false
    t.datetime "CreatedOnUtc", null: false
    t.datetime "UpdatedOnUtc", null: false
    t.integer "ProductTemplateId", null: false
    t.boolean "SubjectToAcl", null: false
    t.boolean "LimitedToStores", null: false
    t.integer "VendorId", null: false
    t.integer "ProductTypeId", null: false
    t.integer "ParentGroupedProductId", null: false
    t.string "SKU", limit: 400
    t.string "ManufacturerPartNumber", limit: 400
    t.string "Gtin", limit: 400
    t.boolean "IsGiftCard", null: false
    t.integer "GiftCardTypeId", null: false
    t.boolean "RequireOtherProducts", null: false
    t.string "RequiredProductIds", limit: 1000
    t.boolean "AutomaticallyAddRequiredProducts", null: false
    t.boolean "IsDownload", null: false
    t.integer "DownloadId", null: false
    t.boolean "UnlimitedDownloads", null: false
    t.integer "MaxNumberOfDownloads", null: false
    t.integer "DownloadExpirationDays"
    t.integer "DownloadActivationTypeId", null: false
    t.boolean "HasSampleDownload", null: false
    t.integer "SampleDownloadId", null: false
    t.boolean "HasUserAgreement", null: false
    t.text "UserAgreementText"
    t.boolean "IsRecurring", null: false
    t.integer "RecurringCycleLength", null: false
    t.integer "RecurringCyclePeriodId", null: false
    t.integer "RecurringTotalCycles", null: false
    t.boolean "IsShipEnabled", null: false
    t.boolean "IsFreeShipping", null: false
    t.decimal "AdditionalShippingCharge", precision: 18, scale: 4, null: false
    t.boolean "IsTaxExempt", null: false
    t.integer "TaxCategoryId", null: false
    t.integer "ManageInventoryMethodId", null: false
    t.integer "StockQuantity", null: false
    t.boolean "DisplayStockAvailability", null: false
    t.boolean "DisplayStockQuantity", null: false
    t.integer "MinStockQuantity", null: false
    t.integer "LowStockActivityId", null: false
    t.integer "NotifyAdminForQuantityBelow", null: false
    t.integer "BackorderModeId", null: false
    t.boolean "AllowBackInStockSubscriptions", null: false
    t.integer "OrderMinimumQuantity", null: false
    t.integer "OrderMaximumQuantity", null: false
    t.string "AllowedQuantities", limit: 1000
    t.boolean "DisableBuyButton", null: false
    t.boolean "DisableWishlistButton", null: false
    t.boolean "AvailableForPreOrder", null: false
    t.boolean "CallForPrice", null: false
    t.decimal "Price", precision: 18, scale: 4, null: false
    t.decimal "OldPrice", precision: 18, scale: 4, null: false
    t.decimal "ProductCost", precision: 18, scale: 4, null: false
    t.decimal "SpecialPrice", precision: 18, scale: 4
    t.datetime "SpecialPriceStartDateTimeUtc"
    t.datetime "SpecialPriceEndDateTimeUtc"
    t.boolean "CustomerEntersPrice", null: false
    t.decimal "MinimumCustomerEnteredPrice", precision: 18, scale: 4, null: false
    t.decimal "MaximumCustomerEnteredPrice", precision: 18, scale: 4, null: false
    t.boolean "HasTierPrices", null: false
    t.boolean "HasDiscountsApplied", null: false
    t.decimal "Weight", precision: 18, scale: 4, null: false
    t.decimal "Length", precision: 18, scale: 4, null: false
    t.decimal "Width", precision: 18, scale: 4, null: false
    t.decimal "Height", precision: 18, scale: 4, null: false
    t.datetime "AvailableStartDateTimeUtc"
    t.datetime "AvailableEndDateTimeUtc"
    t.boolean "VisibleIndividually", null: false
    t.integer "DisplayOrder", null: false
    t.datetime "PreOrderAvailabilityStartDateTimeUtc"
    t.integer "DeliveryDateId", null: false
    t.integer "WarehouseId", null: false
    t.boolean "AllowAddingOnlyExistingAttributeCombinations", null: false
    t.boolean "ShipSeparately", null: false
    t.boolean "UseMultipleWarehouses", null: false
    t.boolean "IsRental", null: false
    t.integer "RentalPriceLength", null: false
    t.integer "RentalPricePeriodId", null: false
    t.boolean "IsTelecommunicationsOrBroadcastingOrElectronicServices", null: false
    t.boolean "BasepriceEnabled", null: false
    t.decimal "BasepriceAmount", precision: 18, scale: 4, null: false
    t.integer "BasepriceUnitId", null: false
    t.decimal "BasepriceBaseAmount", precision: 18, scale: 4, null: false
    t.integer "BasepriceBaseUnitId", null: false
    t.decimal "OverriddenGiftCardAmount", precision: 18, scale: 0
    t.boolean "MarkAsNew", null: false
    t.datetime "MarkAsNewStartDateTimeUtc"
    t.datetime "MarkAsNewEndDateTimeUtc"
    t.index ["LimitedToStores"], name: "IX_Product_LimitedToStores"
    t.index ["ParentGroupedProductId"], name: "IX_Product_ParentGroupedProductId"
    t.index ["Price", "AvailableStartDateTimeUtc", "AvailableEndDateTimeUtc", "Published", "Deleted"], name: "IX_Product_PriceDatesEtc"
    t.index ["SubjectToAcl"], name: "IX_Product_SubjectToAcl"
    t.index ["VisibleIndividually"], name: "IX_Product_VisibleIndividually"
  end

  create_table "ProductAttribute", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.text "Name", null: false
    t.text "Description"
  end

  create_table "ProductAttributeCombination", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.text "AttributesXml"
    t.integer "StockQuantity", null: false
    t.boolean "AllowOutOfStockOrders", null: false
    t.string "Sku", limit: 400
    t.string "ManufacturerPartNumber", limit: 400
    t.string "Gtin", limit: 400
    t.integer "ProductId", null: false
    t.decimal "OverriddenPrice", precision: 18, scale: 4
    t.integer "NotifyAdminForQuantityBelow", null: false
  end

  create_table "ProductAttributeValue", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ProductAttributeMappingId", null: false
    t.string "Name", limit: 400, null: false
    t.decimal "PriceAdjustment", precision: 18, scale: 4, null: false
    t.decimal "WeightAdjustment", precision: 18, scale: 4, null: false
    t.boolean "IsPreSelected", null: false
    t.integer "DisplayOrder", null: false
    t.string "ColorSquaresRgb", limit: 100
    t.integer "PictureId", null: false
    t.integer "AttributeValueTypeId", null: false
    t.integer "AssociatedProductId", null: false
    t.decimal "Cost", precision: 18, scale: 4, null: false
    t.integer "Quantity", null: false
    t.index ["ProductAttributeMappingId", "DisplayOrder"], name: "IX_ProductAttributeValue_ProductAttributeMappingId_DisplayOrder"
  end

  create_table "ProductReview", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CustomerId", null: false
    t.integer "ProductId", null: false
    t.boolean "IsApproved", null: false
    t.text "Title"
    t.text "ReviewText"
    t.integer "Rating", null: false
    t.integer "HelpfulYesTotal", null: false
    t.integer "HelpfulNoTotal", null: false
    t.datetime "CreatedOnUtc", null: false
  end

  create_table "ProductReviewHelpfulness", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ProductReviewId", null: false
    t.boolean "WasHelpful", null: false
    t.integer "CustomerId", null: false
  end

  create_table "ProductTag", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.index ["Name"], name: "IX_ProductTag_Name"
  end

  create_table "ProductTemplate", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.string "ViewPath", limit: 400, null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "ProductWarehouseInventory", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ProductId", null: false
    t.integer "WarehouseId", null: false
    t.integer "StockQuantity", null: false
    t.integer "ReservedQuantity", null: false
  end

  create_table "Product_Category_Mapping", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ProductId", null: false
    t.integer "CategoryId", null: false
    t.boolean "IsFeaturedProduct", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "Product_Manufacturer_Mapping", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ProductId", null: false
    t.integer "ManufacturerId", null: false
    t.boolean "IsFeaturedProduct", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "Product_Picture_Mapping", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ProductId", null: false
    t.integer "PictureId", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "Product_ProductAttribute_Mapping", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ProductAttributeId", null: false
    t.text "TextPrompt"
    t.boolean "IsRequired", null: false
    t.integer "AttributeControlTypeId", null: false
    t.integer "DisplayOrder", null: false
    t.integer "ProductId", null: false
    t.integer "ValidationMinLength"
    t.integer "ValidationMaxLength"
    t.text "ValidationFileAllowedExtensions"
    t.integer "ValidationFileMaximumSize"
    t.text "DefaultValue"
    t.text "ConditionAttributeXml"
    t.index ["ProductId", "DisplayOrder"], name: "IX_Product_ProductAttribute_Mapping_ProductId_DisplayOrder"
  end

  create_table "Product_ProductTag_Mapping", primary_key: ["ProductTag_Id", "Product_Id"], force: :cascade do |t|
    t.integer "ProductTag_Id", null: false
    t.integer "Product_Id", null: false
  end

  create_table "Product_SpecificationAttribute_Mapping", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ProductId", null: false
    t.integer "SpecificationAttributeOptionId", null: false
    t.boolean "AllowFiltering", null: false
    t.boolean "ShowOnProductPage", null: false
    t.integer "DisplayOrder", null: false
    t.string "CustomValue"
    t.integer "AttributeTypeId", null: false
    t.index ["ProductId"], name: "IX_PSAM_ProductId"
  end

  create_table "QueuedEmail", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "PriorityId", null: false
    t.string "From", limit: 500, null: false
    t.string "FromName", limit: 500
    t.string "To", limit: 500, null: false
    t.string "ToName", limit: 500
    t.string "CC", limit: 500
    t.string "Bcc", limit: 500
    t.string "Subject", limit: 1000
    t.text "Body"
    t.datetime "CreatedOnUtc", null: false
    t.integer "SentTries", null: false
    t.datetime "SentOnUtc"
    t.integer "EmailAccountId", null: false
    t.text "AttachmentFilePath"
    t.text "AttachmentFileName"
    t.string "ReplyTo", limit: 500
    t.string "ReplyToName", limit: 500
    t.integer "AttachedDownloadId", null: false
  end

  create_table "RecurringPayment", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CycleLength", null: false
    t.integer "CyclePeriodId", null: false
    t.integer "TotalCycles", null: false
    t.datetime "StartDateUtc", null: false
    t.boolean "IsActive", null: false
    t.boolean "Deleted", null: false
    t.datetime "CreatedOnUtc", null: false
    t.integer "InitialOrderId", null: false
  end

  create_table "RecurringPaymentHistory", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "RecurringPaymentId", null: false
    t.integer "OrderId", null: false
    t.datetime "CreatedOnUtc", null: false
  end

  create_table "RelatedProduct", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ProductId1", null: false
    t.integer "ProductId2", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "ReturnRequest", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "OrderItemId", null: false
    t.integer "CustomerId", null: false
    t.integer "Quantity", null: false
    t.text "ReasonForReturn", null: false
    t.text "RequestedAction", null: false
    t.text "CustomerComments"
    t.text "StaffNotes"
    t.integer "ReturnRequestStatusId", null: false
    t.datetime "CreatedOnUtc", null: false
    t.datetime "UpdatedOnUtc", null: false
    t.integer "StoreId", null: false
  end

  create_table "ReturnRequestAction", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "ReturnRequestReason", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "RewardPointsHistory", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CustomerId", null: false
    t.integer "Points", null: false
    t.integer "PointsBalance", null: false
    t.decimal "UsedAmount", precision: 18, scale: 4, null: false
    t.text "Message"
    t.datetime "CreatedOnUtc", null: false
    t.integer "UsedWithOrder_Id"
    t.integer "StoreId", null: false
  end

  create_table "ScheduleTask", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.text "Name", null: false
    t.integer "Seconds", null: false
    t.text "Type", null: false
    t.boolean "Enabled", null: false
    t.boolean "StopOnError", null: false
    t.datetime "LastStartUtc"
    t.datetime "LastEndUtc"
    t.datetime "LastSuccessUtc"
    t.text "LeasedByMachineName"
    t.datetime "LeasedUntilUtc"
  end

  create_table "SearchTerm", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.text "Keyword", null: false
    t.integer "StoreId", null: false
    t.integer "Count", null: false
  end

  create_table "Setting", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 200, null: false
    t.string "Value", limit: 2000, null: false
    t.integer "StoreId", null: false
  end

  create_table "Shipment", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "OrderId", null: false
    t.text "TrackingNumber"
    t.datetime "ShippedDateUtc"
    t.datetime "DeliveryDateUtc"
    t.datetime "CreatedOnUtc", null: false
    t.decimal "TotalWeight", precision: 18, scale: 4
    t.text "AdminComment"
  end

  create_table "ShipmentItem", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ShipmentId", null: false
    t.integer "OrderItemId", null: false
    t.integer "Quantity", null: false
    t.integer "WarehouseId", null: false
  end

  create_table "ShippingByWeight", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CountryId", null: false
    t.integer "ShippingMethodId", null: false
    t.decimal "From", precision: 18, scale: 2, null: false
    t.decimal "To", precision: 18, scale: 2, null: false
    t.integer "StateProvinceId", null: false
    t.string "Zip", limit: 400
    t.decimal "AdditionalFixedCost", precision: 18, scale: 2, null: false
    t.decimal "PercentageRateOfSubtotal", precision: 18, scale: 2
    t.decimal "RatePerWeightUnit", precision: 18, scale: 2
    t.decimal "LowerWeightLimit", precision: 18, scale: 2, null: false
    t.integer "StoreId", null: false
    t.integer "WarehouseId", null: false
  end

  create_table "ShippingMethod", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.text "Description"
    t.integer "DisplayOrder", null: false
  end

  create_table "ShippingMethodRestrictions", primary_key: ["ShippingMethod_Id", "Country_Id"], force: :cascade do |t|
    t.integer "ShippingMethod_Id", null: false
    t.integer "Country_Id", null: false
  end

  create_table "ShoppingCartItem", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "ShoppingCartTypeId", null: false
    t.integer "CustomerId", null: false
    t.text "AttributesXml"
    t.decimal "CustomerEnteredPrice", precision: 18, scale: 4, null: false
    t.integer "Quantity", null: false
    t.datetime "CreatedOnUtc", null: false
    t.datetime "UpdatedOnUtc", null: false
    t.integer "StoreId", null: false
    t.integer "ProductId", null: false
    t.datetime "RentalStartDateUtc"
    t.datetime "RentalEndDateUtc"
  end

  create_table "SpecificationAttribute", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.text "Name", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "SpecificationAttributeOption", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "SpecificationAttributeId", null: false
    t.text "Name", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "StateProvince", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CountryId", null: false
    t.string "Name", limit: 100, null: false
    t.string "Abbreviation", limit: 100
    t.boolean "Published", null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "Store", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.string "Url", limit: 400, null: false
    t.boolean "SslEnabled", null: false
    t.string "SecureUrl", limit: 400
    t.string "Hosts", limit: 1000
    t.integer "DisplayOrder", null: false
    t.string "CompanyName", limit: 1000
    t.string "CompanyAddress", limit: 1000
    t.string "CompanyPhoneNumber", limit: 1000
    t.string "CompanyVat", limit: 1000
    t.integer "DefaultLanguageId", null: false
  end

  create_table "StoreMapping", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "EntityId", null: false
    t.string "EntityName", limit: 400, null: false
    t.integer "StoreId", null: false
    t.index ["EntityId", "EntityName"], name: "IX_StoreMapping_EntityId_EntityName"
  end

  create_table "TaxCategory", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "TaxRate", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "TaxCategoryId", null: false
    t.integer "CountryId", null: false
    t.integer "StateProvinceId", null: false
    t.text "Zip"
    t.decimal "Percentage", precision: 18, scale: 4, null: false
    t.integer "StoreId", null: false
  end

  create_table "TierPrice", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "CustomerRoleId"
    t.integer "Quantity", null: false
    t.decimal "Price", precision: 18, scale: 4, null: false
    t.integer "StoreId", null: false
    t.integer "ProductId", null: false
  end

  create_table "Topic", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.text "SystemName"
    t.boolean "IncludeInSitemap", null: false
    t.boolean "IsPasswordProtected", null: false
    t.text "Password"
    t.text "Title"
    t.text "Body"
    t.text "MetaKeywords"
    t.text "MetaDescription"
    t.text "MetaTitle"
    t.boolean "LimitedToStores", null: false
    t.boolean "IncludeInTopMenu", null: false
    t.integer "TopicTemplateId", null: false
    t.boolean "IncludeInFooterColumn1", null: false
    t.boolean "IncludeInFooterColumn2", null: false
    t.boolean "IncludeInFooterColumn3", null: false
    t.boolean "AccessibleWhenStoreClosed", null: false
    t.integer "DisplayOrder", null: false
    t.boolean "SubjectToAcl", null: false
  end

  create_table "TopicTemplate", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.string "ViewPath", limit: 400, null: false
    t.integer "DisplayOrder", null: false
  end

  create_table "UrlRecord", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "EntityId", null: false
    t.string "EntityName", limit: 400, null: false
    t.string "Slug", limit: 400, null: false
    t.integer "LanguageId", null: false
    t.boolean "IsActive", null: false
    t.index ["EntityId", "EntityName", "LanguageId", "IsActive"], name: "IX_UrlRecord_Custom_1"
    t.index ["Slug"], name: "IX_UrlRecord_Slug"
  end

  create_table "Vendor", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.string "Email", limit: 400, null: false
    t.text "Description"
    t.text "AdminComment"
    t.boolean "Active", null: false
    t.boolean "Deleted", null: false
    t.string "MetaKeywords", limit: 400
    t.text "MetaDescription"
    t.string "MetaTitle", limit: 400
    t.integer "PageSize", null: false
    t.boolean "AllowCustomersToSelectPageSize", null: false
    t.string "PageSizeOptions", limit: 200
    t.integer "DisplayOrder", null: false
    t.integer "PictureId", null: false
  end

  create_table "VendorNote", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.integer "VendorId", null: false
    t.text "Note", null: false
    t.datetime "CreatedOnUtc", null: false
  end

  create_table "VietlottVN", primary_key: "VietLottID", id: :integer, force: :cascade do |t|
    t.integer "DrawId", default: 0, null: false
    t.datetime "DayPrize", null: false
    t.varchar "FullBlockNumber", limit: 100, null: false
    t.integer "NumberOne", null: false
    t.integer "NumberTwo", null: false
    t.integer "NumberThree", null: false
    t.integer "NumberFour", null: false
    t.integer "NumberFive", null: false
    t.integer "NumberSix", null: false
    t.datetime "ImportDate", null: false
  end

  create_table "Warehouse", primary_key: "Id", id: :integer, force: :cascade do |t|
    t.string "Name", limit: 400, null: false
    t.integer "AddressId", null: false
    t.text "AdminComment"
  end

  create_table "__MigrationHistory", id: false, force: :cascade do |t|
    t.string "MigrationId", limit: 150, null: false
    t.string "ContextKey", limit: 300, null: false
    t.binary "Model", null: false
    t.string "ProductVersion", limit: 32, null: false
  end

  create_table "tung_tests", force: :cascade do |t|
    t.string "test_column"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "AclRecord", "CustomerRole", column: "CustomerRoleId", primary_key: "Id", name: "AclRecord_CustomerRole", on_delete: :cascade
  add_foreign_key "ActivityLog", "ActivityLogType", column: "ActivityLogTypeId", primary_key: "Id", name: "ActivityLog_ActivityLogType", on_delete: :cascade
  add_foreign_key "ActivityLog", "Customer", column: "CustomerId", primary_key: "Id", name: "ActivityLog_Customer", on_delete: :cascade
  add_foreign_key "Address", "Country", column: "CountryId", primary_key: "Id", name: "Address_Country"
  add_foreign_key "Address", "StateProvince", column: "StateProvinceId", primary_key: "Id", name: "Address_StateProvince"
  add_foreign_key "AddressAttributeValue", "AddressAttribute", column: "AddressAttributeId", primary_key: "Id", name: "AddressAttributeValue_AddressAttribute", on_delete: :cascade
  add_foreign_key "Affiliate", "Address", column: "AddressId", primary_key: "Id", name: "Affiliate_Address"
  add_foreign_key "BackInStockSubscription", "Customer", column: "CustomerId", primary_key: "Id", name: "BackInStockSubscription_Customer", on_delete: :cascade
  add_foreign_key "BackInStockSubscription", "Product", column: "ProductId", primary_key: "Id", name: "BackInStockSubscription_Product", on_delete: :cascade
  add_foreign_key "BlogComment", "BlogPost", column: "BlogPostId", primary_key: "Id", name: "BlogComment_BlogPost", on_delete: :cascade
  add_foreign_key "BlogComment", "Customer", column: "CustomerId", primary_key: "Id", name: "BlogComment_Customer", on_delete: :cascade
  add_foreign_key "BlogPost", "Language", column: "LanguageId", primary_key: "Id", name: "BlogPost_Language", on_delete: :cascade
  add_foreign_key "CheckoutAttributeValue", "CheckoutAttribute", column: "CheckoutAttributeId", primary_key: "Id", name: "CheckoutAttributeValue_CheckoutAttribute", on_delete: :cascade
  add_foreign_key "Customer", "Address", column: "BillingAddress_Id", primary_key: "Id", name: "Customer_BillingAddress"
  add_foreign_key "Customer", "Address", column: "ShippingAddress_Id", primary_key: "Id", name: "Customer_ShippingAddress"
  add_foreign_key "CustomerAddresses", "Address", column: "Address_Id", primary_key: "Id", name: "Customer_Addresses_Target", on_delete: :cascade
  add_foreign_key "CustomerAddresses", "Customer", column: "Customer_Id", primary_key: "Id", name: "Customer_Addresses_Source", on_delete: :cascade
  add_foreign_key "CustomerAttributeValue", "CustomerAttribute", column: "CustomerAttributeId", primary_key: "Id", name: "CustomerAttributeValue_CustomerAttribute", on_delete: :cascade
  add_foreign_key "Customer_CustomerRole_Mapping", "Customer", column: "Customer_Id", primary_key: "Id", name: "CustomerRole_Customers_Target", on_delete: :cascade
  add_foreign_key "Customer_CustomerRole_Mapping", "CustomerRole", column: "CustomerRole_Id", primary_key: "Id", name: "CustomerRole_Customers_Source", on_delete: :cascade
  add_foreign_key "DiscountRequirement", "Discount", column: "DiscountId", primary_key: "Id", name: "Discount_DiscountRequirements", on_delete: :cascade
  add_foreign_key "DiscountUsageHistory", "Discount", column: "DiscountId", primary_key: "Id", name: "DiscountUsageHistory_Discount", on_delete: :cascade
  add_foreign_key "DiscountUsageHistory", "Order", column: "OrderId", primary_key: "Id", name: "DiscountUsageHistory_Order", on_delete: :cascade
  add_foreign_key "Discount_AppliedToCategories", "Category", column: "Category_Id", primary_key: "Id", name: "Discount_AppliedToCategories_Target", on_delete: :cascade
  add_foreign_key "Discount_AppliedToCategories", "Discount", column: "Discount_Id", primary_key: "Id", name: "Discount_AppliedToCategories_Source", on_delete: :cascade
  add_foreign_key "Discount_AppliedToManufacturers", "Discount", column: "Discount_Id", primary_key: "Id", name: "Discount_AppliedToManufacturers_Source", on_delete: :cascade
  add_foreign_key "Discount_AppliedToManufacturers", "Manufacturer", column: "Manufacturer_Id", primary_key: "Id", name: "Discount_AppliedToManufacturers_Target", on_delete: :cascade
  add_foreign_key "Discount_AppliedToProducts", "Discount", column: "Discount_Id", primary_key: "Id", name: "Discount_AppliedToProducts_Source", on_delete: :cascade
  add_foreign_key "Discount_AppliedToProducts", "Product", column: "Product_Id", primary_key: "Id", name: "Discount_AppliedToProducts_Target", on_delete: :cascade
  add_foreign_key "ExternalAuthenticationRecord", "Customer", column: "CustomerId", primary_key: "Id", name: "ExternalAuthenticationRecord_Customer", on_delete: :cascade
  add_foreign_key "Forums_Forum", "Forums_Group", column: "ForumGroupId", primary_key: "Id", name: "Forum_ForumGroup", on_delete: :cascade
  add_foreign_key "Forums_Post", "Customer", column: "CustomerId", primary_key: "Id", name: "ForumPost_Customer"
  add_foreign_key "Forums_Post", "Forums_Topic", column: "TopicId", primary_key: "Id", name: "ForumPost_ForumTopic", on_delete: :cascade
  add_foreign_key "Forums_PrivateMessage", "Customer", column: "FromCustomerId", primary_key: "Id", name: "PrivateMessage_FromCustomer"
  add_foreign_key "Forums_PrivateMessage", "Customer", column: "ToCustomerId", primary_key: "Id", name: "PrivateMessage_ToCustomer"
  add_foreign_key "Forums_Subscription", "Customer", column: "CustomerId", primary_key: "Id", name: "ForumSubscription_Customer"
  add_foreign_key "Forums_Topic", "Customer", column: "CustomerId", primary_key: "Id", name: "ForumTopic_Customer"
  add_foreign_key "Forums_Topic", "Forums_Forum", column: "ForumId", primary_key: "Id", name: "ForumTopic_Forum", on_delete: :cascade
  add_foreign_key "GiftCard", "OrderItem", column: "PurchasedWithOrderItemId", primary_key: "Id", name: "GiftCard_PurchasedWithOrderItem"
  add_foreign_key "GiftCardUsageHistory", "GiftCard", column: "GiftCardId", primary_key: "Id", name: "GiftCardUsageHistory_GiftCard", on_delete: :cascade
  add_foreign_key "GiftCardUsageHistory", "Order", column: "UsedWithOrderId", primary_key: "Id", name: "GiftCardUsageHistory_UsedWithOrder", on_delete: :cascade
  add_foreign_key "LocaleStringResource", "Language", column: "LanguageId", primary_key: "Id", name: "LocaleStringResource_Language", on_delete: :cascade
  add_foreign_key "LocalizedProperty", "Language", column: "LanguageId", primary_key: "Id", name: "LocalizedProperty_Language", on_delete: :cascade
  add_foreign_key "Log", "Customer", column: "CustomerId", primary_key: "Id", name: "Log_Customer", on_delete: :cascade
  add_foreign_key "News", "Language", column: "LanguageId", primary_key: "Id", name: "NewsItem_Language", on_delete: :cascade
  add_foreign_key "NewsComment", "Customer", column: "CustomerId", primary_key: "Id", name: "NewsComment_Customer", on_delete: :cascade
  add_foreign_key "NewsComment", "News", column: "NewsItemId", primary_key: "Id", name: "NewsComment_NewsItem", on_delete: :cascade
  add_foreign_key "Order", "Address", column: "BillingAddressId", primary_key: "Id", name: "Order_BillingAddress"
  add_foreign_key "Order", "Address", column: "ShippingAddressId", primary_key: "Id", name: "Order_ShippingAddress"
  add_foreign_key "Order", "Customer", column: "CustomerId", primary_key: "Id", name: "Order_Customer", on_delete: :cascade
  add_foreign_key "OrderItem", "Order", column: "OrderId", primary_key: "Id", name: "OrderItem_Order", on_delete: :cascade
  add_foreign_key "OrderItem", "Product", column: "ProductId", primary_key: "Id", name: "OrderItem_Product", on_delete: :cascade
  add_foreign_key "OrderNote", "Order", column: "OrderId", primary_key: "Id", name: "OrderNote_Order", on_delete: :cascade
  add_foreign_key "PermissionRecord_Role_Mapping", "CustomerRole", column: "CustomerRole_Id", primary_key: "Id", name: "PermissionRecord_CustomerRoles_Target", on_delete: :cascade
  add_foreign_key "PermissionRecord_Role_Mapping", "PermissionRecord", column: "PermissionRecord_Id", primary_key: "Id", name: "PermissionRecord_CustomerRoles_Source", on_delete: :cascade
  add_foreign_key "Poll", "Language", column: "LanguageId", primary_key: "Id", name: "Poll_Language", on_delete: :cascade
  add_foreign_key "PollAnswer", "Poll", column: "PollId", primary_key: "Id", name: "PollAnswer_Poll", on_delete: :cascade
  add_foreign_key "PollVotingRecord", "Customer", column: "CustomerId", primary_key: "Id", name: "PollVotingRecord_Customer", on_delete: :cascade
  add_foreign_key "PollVotingRecord", "PollAnswer", column: "PollAnswerId", primary_key: "Id", name: "PollVotingRecord_PollAnswer", on_delete: :cascade
  add_foreign_key "PredefinedProductAttributeValue", "ProductAttribute", column: "ProductAttributeId", primary_key: "Id", name: "PredefinedProductAttributeValue_ProductAttribute", on_delete: :cascade
  add_foreign_key "ProductAttributeCombination", "Product", column: "ProductId", primary_key: "Id", name: "ProductAttributeCombination_Product", on_delete: :cascade
  add_foreign_key "ProductAttributeValue", "Product_ProductAttribute_Mapping", column: "ProductAttributeMappingId", primary_key: "Id", name: "ProductAttributeValue_ProductAttributeMapping", on_delete: :cascade
  add_foreign_key "ProductReview", "Customer", column: "CustomerId", primary_key: "Id", name: "ProductReview_Customer", on_delete: :cascade
  add_foreign_key "ProductReview", "Product", column: "ProductId", primary_key: "Id", name: "ProductReview_Product", on_delete: :cascade
  add_foreign_key "ProductReviewHelpfulness", "ProductReview", column: "ProductReviewId", primary_key: "Id", name: "ProductReviewHelpfulness_ProductReview", on_delete: :cascade
  add_foreign_key "ProductWarehouseInventory", "Product", column: "ProductId", primary_key: "Id", name: "ProductWarehouseInventory_Product", on_delete: :cascade
  add_foreign_key "ProductWarehouseInventory", "Warehouse", column: "WarehouseId", primary_key: "Id", name: "ProductWarehouseInventory_Warehouse", on_delete: :cascade
  add_foreign_key "Product_Category_Mapping", "Category", column: "CategoryId", primary_key: "Id", name: "ProductCategory_Category", on_delete: :cascade
  add_foreign_key "Product_Category_Mapping", "Product", column: "ProductId", primary_key: "Id", name: "ProductCategory_Product", on_delete: :cascade
  add_foreign_key "Product_Manufacturer_Mapping", "Manufacturer", column: "ManufacturerId", primary_key: "Id", name: "ProductManufacturer_Manufacturer", on_delete: :cascade
  add_foreign_key "Product_Manufacturer_Mapping", "Product", column: "ProductId", primary_key: "Id", name: "ProductManufacturer_Product", on_delete: :cascade
  add_foreign_key "Product_Picture_Mapping", "Picture", column: "PictureId", primary_key: "Id", name: "ProductPicture_Picture", on_delete: :cascade
  add_foreign_key "Product_Picture_Mapping", "Product", column: "ProductId", primary_key: "Id", name: "ProductPicture_Product", on_delete: :cascade
  add_foreign_key "Product_ProductAttribute_Mapping", "Product", column: "ProductId", primary_key: "Id", name: "ProductAttributeMapping_Product", on_delete: :cascade
  add_foreign_key "Product_ProductAttribute_Mapping", "ProductAttribute", column: "ProductAttributeId", primary_key: "Id", name: "ProductAttributeMapping_ProductAttribute", on_delete: :cascade
  add_foreign_key "Product_ProductTag_Mapping", "Product", column: "Product_Id", primary_key: "Id", name: "ProductTag_Products_Target", on_delete: :cascade
  add_foreign_key "Product_ProductTag_Mapping", "ProductTag", column: "ProductTag_Id", primary_key: "Id", name: "ProductTag_Products_Source", on_delete: :cascade
  add_foreign_key "Product_SpecificationAttribute_Mapping", "Product", column: "ProductId", primary_key: "Id", name: "ProductSpecificationAttribute_Product", on_delete: :cascade
  add_foreign_key "Product_SpecificationAttribute_Mapping", "SpecificationAttributeOption", column: "SpecificationAttributeOptionId", primary_key: "Id", name: "ProductSpecificationAttribute_SpecificationAttributeOption", on_delete: :cascade
  add_foreign_key "QueuedEmail", "EmailAccount", column: "EmailAccountId", primary_key: "Id", name: "QueuedEmail_EmailAccount", on_delete: :cascade
  add_foreign_key "RecurringPayment", "Order", column: "InitialOrderId", primary_key: "Id", name: "RecurringPayment_InitialOrder"
  add_foreign_key "RecurringPaymentHistory", "RecurringPayment", column: "RecurringPaymentId", primary_key: "Id", name: "RecurringPaymentHistory_RecurringPayment", on_delete: :cascade
  add_foreign_key "ReturnRequest", "Customer", column: "CustomerId", primary_key: "Id", name: "ReturnRequest_Customer", on_delete: :cascade
  add_foreign_key "RewardPointsHistory", "Customer", column: "CustomerId", primary_key: "Id", name: "RewardPointsHistory_Customer", on_delete: :cascade
  add_foreign_key "RewardPointsHistory", "Order", column: "UsedWithOrder_Id", primary_key: "Id", name: "RewardPointsHistory_UsedWithOrder"
  add_foreign_key "Shipment", "Order", column: "OrderId", primary_key: "Id", name: "Shipment_Order", on_delete: :cascade
  add_foreign_key "ShipmentItem", "Shipment", column: "ShipmentId", primary_key: "Id", name: "ShipmentItem_Shipment", on_delete: :cascade
  add_foreign_key "ShippingMethodRestrictions", "Country", column: "Country_Id", primary_key: "Id", name: "ShippingMethod_RestrictedCountries_Target", on_delete: :cascade
  add_foreign_key "ShippingMethodRestrictions", "ShippingMethod", column: "ShippingMethod_Id", primary_key: "Id", name: "ShippingMethod_RestrictedCountries_Source", on_delete: :cascade
  add_foreign_key "ShoppingCartItem", "Customer", column: "CustomerId", primary_key: "Id", name: "ShoppingCartItem_Customer", on_delete: :cascade
  add_foreign_key "ShoppingCartItem", "Product", column: "ProductId", primary_key: "Id", name: "ShoppingCartItem_Product", on_delete: :cascade
  add_foreign_key "SpecificationAttributeOption", "SpecificationAttribute", column: "SpecificationAttributeId", primary_key: "Id", name: "SpecificationAttributeOption_SpecificationAttribute", on_delete: :cascade
  add_foreign_key "StateProvince", "Country", column: "CountryId", primary_key: "Id", name: "StateProvince_Country", on_delete: :cascade
  add_foreign_key "StoreMapping", "Store", column: "StoreId", primary_key: "Id", name: "StoreMapping_Store", on_delete: :cascade
  add_foreign_key "TierPrice", "CustomerRole", column: "CustomerRoleId", primary_key: "Id", name: "TierPrice_CustomerRole", on_delete: :cascade
  add_foreign_key "TierPrice", "Product", column: "ProductId", primary_key: "Id", name: "TierPrice_Product", on_delete: :cascade
  add_foreign_key "VendorNote", "Vendor", column: "VendorId", primary_key: "Id", name: "VendorNote_Vendor", on_delete: :cascade
end
