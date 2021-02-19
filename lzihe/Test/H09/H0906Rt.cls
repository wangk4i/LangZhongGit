Class IHE.Test.H09.H0906Rt Extends %RegisteredObject [ Language = objectscript ]
{

ClassMethod GetTestData() As %String
{
	s msg = ##class(IHE.Msg.H09.H0906Rt).%New()
	
    s msg.MsgID = "消息ID"
    s msg.CreateTime = "消息创建时间"
    s msg.ReceiverID = "接收者ID"
    s msg.SenderID = "发送者ID"
    s msg.AppInfoID = "申请单编号"
    s msg.OutpatientId = "门（急）诊号"
    s msg.HospitalizationId = "住院号"
    s msg.AuthorID = "申请单开立者ID(医务人员ID)"
    s msg.EffectiveTimeLow = "申请单有效期间（低值）"
    s msg.EffectiveTimeHigh = "申请单有效期间（高值）"
    s msg.IDCardNo = "身份证号"
    s msg.MedicalInsuranceCard = "医保卡号"
    s msg.PatientID = "患者ID"

    d msg.XMLExportToString(.xmlStr, $p($ClassName(),".",4))
    w !,xmlStr
    q xmlStr
}

}
