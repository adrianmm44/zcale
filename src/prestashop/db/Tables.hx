package prestashop.db;

class Tables
{
	public static inline var ACCESS    		 							  : String = "access";
	public static inline var ACCESSORY 		 							  : String = "accessory";	
	public static inline var ADDRESS 		 							  : String = "address";
	public static inline var ADDRESS_FORMAT  							  : String = "address_format";		
	public static inline var ADVICE 	 	 							  : String = "advice";
	public static inline var ADVICE_LANG 	 							  : String = "advice_lang";		
	public static inline var ATTACHMENT 	 							  : String = "attachment";
	public static inline var ATTACHMENT_LANG 			  				  : String = "attachment_lang";
	
	public static inline var ATTRIBUTE 			  						  : String = "attribute";
	public static inline var ATTRIBUTE_GROUP 	  						  : String = "attribute_group";
	public static inline var ATTRIBUTE_GROUP_LANG 						  : String = "attribute_group_lang";
	public static inline var ATTRIBUTE_GROUP_SHOP 						  : String = "attribute_group_shop";
	public static inline var ATTRIBUTE_IMPACT 	  						  : String = "attribute_impact";
	public static inline var ATTRIBUTE_LANG 	  						  : String = "attribute_lang";
	public static inline var ATTRIBUTE_SHOP 	  						  : String = "attribute_shop";
	
	public static inline var BADGE 										  : String = "badge";
	public static inline var BADGE_LANG 								  : String = "badge_lang";	
	public static inline var BLMOD_XML_AFFILIATE_PRICE 					  : String = "blmod_xml_affiliate_price";
	public static inline var BLMOD_XML_BLOCK 		   					  : String = "blmod_xml_block";
	public static inline var BLMOD_XML_FEEDS 		   					  : String = "blmod_xml_feeds";
	public static inline var BLMOD_XML_FEEDS_CACHE 	   					  : String = "blmod_xml_feeds_cache";
	public static inline var BLMOD_XML_FIELDS 		   					  : String = "blmod_xml_fields";
	public static inline var BLMOD_XML_STATISTICS 	   					  : String = "blmod_xml_statistics";
	
	public static inline var CARRIER 					  				  : String = "carrier";
	public static inline var CARRIER_GROUP 				  				  : String = "carrier_group";
	public static inline var CARRIER_LANG 				  				  : String = "carrier_lang";
	public static inline var CARRIER_SHOP 				  				  : String = "carrier_shop";
	public static inline var CARRIER_TAX_RULES_GROUP_SHOP 				  : String = "carrier_tax_rules_group_shop";
	public static inline var CARRIER_ZONE 				  				  : String = "carrier_zone";
	
	public static inline var CART 						  				  : String = "cart";
	public static inline var CART_CART_RULE 			  				  : String = "cart_cart_rule";
	public static inline var CART_PRODUCT 				  				  : String = "cart_product";
	public static inline var CART_RULE 					  				  : String = "cart_rule";
	public static inline var CART_RULE_CARRIER 			  				  : String = "cart_rule_carrier";
	public static inline var CART_RULE_COMBINATION 		  				  : String = "cart_rule_combination";
	public static inline var CART_RULE_COUNTRY 			  				  : String = "cart_rule_country";
	public static inline var CART_RULE_GROUP 			  				  : String = "cart_rule_group";
	public static inline var CART_RULE_LANG 			  				  : String = "cart_rule_lang";
	public static inline var CART_RULE_PRODUCT_RULE 	  				  : String = "cart_rule_product_rule";
	public static inline var CART_RULE_PRODUCT_RULE_GROUP 				  : String = "cart_rule_product_rule_group";
	public static inline var CART_RULE_PRODUCT_RULE_VALUE 				  : String = "cart_rule_product_rule_value";
	public static inline var CART_RULE_SHOP 			  				  : String = "cart_rule_shop";
	
	public static inline var CATEGORY 		   							  : String = "category";
	public static inline var CATEGORY_GROUP    							  : String = "category_lang";
	public static inline var CATEGORY_LANG 	   							  : String = "category_lang";
	public static inline var CATEGORY_PRODUCT  							  : String = "category_product";
	public static inline var CATEGORY_SHOP 	   							  : String = "category_shop";
	
	public static inline var CMS 			   							  : String = "cms";
	public static inline var CMS_BLOCK 		   							  : String = "cms_block";
	public static inline var CMS_BLOCK_LANG    							  : String = "cms_block_lang";
	public static inline var CMS_BLOCK_PAGE    							  : String = "cms_block_page";
	public static inline var CMS_BLOCK_SHOP    							  : String = "cms_block_shop";
	public static inline var CMS_CATEGORY 	   							  : String = "cms_category";
	public static inline var CMS_CATEGORY_LANG 							  : String = "cms_category_lang";
	public static inline var CMS_LANG 		   							  : String = "cms_lang";
	public static inline var CMS_SHOP 		   							  : String = "cms_shop";
	
	public static inline var COMPARE 		 							  : String = "compare";
	public static inline var COMPARE_PRODUCT 							  : String = "compare_product";
	
	public static inline var CONDITION 		  							  : String = "condition";
	public static inline var CONDITION_ADVICE 							  : String = "condition_advice";
	public static inline var CONDITION_BADGE  							  : String = "condition_badge";
	
	public static inline var CONFIGURATION 								  : String = "configuration";
	public static inline var CONFIGURATION_KPI 							  : String = "configuration_kpi";
	public static inline var CONFIGURATION_KPI_LANG 					  : String = "configuration_kpi_lang";
	public static inline var CONFIGURATION_LANG 						  : String = "configuration_lang";
	
	public static inline var CONNECTIONS 								  : String = "connections";
	public static inline var CONNECTIONS_PAGE 							  : String = "connections_page";
	public static inline var CONNECTIONS_SOURCE 						  : String = "connections_source";
	
	public static inline var CONTACT 	  								  : String = "contact";
	public static inline var CONTACT_LANG 								  : String = "contact_lang";
	public static inline var CONTACT_SHOP 								  : String = "contact_shop";
	
	public static inline var CONTENTBOX 	  							  : String = "contentbox";
	public static inline var CONTENTBOX_FILES 							  : String = "contentbox_files";
	
	public static inline var COUNTRY 	  								  : String = "country";
	public static inline var COUNTRY_LANG 								  : String = "country_lang";
	public static inline var COUNTRY_SHOP 								  : String = "country_shop";
	
	public static inline var CRONJOBS 	   								  : String = "cronjobs";
	public static inline var CURRENCY 	   								  : String = "currency";
	public static inline var CURRENCY_SHOP 								  : String = "currency_shop";
	
	public static inline var CUSTOMER 									  : String = "customer";
	public static inline var CUSTOMER_GROUP 							  : String = "customer_group";
	public static inline var CUSTOMER_MESSAGE 							  : String = "customer_message";
	public static inline var CUSTOMER_MESSAGE_SYNC_IMAP 				  : String = "customer_message_sync_imap";
	public static inline var CUSTOMER_THREAD 							  : String = "customer_thread";
	
	public static inline var CUSTOMIZATION 			  					  : String = "customization";
	public static inline var CUSTOMIZATION_FIELD 	  					  : String = "customization_field";
	public static inline var CUSTOMIZATION_FIELD_LANG 					  : String = "customization_field_lang";
	public static inline var CUSTOMIZED_DATA 		  					  : String = "customized_data";
	
	public static inline var DATE_RANGE 		   						  : String = "date_range";
	public static inline var DDW 				   						  : String = "ddw";
	public static inline var DDW_BLOCKED_DATES 	   						  : String = "ddw_blocked_dates";
	public static inline var DDW_TIMESLOTS 		   						  : String = "ddw_timeslots";
	public static inline var DDW_TIMESLOTS_LANG    						  : String = "ddw_timeslots_lang";
	public static inline var DDW_TRANSLATIONS 	   						  : String = "ddw_translations";
	public static inline var DDW_TRANSLATIONS_LANG 						  : String = "ddw_translations_lang";
	public static inline var DELIVERY 	   								  : String = "delivery";
	
	public static inline var EMPLOYEE 	   								  : String = "employee";
	public static inline var EMPLOYEE_SHOP 								  : String = "employee_shop";
	
	public static inline var FEATURE 									  : String = "feature";
	public static inline var FEATURE_LANG 								  : String = "feature_lang";
	public static inline var FEATURE_PRODUCT 							  : String = "feature_product";
	public static inline var FEATURE_SHOP 								  : String = "feature_shop";
	public static inline var FEATURE_VALUE 								  : String = "feature_value";
	public static inline var FEATURE_VALUE_LANG 						  : String = "feature_value_lang";	
	public static inline var FEEDBACK_MODULE 							  : String = "feedback_module";
	
	public static inline var GANALYTICS 								  : String = "ganalytics";
	public static inline var GENDER 	 								  : String = "gender";
	public static inline var GENDER_LANG 								  : String = "gender_lang";
	
	public static inline var GROUP 			 							  : String = "group";
	public static inline var GROUP_LANG 	 							  : String = "group_lang";
	public static inline var GROUP_REDUCTION 							  : String = "group_reduction";
	public static inline var GROUP_SHOP 	 							  : String = "group_shop";
	
	public static inline var GSITEMAP_SITEMAP 							  : String = "gsitemap_sitemap";	
	public static inline var GUEST 			  							  : String = "guest";
	
	public static inline var HOMESLIDER 								  : String = "homeslider";
	public static inline var HOMESLIDER_SLIDES 							  : String = "homeslider_slides";
	public static inline var HOMESLIDER_SLIDES_LANG 					  : String = "homeslider_slides_lang";
	
	public static inline var HOOK 				   						  : String = "hook";
	public static inline var HOOK_ALIAS 		   						  : String = "hook_alias";
	public static inline var HOOK_MODULE 		   						  : String = "hook_module";
	public static inline var HOOK_MODULE_EXCEPTIONS 					  : String = "hook_module_exceptions";
	
	public static inline var IMAGE 										  : String = "image";
	public static inline var IMAGE_LANG 								  : String = "image_lang";
	public static inline var IMAGE_SHOP 								  : String = "image_shop";
	public static inline var IMAGE_TYPE 								  : String = "image_type";
	
	public static inline var IM_BANNERS 								  : String = "imBanners";	
	public static inline var IMPORT_MATCH 								  : String = "import_match";
	public static inline var INFO 		  								  : String = "info";
	public static inline var INFO_LANG 	  								  : String = "info_lang";
	public static inline var LANG 		  								  : String = "lang";
	public static inline var LANG_SHOP 	  								  : String = "lang_shop";
	
	public static inline var LAYERED_CATEGORY 							  : String = "layered_category";
	public static inline var LAYERED_FILTER 							  : String = "layered_filter";
	public static inline var LAYERED_FILTER_SHOP 						  : String = "layered_filter_shop";
	public static inline var LAYERED_FRIENDLY_URL 						  : String = "layered_friendly_url";
	public static inline var LAYERED_INDEXABLE_ATTRIBUTE_GROUP 			  : String = "layered_indexable_attribute_group";
	public static inline var LAYERED_INDEXABLE_ATTRIBUTE_GROUP_LANG_VALUE : String = "layered_indexable_attribute_group_lang_value";
	public static inline var LAYERED_INDEXABLE_ATTRIBUTE_LANG_VALUE 	  : String = "layered_indexable_attribute_lang_value";
	public static inline var LAYERED_INDEXABLE_FEATURE 					  : String = "layered_indexable_feature";
	public static inline var LAYERED_INDEXABLE_FEATURE_LANG_VALUE 		  : String = "layered_indexable_feature_lang_value";
	public static inline var LAYERED_INDEXABLE_FEATURE_VALUE_LANG_VALUE   : String = "layered_indexable_feature_value_lang_value";
	public static inline var LAYERED_PRICE_INDEX 						  : String = "layered_price_index";
	public static inline var LAYERED_PRODUCT_ATTRIBUTE 					  : String = "layered_product_attribute";
	
	public static inline var LEOBLOG_BLOG 								  : String = "leoblog_blog";
	public static inline var LEOBLOG_BLOG_LANG							  : String = "leoblog_blog_lang";
	public static inline var LEOBLOG_BLOG_SHOP							  : String = "leoblog_blog_shop";
	public static inline var LEOBLOG_COMMENT 							  : String = "leoblog_comment";
	public static inline var LEOBLOGCAT 								  : String = "leoblogcat";
	public static inline var LEOBLOGCAT_LANG 							  : String = "leoblogcat_lang";
	public static inline var LEOBLOGCAT_SHOP 							  : String = "leoblogcat_shop";
	public static inline var LEOSLIDERLAYER_GROUPS 						  : String = "leosliderlayer_groups";
	public static inline var LEOSLIDERLAYER_SLIDES 						  : String = "leosliderlayer_slides";
	public static inline var LEOSLIDERLAYER_SLIDES_LANG 				  : String = "leosliderlayer_slides_lang";
	
	public static inline var LINKSMENUTOP 								  : String = "linksmenutop";
	public static inline var LINKSMENUTOP_LANG  						  : String = "linksmenutop_lang";	
	public static inline var LOG 										  : String = "log";
	
	public static inline var MAILALERT_CUSTOMER_OOS 					  : String = "mailalert_customer_oos";	
	public static inline var MANUFACTURER 		  						  : String = "manufacturer";
	public static inline var MANUFACTURER_LANG    						  : String = "manufacturer_lang";
	public static inline var MANUFACTURER_SHOP 	  						  : String = "manufacturer_shop";
	public static inline var MEMCASHED_SERVERS 						  	  : String = "memcached_servers";
	
	public static inline var MESSAGE 									  : String = "message";
	public static inline var MESSAGE_READED 							  : String = "message_readed";
	
	public static inline var META 	   									  : String = "meta";
	public static inline var META_LANG 									  : String = "meta_lang";
	
	public static inline var MODULE 		   							  : String = "module";
	public static inline var MODULE_ACCESS 	   							  : String = "module_access";
	public static inline var MODULE_COUNTRY    							  : String = "module_country";
	public static inline var MODULE_CURRENCY   							  : String = "module_currency";
	public static inline var MODULE_GROUP 	   							  : String = "module_group";
	public static inline var MODULE_PREFERENCE 							  : String = "module_preference";
	public static inline var MODULE_SHOP 	   							  : String = "module_shop";
	
	public static inline var NEWSLETTER 	  							  : String = "newsletter";
	public static inline var OPERATING_SYSTEM 							  : String = "operating_system";
	
	public static inline var ORDER_CARRIER 		     					  : String = "order_carrier";
	public static inline var ORDER_CART_RULE 	     					  : String = "order_cart_rule";
	public static inline var ORDER_DETAIL 		     					  : String = "order_detail";
	public static inline var ORDER_DETAIL_TAX 	     					  : String = "order_detail_tax";
	public static inline var ORDER_HISTORY 		     					  : String = "order_history";
	public static inline var ORDER_INVOICE 		     					  : String = "order_invoice";
	public static inline var ORDER_INVOICE_PAYMENT   					  : String = "order_invoice_payment";
	public static inline var ORDER_INVOICE_TAX 		 					  : String = "order_invoice_tax";
	public static inline var ORDER_MESSAGE			 					  : String = "order_message";
	public static inline var ORDER_MESSAGE_LANG 	 					  : String = "order_message_lang";
	public static inline var ORDER_PAYMENT 			 					  : String = "order_payment";
	public static inline var ORDER_RETURN 			 					  : String = "order_return";
	public static inline var ORDER_RETURN_DETAIL 	 					  : String = "order_return_detail";
	public static inline var ORDER_RETURN_STATE 	 					  : String = "order_return_state";
	public static inline var ORDER_RETURN_STATE_LANG 					  : String = "order_return_state_lang";
	public static inline var ORDER_SLIP 			 					  : String = "order_slip";
	public static inline var ORDER_SLIP_DETAIL 		 					  : String = "order_slip_detail";
	public static inline var ORDER_STATE 			 					  : String = "order_state";
	public static inline var ORDER_STATE_LANG 		 					  : String = "order_state_lang";	
	public static inline var ORDERS 	 								  : String = "orders";
	
	public static inline var PACK		 								  : String = "pack";
	public static inline var PAGE 		 								  : String = "page";
	public static inline var PAGE_TYPE 	 								  : String = "page_type";
	public static inline var PAGE_VIEWED 								  : String = "page_viewed";
	
	public static inline var PAGEBUILDERPROFILE 	 					  : String = "pagebuilderprofile";
	public static inline var PAGEBUILDERPROFILE_SHOP 					  : String = "pagebuilderprofile_shop";
	public static inline var PAGENOTFOUND 			 					  : String = "pagenotfound";
	
	public static inline var PP_PRODUCT_EXT  							  : String = "pp_product_ext";
	public static inline var PP_PRODUCT_PROP 							  : String = "pp_product_prop";	
	public static inline var PP_PROPERTY 	  							  : String = "pp_property";
	public static inline var PP_PROPERTY_LANG 							  : String = "pp_property_lang";	
	public static inline var PP_TEMPLATE 		  						  : String = "pp_template";
	public static inline var PP_TEMPLATE_EXT 	  						  : String = "pp_template_ext";
	public static inline var PP_TEMPLATE_EXT_PROP 						  : String = "pp_template_ext_prop";
	public static inline var PP_TEMPLATE_LANG 	  						  : String = "pp_template_lang";
	public static inline var PP_TEMPLATE_PROPERTY 						  : String = "pp_template_property";
	
	public static inline var PRODUCT 					   				  : String = "product";
	public static inline var PRODUCT_ATTACHMENT 		   				  : String = "product_attachment";
	public static inline var PRODUCT_ATTRIBUTE 			   				  : String = "product_attribute";
	public static inline var PRODUCT_ATTRIBUTE_COMBINATION 				  : String = "product_attribute_combination";
	public static inline var PRODUCT_ATTRIBUTE_IMAGE 	   				  : String = "product_attribute_image";
	public static inline var PRODUCT_ATTRIBUTE_SHOP 					  : String = "product_attribute_shop";	
	public static inline var PRODUCT_CARRIER 							  : String = "product_carrier";
	public static inline var PRODUCT_COMMENT 							  : String = "product_comment";
	public static inline var PRODUCT_COMMENT_CRITERION_CATEGORY 		  : String = "product_comment_criterion_category";
	public static inline var PRODUCT_COMMENT_CRITERION_LANG 			  : String = "product_comment_criterion_lang";
	public static inline var PRODUCT_COMMENT_CRITERION_PRODUCT 			  : String = "product_comment_criterion_product";	
	public static inline var PRODUCT_COMMENT_GRADE 						  : String = "product_comment_grade";
	public static inline var PRODUCT_COMMENT_REPORT 					  : String = "product_comment_report";
	public static inline var PRODUCT_COMMENT_USEFULNESS 				  : String = "product_comment_usefulness";
	public static inline var PRODUCT_COUNTRY_TAX 						  : String = "product_country_tax";	
	public static inline var PRODUCT_DOWNLOAD 			   				  : String = "product_download";
	public static inline var PRODUCT_GROUP_REDUCTION_CACHE 				  : String = "product_group_reduction_cache";
	public static inline var PRODUCT_LANG 				   				  : String = "product_lang";
	public static inline var PRODUCT_SALE 				   				  : String = "product_sale";
	public static inline var PRODUCT_SHOP 				   				  : String = "product_shop";
	public static inline var PRODUCT_SUPPLIER 			   				  : String = "product_supplier";
	public static inline var PRODUCT_TAG 				   				  : String = "product_tag";
	
	public static inline var PROFILE 	  								  : String = "profile";
	public static inline var PROFILE_LANG 								  : String = "profile_lang";
	
	public static inline var PTS_BT_TESTIMONIALS 		 				  : String = "ptsbttestimonials";
	public static inline var PTS_BT_TESTIMONIALS_LANG 	 				  : String = "ptsbttestimonials_lang";
	public static inline var PTS_BT_TESTIMONIALS_SHOP 				  	  : String = "ptsbttestimonials_shop";
	public static inline var PTS_MEGAMENU 				 				  : String = "ptsmegamenu";
	public static inline var PTS_MEGAMENU_LANG 			 				  : String = "ptsmegamenu_lang";
	public static inline var PTS_MEGAMENU_SHOP 			 				  : String = "ptsmegamenu_shop";
	public static inline var PTS_MEGAMENU_WIDGETS 		 				  : String = "ptsmegamenu_widgets";
	public static inline var PTS_REINSURANCE 			 				  : String = "ptsreinsurance";
	public static inline var PTS_REINSURANCE_LANG 		 				  : String = "ptsreinsurance_lang";	
	public static inline var PTS_STATIC_CONTENT 		 				  : String = "ptsstaticcontent";
	public static inline var PTS_VERTICAL_MENU 			 				  : String = "ptsverticalmenu";
	public static inline var PTS_VERTICAL_MENU_LANG 	 				  : String = "ptsverticalmenu_lang";
	public static inline var PTS_VERTICAL_MENU_SHOP 	 				  : String = "ptsverticalmenu_shop";
	public static inline var PTS_VERTICAL_MENU_WIDGETS 	 				  : String = "ptsverticalmenu_widgets";
	
	public static inline var QUICK_ACCESS 								  : String = "quick_access";
	public static inline var QUICK_ACCESS_LANG  						  : String = "quick_access_lang";
	
	public static inline var RANGE_PRICE  								  : String = "range_price";
	public static inline var RANGE_WEIGHT 								  : String = "range_weight";
	
	public static inline var REFERRER 									  : String = "referrer";
	public static inline var REFERRER_CACHE 							  : String = "referrer_cache";
	public static inline var REFERRER_SHOP  							  : String = "referrer_shop";
	
	public static inline var REQUEST_SQL 								  : String = "request_sql";
	public static inline var REQUIRED_FIELD 							  : String = "required_field";
	
	public static inline var RISK 	   									  : String = "risk";
	public static inline var RISK_LANG 									  : String = "risk_lang";
	
	public static inline var SCENE 										  : String = "scene";
	public static inline var SCENE_CATEGORY 							  : String = "scene_category";
	public static inline var SCENE_LANG 								  : String = "scene_lang";
	public static inline var SCENE_PRODUCTS 							  : String = "scene_products";
	public static inline var SCENE_SHOP 								  : String = "scene_shop";
	
	public static inline var SEARCH_ENGINE 								  : String = "search_engine";
	public static inline var SEARCH_INDEX  								  : String = "search_index";
	public static inline var SEARCH_WORD   								  : String = "search_word";
	public static inline var SEKEYWORD 	   								  : String = "sekeyword";
	
	public static inline var SHOP 										  : String = "shop";
	public static inline var SHOP_GROUP 								  : String = "shop_group";
	public static inline var SHOP_URL 									  : String = "shop_url";
	
	public static inline var SPECIFIC_PRICE 					 		  : String = "specific_price";
	public static inline var SPECIFIC_PRICE_PRIORITY 			 		  : String = "specific_price_priority";
	public static inline var SPECIFIC_PRICE_RULE 				 		  : String = "specific_price_rule";
	public static inline var SPECIFIC_PRICE_RULE_CONDITION 		 		  : String = "specific_price_rule_condition";
	public static inline var SPECIFIC_PRICE_RULE_CONDITION_GROUP 		  : String = "specific_price_rule_condition_group";
	
	public static inline var STATE 		 								  : String = "state";
	public static inline var STATSSEARCH 								  : String = "statssearch";
	
	public static inline var STOCK 				   						  : String = "stock";
	public static inline var STOCK_AVAILABLE 	   						  : String = "stock_available";
	public static inline var STOCK_MVT 			   						  : String = "stock_mvt";
	public static inline var STOCK_MVT_REASON 	   						  : String = "stock_mvt_reason";
	public static inline var STOCK_MVT_REASON_LANG 						  : String = "stock_mvt_reason_lang";
	
	public static inline var STORE 										  : String = "store";
	public static inline var STORE_SHOP 								  : String = "store_shop";
	
	public static inline var SUPPLIER 	   								  : String = "supplier";
	public static inline var SUPPLIER_LANG 								  : String = "supplier_lang";
	public static inline var SUPPLIER_SHOP 								  : String = "supplier_shop";
	
	public static inline var SUPPLY_ORDER 		  		  				  : String = "supply_order";
	public static inline var SUPPLY_ORDER_DETAIL  		  				  : String = "supply_order_detail";
	public static inline var SUPPLY_ORDER_HISTORY 		  				  : String = "supply_order_history";
	public static inline var SUPPLY_ORDER_RECEIPT_HISTORY 				  : String = "supply_order_receipt_history";	
	public static inline var SUPPLY_ORDER_STATE 		  				  : String = "supply_order_state";
	public static inline var SUPPLY_ORDER_STATE_LANG 	  				  : String = "supply_order_state_lang";
	
	public static inline var TAB 				   						  : String = "tab";
	public static inline var TAB_ADVICE 		   						  : String = "tab_advice";
	public static inline var TAB_LANG 			   						  : String = "tab_lang";
	public static inline var TAB_MODULE_PREFERENCE 						  : String = "tab_module_preference";
	
	public static inline var TAG 				  						  : String = "tag";
	public static inline var TAX 				  						  : String = "tax";
	public static inline var TAX_LANG 			  						  : String = "tax_lang";
	public static inline var TAX_RULE 			  						  : String = "tax_rule";
	public static inline var TAX_RULES_GROUP 	  						  : String = "tax_rules_group";
	public static inline var TAX_RULES_GROUP_SHOP 						  : String = "tax_rules_group_shop";
	
	public static inline var THEME 			   							  : String = "theme";
	public static inline var THEME_META 	   							  : String = "theme_meta";
	public static inline var THEME_SPECIFIC    							  : String = "theme_specific";
	public static inline var THEMECONFIGURATOR 							  : String = "themeconfigurator";
	
	public static inline var TIMEZONE 				  					  : String = "timezone";
	public static inline var TS_APPLICATION_ID 		  					  : String = "ts_application_id";
	public static inline var TS_BUYERPROTECTION_ITEMS 					  : String = "ts_buyerprotection_items";
	public static inline var TS_RATING_ALERT 		  					  : String = "ts_rating_alert";
	
	public static inline var WAREHOUSE 									  : String = "warehouse";
	public static inline var WAREHOUSE_CARRIER 							  : String = "warehouse_carrier";
	public static inline var WAREHOUSE_PRODUCT_LOCATION 				  : String = "warehouse_product_location";
	public static inline var WAREHOUSE_SHOP 							  : String = "warehouse_shop";
	
	public static inline var WEB_BROWSER 			 					  : String = "web_browser";
	public static inline var WEBSERVICE_ACCOUNT 	 					  : String = "webservice_account";
	public static inline var WEBSERVICE_ACCOUNT_SHOP 					  : String = "webservice_account_shop";
	public static inline var WEBSERVICE_PERMISSION 	 					  : String = "webservice_permission";
	
	public static inline var WISHLIST 			   						  : String = "wishlist";
	public static inline var WISHLIST_EMAIL 	   						  : String = "wishlist_email";
	public static inline var WISHLIST_PRODUCT 	   						  : String = "wishlist_product";
	public static inline var WISHLIST_PRODUCT_CART 						  : String = "wishlist_product_cart";
	
	public static inline var ZONE 	   									  : String = "zone";
	public static inline var ZONE_SHOP 									  : String = "zone_shop";
	
	public static var ALL : Array<String> = [
		ACCESS,
		ACCESSORY,
		ADDRESS,
		ADDRESS_FORMAT,
		ADVICE,
		ADVICE_LANG,
		ATTACHMENT,
		ATTACHMENT_LANG,
        
		ATTRIBUTE,
		ATTRIBUTE_GROUP,
		ATTRIBUTE_GROUP_LANG,
		ATTRIBUTE_GROUP_SHOP,
		ATTRIBUTE_IMPACT,
		ATTRIBUTE_LANG,
		ATTRIBUTE_SHOP,
        
		BADGE,
		BADGE_LANG,
		BLMOD_XML_AFFILIATE_PRICE,
		BLMOD_XML_BLOCK,
		BLMOD_XML_FEEDS,
		BLMOD_XML_FEEDS_CACHE,
		BLMOD_XML_FIELDS,
		BLMOD_XML_STATISTICS,
        
		CARRIER,
		CARRIER_GROUP,
		CARRIER_LANG,
		CARRIER_SHOP,
		CARRIER_TAX_RULES_GROUP_SHOP,
		CARRIER_ZONE,
        
		CART,
		CART_CART_RULE,
		CART_PRODUCT,
		CART_RULE,
		CART_RULE_CARRIER,
		CART_RULE_COMBINATION,
		CART_RULE_COUNTRY,
		CART_RULE_GROUP,
		CART_RULE_LANG,
		CART_RULE_PRODUCT_RULE,
		CART_RULE_PRODUCT_RULE_GROUP,
		CART_RULE_PRODUCT_RULE_VALUE,
		CART_RULE_SHOP,
        
		CATEGORY,
		CATEGORY_GROUP,
		CATEGORY_LANG,
		CATEGORY_PRODUCT,
		CATEGORY_SHOP,
        
		CMS,
		CMS_BLOCK,
		CMS_BLOCK_LANG,
		CMS_BLOCK_PAGE,
		CMS_BLOCK_SHOP,
		CMS_CATEGORY,
		CMS_CATEGORY_LANG,
		CMS_LANG,
		CMS_SHOP,
        
		COMPARE,
		COMPARE_PRODUCT,
        
		CONDITION,
		CONDITION_ADVICE,
		CONDITION_BADGE,
        
		CONFIGURATION,
		CONFIGURATION_KPI,
		CONFIGURATION_KPI_LANG,
		CONFIGURATION_LANG,
        
		CONNECTIONS,
		CONNECTIONS_PAGE,
		CONNECTIONS_SOURCE,
        
		CONTACT,
		CONTACT_LANG,
		CONTACT_SHOP,
        
		CONTENTBOX,
		CONTENTBOX_FILES,
        
		COUNTRY,
		COUNTRY_LANG,
		COUNTRY_SHOP,
        
		CRONJOBS,
		CURRENCY,
		CURRENCY_SHOP,
        
		CUSTOMER,
		CUSTOMER_GROUP,
		CUSTOMER_MESSAGE,
		CUSTOMER_MESSAGE_SYNC_IMAP,
		CUSTOMER_THREAD,
        
		CUSTOMIZATION,
		CUSTOMIZATION_FIELD,
		CUSTOMIZATION_FIELD_LANG,
		CUSTOMIZED_DATA,
        
		DATE_RANGE,
		DDW,
		DDW_BLOCKED_DATES,
		DDW_TIMESLOTS,
		DDW_TIMESLOTS_LANG,
		DDW_TRANSLATIONS,
		DDW_TRANSLATIONS_LANG,
		DELIVERY,
        
		EMPLOYEE,
		EMPLOYEE_SHOP,
        
		FEATURE,
		FEATURE_LANG,
		FEATURE_PRODUCT,
		FEATURE_SHOP,
		FEATURE_VALUE,
		FEATURE_VALUE_LANG,
		FEEDBACK_MODULE,
        
		GANALYTICS,
		GENDER,
		GENDER_LANG,
        
		GROUP,
		GROUP_LANG,
		GROUP_REDUCTION,
		GROUP_SHOP,
        
		GSITEMAP_SITEMAP,
		GUEST,
        
		HOMESLIDER,
		HOMESLIDER_SLIDES,
		HOMESLIDER_SLIDES_LANG,
        
		HOOK,
		HOOK_ALIAS,
		HOOK_MODULE,
		HOOK_MODULE_EXCEPTIONS,
        
		IMAGE,
		IMAGE_LANG,
		IMAGE_SHOP,
		IMAGE_TYPE,
        
		IM_BANNERS,
		IMPORT_MATCH,
		INFO,
		INFO_LANG,
		LANG,
		LANG_SHOP,
        
		LAYERED_CATEGORY,
		LAYERED_FILTER,
		LAYERED_FILTER_SHOP,
		LAYERED_FRIENDLY_URL,
		LAYERED_INDEXABLE_ATTRIBUTE_GROUP,
		LAYERED_INDEXABLE_ATTRIBUTE_GROUP_LANG_VALUE,
		LAYERED_INDEXABLE_ATTRIBUTE_LANG_VALUE,
		LAYERED_INDEXABLE_FEATURE,
		LAYERED_INDEXABLE_FEATURE_LANG_VALUE,
		LAYERED_INDEXABLE_FEATURE_VALUE_LANG_VALUE,
		LAYERED_PRICE_INDEX,
		LAYERED_PRODUCT_ATTRIBUTE,
        
		LEOBLOG_BLOG,
		LEOBLOG_BLOG_LANG,
		LEOBLOG_BLOG_SHOP,
		LEOBLOG_COMMENT,
		LEOBLOGCAT,
		LEOBLOGCAT_LANG,
		LEOBLOGCAT_SHOP,
		LEOSLIDERLAYER_GROUPS,
		LEOSLIDERLAYER_SLIDES,
		LEOSLIDERLAYER_SLIDES_LANG,
        
		LINKSMENUTOP,
		LINKSMENUTOP_LANG,
		LOG,
        
		MAILALERT_CUSTOMER_OOS,
		MANUFACTURER,
		MANUFACTURER_LANG,
		MANUFACTURER_SHOP,
		MEMCASHED_SERVERS,
        
		MESSAGE,
		MESSAGE_READED,
        
		META,
		META_LANG,
        
		MODULE,
		MODULE_ACCESS,
		MODULE_COUNTRY,
		MODULE_CURRENCY,
		MODULE_GROUP,
		MODULE_PREFERENCE,
		MODULE_SHOP,
        
		NEWSLETTER,
		OPERATING_SYSTEM,
        
		ORDER_CARRIER,
		ORDER_CART_RULE,
		ORDER_DETAIL,
		ORDER_DETAIL_TAX,
		ORDER_HISTORY,
		ORDER_INVOICE,
		ORDER_INVOICE_PAYMENT,
		ORDER_INVOICE_TAX,
		ORDER_MESSAGE,
		ORDER_MESSAGE_LANG,
		ORDER_PAYMENT,
		ORDER_RETURN,
		ORDER_RETURN_DETAIL,
		ORDER_RETURN_STATE,
		ORDER_RETURN_STATE_LANG,
		ORDER_SLIP,
		ORDER_SLIP_DETAIL,
		ORDER_STATE,
		ORDER_STATE_LANG,
		ORDERS,
        
		PACK,
		PAGE,
		PAGE_TYPE,
		PAGE_VIEWED,
        
		PAGEBUILDERPROFILE,
		PAGEBUILDERPROFILE_SHOP,
		PAGENOTFOUND,
        
		PP_PRODUCT_EXT,
		PP_PRODUCT_PROP,
		PP_PROPERTY,
		PP_PROPERTY_LANG,
		PP_TEMPLATE,
		PP_TEMPLATE_EXT,
		PP_TEMPLATE_EXT_PROP,
		PP_TEMPLATE_LANG,
		PP_TEMPLATE_PROPERTY,
        
		PRODUCT,
		PRODUCT_ATTACHMENT,
		PRODUCT_ATTRIBUTE,
		PRODUCT_ATTRIBUTE_COMBINATION,
		PRODUCT_ATTRIBUTE_IMAGE,
		PRODUCT_ATTRIBUTE_SHOP,
		PRODUCT_CARRIER,
		PRODUCT_COMMENT,
		PRODUCT_COMMENT_CRITERION_CATEGORY,
		PRODUCT_COMMENT_CRITERION_LANG,
		PRODUCT_COMMENT_CRITERION_PRODUCT,
		PRODUCT_COMMENT_GRADE,
		PRODUCT_COMMENT_REPORT,
		PRODUCT_COMMENT_USEFULNESS,
		PRODUCT_COUNTRY_TAX,
		PRODUCT_DOWNLOAD,
		PRODUCT_GROUP_REDUCTION_CACHE,
		PRODUCT_LANG,
		PRODUCT_SALE,
		PRODUCT_SHOP,
		PRODUCT_SUPPLIER,
		PRODUCT_TAG,
        
		PROFILE,
		PROFILE_LANG,
        
		PTS_BT_TESTIMONIALS,
		PTS_BT_TESTIMONIALS_LANG,
		PTS_BT_TESTIMONIALS_SHOP,
		PTS_MEGAMENU,
		PTS_MEGAMENU_LANG,
		PTS_MEGAMENU_SHOP,
		PTS_MEGAMENU_WIDGETS,
		PTS_REINSURANCE,
		PTS_REINSURANCE_LANG,
		PTS_STATIC_CONTENT,
		PTS_VERTICAL_MENU,
		PTS_VERTICAL_MENU_LANG,
		PTS_VERTICAL_MENU_SHOP,
		PTS_VERTICAL_MENU_WIDGETS,
        
		QUICK_ACCESS,
		QUICK_ACCESS_LANG,
        
		RANGE_PRICE,
		RANGE_WEIGHT,
        
		REFERRER,
		REFERRER_CACHE,
		REFERRER_SHOP,
        
		REQUEST_SQL,
		REQUIRED_FIELD,
        
		RISK,
		RISK_LANG,
        
		SCENE,
		SCENE_CATEGORY,
		SCENE_LANG,
		SCENE_PRODUCTS,
		SCENE_SHOP,
        
		SEARCH_ENGINE,
		SEARCH_INDEX,
		SEARCH_WORD,
		SEKEYWORD,
        
		SHOP,
		SHOP_GROUP,
		SHOP_URL,
        
		SPECIFIC_PRICE,
		SPECIFIC_PRICE_PRIORITY,
		SPECIFIC_PRICE_RULE,
		SPECIFIC_PRICE_RULE_CONDITION,
		SPECIFIC_PRICE_RULE_CONDITION_GROUP,
        
		STATE,
		STATSSEARCH,
        
		STOCK,
		STOCK_AVAILABLE,
		STOCK_MVT,
		STOCK_MVT_REASON,
		STOCK_MVT_REASON_LANG,
        
		STORE,
		STORE_SHOP,
        
		SUPPLIER,
		SUPPLIER_LANG,
		SUPPLIER_SHOP,
        
		SUPPLY_ORDER,
		SUPPLY_ORDER_DETAIL,
		SUPPLY_ORDER_HISTORY,
		SUPPLY_ORDER_RECEIPT_HISTORY,
		SUPPLY_ORDER_STATE,
		SUPPLY_ORDER_STATE_LANG,
        
		TAB,
		TAB_ADVICE,
		TAB_LANG,
		TAB_MODULE_PREFERENCE,
        
		TAG,
		TAX,
		TAX_LANG,
		TAX_RULE,
		TAX_RULES_GROUP,
		TAX_RULES_GROUP_SHOP,
        
		THEME,
		THEME_META,
		THEME_SPECIFIC,
		THEMECONFIGURATOR,
        
		TIMEZONE,
		TS_APPLICATION_ID,
		TS_BUYERPROTECTION_ITEMS,
		TS_RATING_ALERT,
        
		WAREHOUSE,
		WAREHOUSE_CARRIER,
		WAREHOUSE_PRODUCT_LOCATION,
		WAREHOUSE_SHOP,
        
		WEB_BROWSER,
		WEBSERVICE_ACCOUNT,
		WEBSERVICE_ACCOUNT_SHOP,
		WEBSERVICE_PERMISSION,
        
		WISHLIST,
		WISHLIST_EMAIL,
		WISHLIST_PRODUCT,
		WISHLIST_PRODUCT_CART,
        
		ZONE,
		ZONE_SHOP
	];
}