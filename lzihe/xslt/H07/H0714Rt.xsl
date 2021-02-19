<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0714Rt">
        <PRPA_IN400002UV ITSVersion="XML_1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:v3="urn:hl7-org:v3" xmlns="urn:hl7-org:v3" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRPA_IN400002UV.xsd">
            <!--id-消息流水号-->
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension"><xsl:value-of select="MsgID"/></xsl:attribute>
            </id>
            <!--creationTime-消息创建时间-->
            <creationTime value="">
                <xsl:attribute name="value"><xsl:value-of select="CreateTime"/></xsl:attribute>
            </creationTime>
            <!--interactionId-消息的服务标识-->
            <interactionId root="2.16.156.10011.2.5.1.2" extension="PRPA_IN400002UV01"/>
            <!--processingCode-处理代码。标识此消息是否是产品、训练、调试系统的一部分。D：调试；P：产品；T：训练-->
            <processingCode code="P"/>
            <!--processingModeCode-处理模型代码。定义此消息是一个文档处理还是一个初始装载的一部分。A：存档；I：初始装载；R：从存档中恢复；T：当前处理，间隔传递。-->
            <processingModeCode/>
            <!--acceptAckCode-接收确认类型 AL：总是确认；NE：从不确认；ER：仅在错误/或拒绝时确认；SU：仅在成功完成时确认。-->
            <acceptAckCode code="AL"/>
            <receiver typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Receiver"/>
                            </xsl:attribute>
                        </item>
                    </id>
                </device>
            </receiver>
            <sender typeCode="SND">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Sender"/>
                            </xsl:attribute>
                        </item>
                    </id>
                </device>
            </sender>
            <controlActProcess classCode="INFO" moodCode="PRP">
                <subject typeCode="SUBJ">
                    <encounterEvent classCode="ENC" moodCode="EVN">
                        <id>
                            <!--住院号-->
                            <item root="2.16.156.10011.1.12" extension="">
                                <xsl:attribute name="extension"><xsl:value-of select="HospitalizationId"/></xsl:attribute>
                            </item>
                            <!-- 就诊次数 -->
                            <item extension="" root="2.16.156.10011.2.5.1.8">
                                <xsl:attribute name="extension"><xsl:value-of select="VisitNum"/></xsl:attribute>
                            </item>
                            <!-- 就诊流水号 -->
                            <item extension="" root="2.16.156.10011.2.5.1.9">
                                <xsl:attribute name="extension"><xsl:value-of select="AdmID"/></xsl:attribute>
                            </item>
                        </id>
                        <!--就诊事件类别代码-->
                        <code code="" codeSystem="2.16.156.10011.2.3.1.271" codeSystemName="患者类型代码表">
                            <xsl:attribute name="code"><xsl:value-of select="AdmTypeCode"/></xsl:attribute>
                            <displayName value="">
                                <xsl:attribute name="value"><xsl:value-of select="AdmTypeName"/></xsl:attribute>
                            </displayName>
                        </code>
                        <statusCode/>
                        <!--出院日期时间-->
                        <effectiveTime>
                            <high value="">
                                <xsl:attribute name="value"><xsl:value-of select="DischargeTime"/></xsl:attribute>
                            </high>
                        </effectiveTime>
                        <!--住院天数-->
                        <lengthOfStayQuantity unit="天" value="">
                            <xsl:attribute name="value"><xsl:value-of select="StayLength"/></xsl:attribute>
                        </lengthOfStayQuantity>
                        <!--患者-->
                        <subject typeCode="SBJ">
                            <patient classCode="PAT">
                                <id>
                                    <!--PatientID-->
                                    <item root="2.16.156.10011.2.5.1.4" extension="">
                                        <xsl:attribute name="extension"><xsl:value-of select="PatientID"/></xsl:attribute>
                                    </item>
                                </id>
                                <!--患者基本信息-->
                                <patientPerson>
                                    <!--患者身份证号-->
                                    <id>
                                        <item root="2.16.156.10011.1.3" extension="">
                                            <xsl:attribute name="extension"><xsl:value-of select="IDCardNo"/></xsl:attribute>
                                        </item>
                                    </id>
                                    <!--姓名-->
                                    <name xsi:type="DSET_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="PatientName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </patientPerson>
                            </patient>
                        </subject>
                        <!--登记人-->
                        <discharger typeCode="DIS">
                            <time/>
                            <assignedPerson classCode="ASSIGNED">
                                <!--登记人职工号-->
                                <id>
                                    <item root="2.16.156.10011.1.4" extension="">
                                        <xsl:attribute name="extension"><xsl:value-of select="RegisterPersonWokrNo"/></xsl:attribute>
                                    </item>
                                </id>
                                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                    <!--登记人姓名	-->
                                    <name xsi:type="DSET_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="RegisterPersonName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </assignedPerson>
                            </assignedPerson>
                        </discharger>
                        <!--诊断-西医诊断 可重复-->
                        <xsl:for-each select="WesternReason/WesternReasonInfo">
                            <reason typeCode="RSON">
                                <observationDx classCode="OBS" moodCode="EVN">
                                    <code/>
                                    <statusCode/>
                                    <value code="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10">
                                        <xsl:attribute name="code"><xsl:value-of select="WesternDiagCode"/></xsl:attribute>
                                        <displayName value="">
                                            <xsl:attribute name="value"><xsl:value-of select="WesternDiagValue"/></xsl:attribute>
                                        </displayName>
                                    </value>
                                    <author typeCode="AUT">
                                        <assignedEntity classCode="ASSIGNED">
                                            <id>
                                                <item root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension"><xsl:value-of select="WesternDiagPersonCode"/></xsl:attribute>
                                                </item>
                                            </id>
                                        </assignedEntity>
                                    </author>
                                </observationDx>
                            </reason>
                        </xsl:for-each>
                        <!--诊断-中医诊断 可重复-->
                        <xsl:for-each select="ChineseReason/ChineseReasonInfo">
                            <reason typeCode="RSON">
                                <observationDx classCode="OBS" moodCode="EVN">
                                    <code/>
                                    <statusCode/>
                                    <value code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表（GB/T 15657）">
                                        <xsl:attribute name="code"><xsl:value-of select="ChineseDiagCode"/></xsl:attribute>
                                        <displayName value="">
                                            <xsl:attribute name="value"><xsl:value-of select="ChineseDiagValue"/></xsl:attribute>
                                        </displayName>
                                    </value>
                                    <author typeCode="AUT">
                                        <assignedEntity classCode="ASSIGNED">
                                            <id>
                                                <item root="2.16.156.10011.1.4" extension="">
                                                    <xsl:attribute name="extension"><xsl:value-of select="ChineseDiagPersonCode"/></xsl:attribute>
                                                </item>
                                            </id>
                                        </assignedEntity>
                                    </author>
                                </observationDx>
                            </reason>
                        </xsl:for-each>
                        <!--出院科室、病区信息-->
                        <departedBy>
                            <transportation moodCode="EVN">
                                <code/>
                                <location typeCode="LOC">
                                    <locatedEntity classCode="LOCE">
                                        <id/>
                                        <location classCode="PLC" determinerCode="INSTANCE">
                                            <id>
                                                <item root="2.16.156.10011.1.26" extension="">
                                                    <xsl:attribute name="extension"><xsl:value-of select="AssignedDeptCode"/></xsl:attribute>
                                                </item>
                                            </id>
                                            <name xsi:type="DSET_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value"><xsl:value-of select="AssignedDeptName"/></xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <locatedEntityHasParts classCode="LOCE">
                                                <locatedPlace classCode="PLC" determinerCode="INSTANCE">
                                                    <id>
                                                        <item root="2.16.156.10011.1.27" extension="">
                                                            <xsl:attribute name="extension"><xsl:value-of select="InPatientAreaCode"/></xsl:attribute>
                                                        </item>
                                                    </id>
                                                    <name xsi:type="DSET_EN">
                                                        <item>
                                                            <part value="">
                                                                <xsl:attribute name="value"><xsl:value-of select="InPatientAreaName"/></xsl:attribute>
                                                            </part>
                                                        </item>
                                                    </name>
                                                </locatedPlace>
                                            </locatedEntityHasParts>
                                        </location>
                                    </locatedEntity>
                                </location>
                            </transportation>
                        </departedBy>
                    </encounterEvent>
                </subject>
            </controlActProcess>
        </PRPA_IN400002UV>
    </xsl:template>
</xsl:stylesheet>