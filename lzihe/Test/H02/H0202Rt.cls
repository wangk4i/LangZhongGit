Class IHE.Test.H02.H0202Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H02.H0202Rt).%New()
    
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.PatientID = "PatientID"
	s msg.EffectiveTime = "患者登记时间"
	s msg.IDCardNo = "身份证号"
	s msg.IDCategoryCode = "证件类别代码"
	s msg.IDCategoryName = "证件类别描述"
	s msg.PatientName = "姓名"
	s msg.TelPhone = "联系电话"
	s msg.GenderCode = "性别代码"
	s msg.GenderName = "性别描述"
	s msg.BirthTime = "出生时间"
	s msg.SAL = "非结构化地址（完整地址描述）"
	s msg.STA = "地址-省（自治区、直辖市）"
	s msg.CTY = "地址-市（地区）"
	s msg.CNT = "地址-县（区）"
	s msg.STB = "地址-乡（镇、街道办事处）"
	s msg.STR = "地址-村（街、路、弄等）"
	s msg.BNR = "地址-门牌号码"
	s msg.ZIP = "邮政编码"
	s msg.MarriageCode = "婚姻状况代码"
	s msg.MarriageValue = "婚姻状况描述"
	s msg.NationCode = "民族代码"
	s msg.NationValue = "民族描述"
	s msg.OccupationCode = "职业类别代码 "
	s msg.OccupationValue = "职业类别描述"
	s msg.EmployerOrg = "工作单位名称"
	s msg.EmployContactTel = "工作单位联系电话"
	s msg.HealthCardCode = "健康卡号"
	s msg.HealthRecordCode = "城乡居民健康档案编号"
	s msg.ScopingOrgCode = "建档医疗机构组织机构代码"
	s msg.PersonalRelCode = "家庭关系代码"
	s msg.PersonRelValue = "家庭关系描述"
	s msg.ContactPersonTel = "联系人电话"
	s msg.ContactPersonName = "联系人姓名"
	s msg.ProviderOrgCode = "登记机构代码"
	s msg.ProviderOrgName = "登记机构名称"
	s msg.BeneficiaryCode = "医疗保险类别代码"
	s msg.BeneficiaryValue = "医疗保险类别描述"
	s msg.AssignedPersonCode = "作者人职工代码"
	s msg.AssignedPersonName = "作者人姓名"
	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
