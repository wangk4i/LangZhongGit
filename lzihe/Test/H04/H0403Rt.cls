Class IHE.Test.H04.H0403Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
    s msg = ##class(IHE.Msg.H04.H0403Rt).%New()
    
	s msg.MsgID = "消息ID"
	s msg.CreateTime = "创建时间"
	s msg.GenderCode = "性别代码"
	s msg.GenderName = "性别描述"
	s msg.BirthTimeLow = "出生日期上限"
	s msg.BirthTimeHigh = "出生日期下限"
	s msg.ProviderWorkNo = "医护人员工号"
	s msg.IDCardNo = "医护人员身份证件号码"
	s msg.ProviderName = "姓名"
	
    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
