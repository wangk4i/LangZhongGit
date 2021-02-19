Class IHE.Msg.CDA.Common.DocHead Extends (%RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 文档流水号标识
Property DocID As %String;

/// 文档机器生成时间
Property CreateTime As %String;

/// 文档集合编号
Property DocSetID As %String;

/// 文档版本号
Property Version As %String;

/// 文档记录时间
Property RecordTime As %String;

/// 文档作者代码
Property AuthorCode As %String;

/// 文档作者姓名
Property AuthorName As %String;

/// 保管机构代码
Property CustodianOrgCode As %String;

/// 保管机构名称
Property CustodianOrgName As %String;

}
