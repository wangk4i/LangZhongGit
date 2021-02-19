Class IHE.Test.H09.H0912Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.H09.H0912Rt).%New()
	
    s msg.MsgID = "消息ID"
    s msg.CreateTime = "消息创建时间"
    s msg.AppInfoID = "申请单号"
    s msg.HospitalizationId = "住院号"
    s msg.OutpatientId = "门诊号标识"
    s msg.AuthorID = "开单医生工号"
    s msg.AuthorTimeLow = "开单日期时间上限"
    s msg.AuthorTimeHigh = "开单日期时间下限"
    s msg.IDCardNo = "身份证号"
    s msg.PatientID = "PatientID"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
