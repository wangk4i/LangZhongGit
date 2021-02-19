Class IHE.Msg.H02.H0204Rp Extends (%RegisteredObject, %XML.Adaptor, IHE.Msg.BaseResponse) [ Language = objectscript ]
{

/// PatientID
Property PatientID As %String;

/// 患者登记时间
Property EffectiveTime As %String;

/// 身份证号
Property IDCardNo As %String;

/// 证件类别代码
Property IDCategoryCode As %String;

/// 证件类别描述
Property IDCategoryName As %String;

/// 姓名
Property PatientName As %String;

/// 联系电话
Property TelPhone As %String;

/// 性别代码
Property GenderCode As %String;

/// 性别描述
Property GenderName As %String;

/// 出生时间
Property BirthTime As %String;

/// 非结构化地址（完整地址描述）
Property SAL As %String(MAXLEN = 50);

/// 地址-省（自治区、直辖市）
Property STA As %String;

/// 地址-市（地区）
Property CTY As %String;

/// 地址-县（区）
Property CNT As %String;

/// 地址-乡（镇、街道办事处）
Property STB As %String;

/// 地址-村（街、路、弄等）
Property STR As %String;

/// 地址-门牌号码
Property BNR As %String;

/// 邮政编码
Property ZIP As %String;

/// 婚姻状况代码
Property MarriageCode As %String;

/// 婚姻状况描述
Property MarriageValue As %String;

/// 民族代码
Property NationCode As %String;

/// 民族描述
Property NationValue As %String;

/// 职业类别代码 
Property OccupationCode As %String;

/// 职业类别描述
Property OccupationValue As %String;

/// 工作单位名称
Property EmployerOrg As %String;

/// 工作单位联系电话
Property EmployContactTel As %String;

/// 健康卡号
Property HealthCardCode As %String;

/// 城乡居民健康档案编号
Property HealthRecordCode As %String;

/// 建档医疗机构组织机构代码
Property ScopingOrgCode As %String;

/// 家庭关系代码
Property PersonalRelCode As %String;

/// 家庭关系描述
Property PersonRelValue As %String;

/// 联系人电话
Property ContactPersonTel As %String;

/// 联系人姓名
Property ContactPersonName As %String;

/// 登记机构代码
Property ProviderOrgCode As %String(MAXLEN = 50);

/// 登记机构名称
Property ProviderOrgName As %String;

/// 匹配度
Property MatchDegree As %String(MAXLEN = 50);

/// 医疗保险类别代码
Property BeneficiaryCode As %String;

/// 医疗保险类别描述
Property BeneficiaryValue As %String;

/// 登记人职工号
Property RegisterPersonWokrNo As %String(MAXLEN = 50);

/// 登记人姓名
Property RegisterPersonName As %String;

/// 查询ID
Property QueryID As %String(MAXLEN = 50);

/// 查询响应代码
Property QueryResponseCode As %String(MAXLEN = 50);

/// 查询结果数量
Property TotalNum As %String(MAXLEN = 50);

}
