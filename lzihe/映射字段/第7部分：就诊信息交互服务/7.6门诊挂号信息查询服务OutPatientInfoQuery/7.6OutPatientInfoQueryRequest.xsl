<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0706Rt">
        <PRPA_IN900300UV ITSVersion="XML_1.0" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRPA_IN900300UV.xsd">
            <!--id-消息流水号-->
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension"><xsl:value-of select="MsgID"/></xsl:attribute>
            </id>
            <!--creationTime-消息创建时间-->
            <creationTime value="">
                <xsl:attribute name="value"><xsl:value-of select="CreateTime"/></xsl:attribute>
            </creationTime>
            <!--interactionId-消息的服务标识-->
            <interactionId root="2.16.156.10011.2.5.1.2" extension="PRPA_IN900300UV"/>
            <!--processingCode-处理代码。标识此消息是否是产品、训练、调试系统的一部分。D：调试；P：产品；T：训练-->
            <processingCode code="P"/>
            <!--processingModeCode-处理模型代码。定义此消息是一个文档处理还是一个初始装载的一部分。A：存档；I：初始装载；R：从存档中恢复；T：当前处理，间隔传递。-->
            <processingModeCode/>
            <!--acceptAckCode-接收确认类型 AL：总是确认；NE：从不确认；ER：仅在错误/或拒绝时确认；SU：仅在成功完成时确认。-->
            <acceptAckCode code="AL"/>
            <receiver typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="1111"/>
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
            <controlActProcess classCode="ACTN" moodCode="EVN">
                <queryByParameter>
                    <!--查询ID-->
                    <queryId extension="">
                        <xsl:attribute name="extension"><xsl:value-of select="QueryID"/></xsl:attribute>
                    </queryId>
                    <statusCode/>
                    <!--就诊流水号 -->
                    <careEventID>
                        <value>
                            <!--门急诊号-->
                            <item root="2.16.156.10011.1.11" extension="">
                                <xsl:attribute name="extension"><xsl:value-of select="OutPatientID"/></xsl:attribute>
                            </item>
                            <!-- 就诊次数 -->
                            <item extension="" root="2.16.156.10011.2.5.1.8">
                                <xsl:attribute name="extension"><xsl:value-of select="VisitNum"/></xsl:attribute>
                            </item>
                            <!-- 就诊流水号 -->
                            <item extension="" root="2.16.156.10011.2.5.1.9">
                                <xsl:attribute name="extension"><xsl:value-of select="AdmID"/></xsl:attribute>
                            </item>
                        </value>
                    </careEventID>
                    <!--就诊时间-->
                    <encounterTimeframe>
                        <value>
                            <low value="">
                                <xsl:attribute name="value"><xsl:value-of select="EncounterStartTime"/></xsl:attribute>
                            </low>
                            <high value="">
                                <xsl:attribute name="value"><xsl:value-of select="EncounterEndTime"/></xsl:attribute>
                            </high>
                        </value>
                    </encounterTimeframe>
                    <patientId>
                        <value>
                            <!--PatientID-->
                            <item root="2.16.156.10011.2.5.1.4" extension="">
                                <xsl:attribute name="extension"><xsl:value-of select="PatientID"/></xsl:attribute>
                            </item>
                            <!--患者身份证号-->
                            <item root="2.16.156.10011.1.3" extension="">
                                <xsl:attribute name="extension"><xsl:value-of select="IDCardNo"/></xsl:attribute>
                            </item>
                        </value>
                    </patientId>
                    <!--科室-->
                    <patientLocationID>
                        <value>
                            <item root="2.16.156.10011.1.26" extension="">
                                <xsl:attribute name="extension"><xsl:value-of select="DeptCode"/></xsl:attribute>
                            </item>
                        </value>
                    </patientLocationID>
                    <!--组织机构-->
                    <responsibleOrganization>
                        <value>
                            <item root="2.16.156.10011.1.5" extension="">
                                <xsl:attribute name="extension"><xsl:value-of select="ServiceOrganCode"/></xsl:attribute>
                            </item>
                        </value>
                    </responsibleOrganization>
                    <typeOfEncounter>
                        <!--就诊类型-->
                        <value>
                            <item code="" codeSystem="2.16.156.10011.2.3.1.271" codeSystemName="患者类型代码表">
                                <xsl:attribute name="code"><xsl:value-of select="AdmTypeCode"/></xsl:attribute>
                                <displayName value="">
                                    <xsl:attribute name="value"><xsl:value-of select="AdmTypeName"/></xsl:attribute>
                                </displayName>
                            </item>
                        </value>
                    </typeOfEncounter>
                </queryByParameter>
            </controlActProcess>
        </PRPA_IN900300UV>
    </xsl:template>
</xsl:stylesheet>