<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0705Rt">
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
            <interactionId root="2.16.156.10011.2.5.1.2" extension="PRPA_IN400002UV"/>
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
            <controlActProcess classCode="STC" moodCode="EVN">
                <subject typeCode="SUBJ">
                    <encounterEvent classCode="ENC" moodCode="EVN">
                        <id>
                            <!--门急诊号标识 -->
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
                        </id>
                        <!--就诊类别代码 1.门诊 2.急诊 3.住院 9.其他 -->
                        <code code="" codeSystem="2.16.156.10011.2.3.1.271" codeSystemName="患者类型代码表">
                            <xsl:attribute name="code"><xsl:value-of select="AdmTypeCode"/></xsl:attribute>
                            <displayName value="">
                                <xsl:attribute name="value"><xsl:value-of select="AdmTypeName"/></xsl:attribute>
                            </displayName>
                        </code>
                        <statusCode/>
                        <!--就诊日期时间 -->
                        <effectiveTime>
                            <low value="">
                                <xsl:attribute name="value"><xsl:value-of select="EncounterTime"/></xsl:attribute>
                            </low>
                        </effectiveTime>
                        <!--就诊原因 -->
                        <reasonCode>
                            <item>
                                <originalText value="">
                                    <xsl:attribute name="value"><xsl:value-of select="EncounterReasonDesc"/></xsl:attribute>
                                </originalText>
                            </item>
                        </reasonCode>
                        <!--医疗保险类别-->
                        <admissionReferralSourceCode code="" codeSystem="2.16.156.10011.2.3.1.248" codeSystemName="医疗保险类别代码">
                            <xsl:attribute name="code"><xsl:value-of select="BeneficiaryCode"/></xsl:attribute>
                            <displayName value="">
                                <xsl:attribute name="value"><xsl:value-of select="BeneficiaryValue"/></xsl:attribute>
                            </displayName>
                        </admissionReferralSourceCode>
                        <!--患者-->
                        <subject typeCode="SBJ">
                            <patient classCode="PAT">
                                <id>
                                    <!--PatientID-->
                                    <item root="2.16.156.10011.2.5.1.4" extension="">
                                        <xsl:attribute name="extension"><xsl:value-of select="PatientID"/></xsl:attribute>
                                    </item>
                                </id>
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
                        <!--责任医师信息-->
                        <admitter typeCode="ADM">
                            <time/>
                            <assignedPerson classCode="ASSIGNED">
                                <!--医生的职工号-->
                                <id>
                                    <item root="2.16.156.10011.1.4" extension="">
                                        <xsl:attribute name="extension"><xsl:value-of select="AssignedPersonCode"/></xsl:attribute>
                                    </item>
                                </id>
                                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                    <!--责任医师姓名-->
                                    <name xsi:type="DSET_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="AssignedPersonName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </assignedPerson>
                            </assignedPerson>
                        </admitter>
                        <!--服务场所-->
                        <location typeCode="LOC">
                            <time/>
                            <statusCode code="active"/>
                            <serviceDeliveryLocation classCode="SDLOC">
                                <location classCode="PLC" determinerCode="INSTANCE">
                                    <id>
                                        <item root="2.16.156.10011.1.26" extension="">
                                            <xsl:attribute name="extension"><xsl:value-of select="DeptCode"/></xsl:attribute>
                                        </item>
                                    </id>
                                    <name xsi:type="DSET_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value"><xsl:value-of select="DeptName"/></xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </location>
                                <!--服务机构-->
                                <serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
                                    <id>
                                        <item root="2.16.156.10011.1.5" extension="">
                                            <xsl:attribute name="extension"><xsl:value-of select="ServiceOrganCode"/></xsl:attribute>
                                        </item>
                                    </id>
                                </serviceProviderOrganization>
                            </serviceDeliveryLocation>
                        </location>
                    </encounterEvent>
                </subject>
            </controlActProcess>
        </PRPA_IN400002UV>
    </xsl:template>
</xsl:stylesheet>