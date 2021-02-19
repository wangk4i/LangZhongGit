Class IHE.Msg.H06.H0603Rp Extends (IHE.Msg.BaseQueryResponse, %RegisteredObject, %XML.Adaptor) [ Language = objectscript ]
{

/// 文档流水号
Property DocumentId As %String(MAXLEN = 50);

/// 文档类型代码
Property DocumentTypeCode As %String(MAXLEN = 50);

/// 文档类型描述
Property DocumentTypeCodeName As %String(MAXLEN = 100);

/// 文档生成的日期时间
Property EffectiveTime As %String(MAXLEN = 14);

/// 文档保密级别代码
Property ConfidentialityCode As %String(MAXLEN = 50);

/// 文档保密级别描述
Property ConfidentialityCodeName As %String(MAXLEN = 100);

/// 文档版本号
Property VersionNumber As %String(MAXLEN = 10);

/// 经base64编码的文档原始内容
Property OriginalText As %String(MAXLEN = 32767);

/// PatientID
Property PatientID As %String(MAXLEN = 50);

/// 住院号标识
Property HospitalizationId As %String;

/// 门诊号标识
Property OutpatientId As %String;

/// 患者就诊日期时间
Property PatientEffectiveTime As %String;

/// 患者身份证号
Property IDCardNo As %String;

/// 患者姓名
Property PatientName As %String;

/// 医院代码
Property ProviderOrganizationId As %String;

/// 医院名称
Property ProviderOrganizationName As %String;

/// 科室代码
Property DeptCode As %String;

/// 文档创建者工号
Property AssignedAuthorWorkNo As %String(MAXLEN = 50);

/// 文档创建者姓名
Property AssignedAuthorName As %String;

/// 文档保管单位代码
Property RepresentedOrganizationCode As %String;

/// 文档保管单位名称
Property RepresentedOrganizationName As %String;

}
