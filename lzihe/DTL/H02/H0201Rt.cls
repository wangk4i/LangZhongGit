Class IHE.DTL.H02.H0201Rt Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.EDI.XML.Document, IHE.Msg.H02.H0201Rt) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.EDI.XML.Document' targetClass='IHE.Msg.H02.H0201Rt' sourceDocType='H0201Rt:PRPA_IN201311UV02' create='new' language='objectscript' >
<assign value='source.{value()}' property='target.CreTime' action='set' />
<assign value='source.{id().extension}' property='target.MsgID' action='set' />
</transform>
}

}
