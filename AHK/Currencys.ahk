#Singleinstance force

   Gosub, CurrencyListSetup

   Gui, show, W400 H200
   Gui, Add, Text,, Amount to Convert
   Gui, Add, Edit, W100 vVar1 +Number
   Gui, Add, Text,, Starting currency
   Gui, Add, DropDownList, vVar2, % Currency3Letters
   Gui, Add, Text,, Ending currency
   Gui, Add, DropDownList, vVar3, % Currency3Letters
   Gui, Add, Text, X210 y10, Abbreviation List
   Gui, Add, Button, gSubmit_Data x45 Default, Convert
   Gui, Add, Listbox, x150 y25 h150 w200, % CurrencyList
   Gui, Add, Text,, Modified by: scudzy
Return


Submit_data:
   Gui Submit, NoHide
   Run https://www.google.com/search?client=firefox-b-d&q=%var1%+%Var2%+to+%var3%
Return

GuiClose:
   ExitApp

CurrencyListSetup:
   CurrencyList =
   ( LTrim Join|
   United Arab Emirates Dirham  =  AED
   Netherlands Antillean Guilder  =  ANG
   Argentine Peso  =  ARS
   Australian Dollar  =  AUD
   Bangladeshi Taka  =  BDT
   Bulgarian Lev  =  BGN
   Bahraini Dinar  =  BHD
   Brunei Dollar  =  BND
   Bolivian Boliviano  =  BOB
   Brazilian Real  =  BRL
   Botswanan Pula  =  BWP
   Canadian Dollar  =  CAD
   Swiss Franc  =  CHF
   Chilean Peso  =  CLP
   Chinese Yuan  =  CNY
   Colombian Peso  =  COP
   Costa Rican Col�=  CRC
   Czech Republic Koruna  =  CZK
   Danish Krone  =  DKK
   Dominican Peso  =  DOP
   Algerian Dinar  =  DZD
   Estonian Kroon  =  EEK
   Egyptian Pound  =  EGP
   Euro  =  EUR
   Fijian Dollar  =  FJD
   British Pound Sterling  =  GBP
   Hong Kong Dollar  =  HKD
   Honduran Lempira  =  HNL
   Croatian Kuna  =  HRK
   Hungarian Forint  =  HUF
   Indonesian Rupiah  =  IDR
   Israeli New Sheqel  =  ILS
   Indian Rupee  =  INR
   Jamaican Dollar  =  JMD
   Jordanian Dinar  =  JOD
   Japanese Yen  =  JPY
   Kenyan Shilling  =  KES
   South Korean Won  =  KRW
   Kuwaiti Dinar  =  KWD
   Cayman Islands Dollar  =  KYD
   Kazakhstani Tenge  =  KZT
   Lebanese Pound  =  LBP
   Sri Lankan Rupee  =  LKR
   Lithuanian Litas  =  LTL
   Latvian Lats  =  LVL
   Moroccan Dirham  =  MAD
   Moldovan Leu  =  MDL
   Macedonian Denar  =  MKD
   Mauritian Rupee  =  MUR
   Maldivian Rufiyaa  =  MVR
   Mexican Peso  =  MXN
   Malaysian Ringgit  =  MYR
   Namibian Dollar  =  NAD
   Nigerian Naira  =  NGN
   Nicaraguan C�ba  =  NIO
   Norwegian Krone  =  NOK
   Nepalese Rupee  =  NPR
   New Zealand Dollar  =  NZD
   Omani Rial  =  OMR
   Peruvian Nuevo Sol  =  PEN
   Papua New Guinean Kina  =  PGK
   Philippine Peso  =  PHP
   Pakistani Rupee  =  PKR
   Polish Zloty  =  PLN
   Paraguayan Guarani  =  PYG
   Qatari Rial  =  QAR
   Romanian Leu  =  RON
   Serbian Dinar  =  RSD
   Russian Ruble  =  RUB
   Saudi Riyal  =  SAR
   Seychellois Rupee  =  SCR
   Swedish Krona  =  SEK
   Singapore Dollar  =  SGD
   Slovak Koruna  =  SKK
   Sierra Leonean Leone  =  SLL
   Salvadoran Col�=  SVC
   Thai Baht  =  THB
   Tunisian Dinar  =  TND
   Turkish Lira  =  TRY
   Trinidad and Tobago Dollar  =  TTD
   New Taiwan Dollar  =  TWD
   Tanzanian Shilling  =  TZS
   Ukrainian Hryvnia  =  UAH
   Ugandan Shilling  =  UGX
   US Dollar  =  USD
   Uruguayan Peso  =  UYU
   Uzbekistan Som  =  UZS
   Venezuelan Bol�r  =  VEF
   Vietnamese Dong  =  VND
   CFA Franc BCEAO  =  XOF
   Yemeni Rial  =  YER
   South African Rand  =  ZAR
   Zambian Kwacha  =  ZMK
)

Loop, parse, CurrencyList, |, `r
   Currency3Letters .= SubStr(A_LoopField, -2, 3) . "|"

Return