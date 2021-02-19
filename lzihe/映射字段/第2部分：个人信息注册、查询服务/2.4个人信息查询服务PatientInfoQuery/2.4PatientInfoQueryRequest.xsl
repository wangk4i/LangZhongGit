<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0201Rt">
    <PRPA_IN201305UV02 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ITSVersion="XML_1.0" xmlns="urn:hl7-org:v3" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRPA_IN201305UV02.xsd">
        <id root="2.16.156.10011.2.5.1.1" extension="">
            <xsl:attribute name="extension"><xsl:value-of select="MsgID"/></xsl:attribute>
        </id>
        <creationTime value="20070803130624">
            <xsl:attribute name="extension"><xsl:value-of select="CreateTime"/></xsl:attribute>
        </creationTime>
        <interactionId root="2.16.156.10011.2.5.1.2" extension="PRPA_IN201305UV02"/>
        <processingCode code="P"/>
        <processingModeCode/>
        <acceptAckCode code="AL"/>
        <receiver typeCode="RCV">
            <device classCode="DEV" determinerCode="INSTANCE">
                <id>
                    <item root="2.16.156.10011.2.5.1.3" extension="111"/>
                </id>
            </device>
        </receiver>
        <sender typeCode="SND">
            <device classCode="DEV" determinerCode="INSTANCE">
                <id>
                    <item root="2.16.156.10011.2.5.1.3" extension="222"/>
                </id>
            </device>
        </sender>
        <controlActProcess classCode="CACT" moodCode="EVN">
            <queryByParameter>
                <queryId extension="22a0f9e0-4454-11dc-a6be-3603d6866807">
                    <xsl:attribute name="extension"><xsl:value-of select="QueryID"/></xsl:attribute>
                </queryId>
                <statusCode code="new"/>
                <initialQuantity value="2"/>
                <matchCriterionList>
                    <minimumDegreeMatch>
                        <value xsi:type="INT" value="">
                            <xsl:attribute name="extension"><xsl:value-of select="MatchDegree"/></xsl:attribute>
                        </value>
                        <semanticsText value="匹配程度"/>
                    </minimumDegreeMatch>
                </matchCriterionList>
                <parameterList>
                    <!--本地系统的患者ID-->
                    <id root="2.16.156.10011.2.5.1.4" extension="0020109112">
                        <xsl:attribute name="extension"><xsl:value-of select="PatientID"/></xsl:attribute>
                    </id>
                    <!-- 患者性别 -->
                    <livingSubjectAdministrativeGender>
                        <value code="1" codeSystem="2.16.156.10011.2.3.3.4">
                            <xsl:attribute name="extension"><xsl:value-of select="GenderCode"/></xsl:attribute>
                            <displayName value="男性">
                                <xsl:attribute name="extension"><xsl:value-of select="GenderName"/></xsl:attribute>
                            </displayName>
                        </value>
                        <semanticsText value="患者性别"/>
                    </livingSubjectAdministrativeGender>
                    <!--患者身份证号-->
                    <livingSubjectId>
                        <value>
                            <item root="2.16.156.10011.1.3" extension="0020109112">
                                <xsl:attribute name="extension"><xsl:value-of select="IDCardNo"/></xsl:attribute>
                            </item>
                        </value>
                        <semanticsText value="患者身份证号"/>
                    </livingSubjectId>
                    <!--患者姓名-->
                    <livingSubjectName>
                        <value>
                            <item>
                                <part value="李丽丽">
                                    <xsl:attribute name="extension"><xsl:value-of select="PatientName"/></xsl:attribute>
                                </part>
                            </item>
                        </value>
                        <semanticsText value="患者姓名"/>
                    </livingSubjectName>
                </parameterList>
            </queryByParameter>
        </controlActProcess>
    </PRPA_IN201305UV02>
    </xsl:template>
</xsl:stylesheet>