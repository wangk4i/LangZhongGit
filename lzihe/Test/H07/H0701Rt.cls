Class IHE.Test.H07.H0701Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H07.H0701Rt).%New()
	
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "消息创建时间"
	s msg.EncounterCardID = "就诊卡号"
	s msg.EffectiveTime = "建卡日期时间"
	s msg.IDCardNo = "身份证号"
	s msg.PatientName = "患者姓名"
	s msg.TelPhone = "患者联系电话"
	s msg.GenderCode = "患者性别代码"
	s msg.GenderName = "患者性别描述"
	s msg.BirthTime = "患者出生日期"
	s msg.SAL = "患者完整地址"
	s msg.STA = "省（自治区、直辖市）"
	s msg.CTY = "市（地区）"
	s msg.CNT = "县（区）"
	s msg.STB = "乡（镇、街道办事处）"
	s msg.STR = "村（街、路、弄等）"
	s msg.BNR = "门牌号码"
	s msg.ZIP = "邮政编码"
	s msg.MarriageCode = "婚姻代码"
	s msg.MarriageValue = "婚姻描述"
	s msg.NationCode = "民族代码"
	s msg.NationValue = "民族描述"
	s msg.OccupationCode = "职业类别代码"
	s msg.OccupationValue = "固定值职业类别描述"
	s msg.EmployerOrg = "工作单位名称"
	s msg.EmployContactTel = "工作单位电话"
	s msg.PersonalRelCode = "联系人关系代码"
	s msg.PersonRelValue = "联系人关系描述"
	s msg.ContactPersonTel = "联系人电话"
	s msg.ContactPersonName = "联系人姓名"
	s msg.ProviderOrgCode = "组织机构代码"
	s msg.ProviderOrgNam = "组织机构名称"
	s msg.BeneficiaryCode = "医疗保险类别代码"
	s msg.BeneficiaryValue = "医疗保险类别描述"
	s msg.AssignedPersonCode = "建卡者工号"
	s msg.AssignedPersonName = "建卡者姓名"

	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
