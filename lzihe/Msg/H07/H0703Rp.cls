Class IHE.Msg.H07.H0703Rp Extends (%RegisteredObject, %XML.Adaptor, IHE.Msg.BaseResponse) [ Language = objectscript ]
{

/// 就诊卡号
Property EncounterCardID As %String(MAXLEN = 50);

/// 就诊卡的状态，其中active-激活；作废-disable；退卡-retired
Property EncounterCardStatus As %String;

/// 建卡日期时间
Property EffectiveTime As %String(MAXLEN = 14);

/// 身份证号
Property IDCardNo As %String;

/// 患者姓名
Property PatientName As %String;

/// 患者联系电话
Property TelPhone As %String;

/// 患者性别代码
Property GenderCode As %String;

/// 患者性别描述
Property GenderName As %String;

/// 患者出生日期
Property BirthTime As %String;

/// 患者完整地址
Property SAL As %String(MAXLEN = 100);

/// 省（自治区、直辖市）
Property STA As %String;

/// 市（地区）
Property CTY As %String;

/// 县（区）
Property CNT As %String;

/// 乡（镇、街道办事处）
Property STB As %String;

/// 村（街、路、弄等）
Property STR As %String;

/// 门牌号码
Property BNR As %String;

/// 邮政编码
Property ZIP As %String;

/// 婚姻代码
Property MarriageCode As %String;

/// 婚姻描述
Property MarriageValue As %String;

/// 民族代码
Property NationCode As %String;

/// 民族描述
Property NationValue As %String;

/// 职业类别代码
Property OccupationCode As %String;

/// 固定值职业类别描述
Property OccupationValue As %String;

/// 工作单位名称
Property EmployerOrg As %String;

/// 工作单位电话
Property EmployContactTel As %String;

/// 联系人关系代码
Property PersonalRelCode As %String;

/// 联系人关系描述
Property PersonRelValue As %String;

/// 联系人电话
Property ContactPersonTel As %String;

/// 联系人姓名
Property ContactPersonName As %String;

/// 组织机构代码
Property ProviderOrgCode As %String;

/// 组织机构名称
Property ProviderOrgName As %String;

/// 医疗保险类别代码
Property BeneficiaryCode As %String;

/// 医疗保险类别描述
Property BeneficiaryValue As %String;

/// 建卡者工号
Property AssignedPersonCode As %String(MAXLEN = 50);

/// 建卡者姓名
Property AssignedPersonName As %String;

/// 就诊卡信息保管机构代码
Property AssignedOrganCode As %String;

/// 就诊卡信息保管机构名称
Property AssignedOrganName As %String;

/// 查询ID
Property QueryID As %String(MAXLEN = 50);

/// 查询响应代码
Property ResponseCode As %String(MAXLEN = 50);

/// 查询结果数量
Property TotalNum As %String(MAXLEN = 50);

}
