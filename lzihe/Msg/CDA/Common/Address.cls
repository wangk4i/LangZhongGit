Class IHE.Msg.CDA.Common.Address Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 门牌号码
Property HouseNumber As %String;

/// 村（街、路、弄等）
Property StreetName As %String;

/// 乡（镇、街道办事处）
Property Township As %String;

/// 县（区）
Property County As %String;

/// 市（地区）
Property City As %String;

/// 省（自治区、直辖市）
Property State As %String;

/// 邮政编码
Property PostalCode As %String;

}
