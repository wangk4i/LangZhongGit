<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0902Rt">
        <POOR_IN200902UV ITSVersion="XML_1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="urn:hl7-org:v3" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/POOR_IN200901UV.xsd">
            <!--消息ID-->
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="MsgID"/>
                </xsl:attribute>
            </id>
            <!--消息发送时间-->
            <creationTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </creationTime>
            <interactionId root="2.16.156.10011.2.5.1.2" extension="POOR_IN200901UV"/>
            <processingCode code="P"/>
            <processingModeCode/>
            <acceptAckCode code="AL"/>
            <receiver typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="@111"/>
                    </id>
                </device>
            </receiver>
            <sender typeCode="SND">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="@222"/>
                    </id>
                </device>
            </sender>
            <controlActProcess classCode="ACTN" moodCode="EVN">
                <subject typeCode="SUBJ">
                    <observationRequest classCode="OBS" moodCode="RQO">
                        <id>
                            <!--电子申请单编号-->
                            <item root="2.16.156.10011.1.24" extension="">
                                <xsl:attribute name="extension">
                                    <xsl:value-of select="ExamAppInfoID"/>
                                </xsl:attribute>
                            </item>
                        </id>
                        <code/>
                        <!--申请单描述-->
                        <text value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="ExamAppInfoContent"/>
                            </xsl:attribute>
                        </text>
                        <!--申请单状态-->
                        <statusCode code="">
                            <xsl:attribute name="code">
                                <xsl:value-of select="ExamAppInfoStatus"/>
                            </xsl:attribute>
                        </statusCode>
                        <!--申请单有效日期时间-->
                        <effectiveTime xsi:type="IVL_TS">
                            <low value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="EffectiveTimeLow"/>
                                </xsl:attribute>
                            </low>
                            <high value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="EffectiveTimeHigh"/>
                                </xsl:attribute>
                            </high>
                        </effectiveTime>
                        <!--优先级别-->
                        <priorityCode code="">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PriorityCode"/>
                            </xsl:attribute>
                            <displayName value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="PriorityName"/>
                                </xsl:attribute>
                            </displayName>
                        </priorityCode>
                        <!--标本-->
                        <specimen>
                            <specimen classCode="SPEC">
                                <!--标本ID/或者称条码ID-->
                                <id root="2.16.156.10011.1.14" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="SpecimenID"/>
                                    </xsl:attribute>
                                </id>
                                <!--标本类别代码-->
                                <code code="">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="SpecimenTypeCode"/>
                                    </xsl:attribute>
                                    <displayName value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="SpecimenTypeName"/>
                                        </xsl:attribute>
                                    </displayName>
                                </code>
                            </specimen>
                        </specimen>
                        <!--开单医生/送检医生 -->
                        <author typeCode="AUT">
                            <!-- 开单时间 -->
                            <time value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="AuthorTime"/>
                                </xsl:attribute>
                            </time>
                            <!--申请单开立者签名-->
                            <signatureText value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="AuthorSignatureText"/>
                                </xsl:attribute>
                            </signatureText>
                            <assignedEntity classCode="ASSIGNED">
                                <!--开单医生编码 -->
                                <id>
                                    <item extension="" root="2.16.156.10011.1.4">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="AuthorID"/>
                                        </xsl:attribute>
                                    </item>
                                </id>
                                <!--开单医生姓名 -->
                                <assignedPerson determinerCode="INSTANCE" classCode="PSN">
                                    <name xsi:type="BAG_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="AuthorName"/>
                                                </xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </assignedPerson>
                                <!-- 申请科室信息 -->
                                <representedOrganization determinerCode="INSTANCE" classCode="ORG">
                                    <!--申请科室编码 必须项已使用 -->
                                    <id>
                                        <item extension="" root="2.16.156.10011.1.26">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="AuthorDeptCode"/>
                                            </xsl:attribute>
                                        </item>
                                    </id>
                                    <!--申请科室名称 -->
                                    <name xsi:type="BAG_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="AuthorDeptName"/>
                                                </xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </representedOrganization>
                            </assignedEntity>
                        </author>
                        <!--审核者-->
                        <verifier typeCode="VRF">
                            <!--审核日期时间 -->
                            <time value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="AuditTime"/>
                                </xsl:attribute>
                            </time>
                            <assignedEntity classCode="ASSIGNED">
                                <!--审核者编码 -->
                                <id>
                                    <item extension="" root="2.16.156.10011.1.4">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="AuditUserWorkNo"/>
                                        </xsl:attribute>
                                    </item>
                                </id>
                                <assignedPerson determinerCode="INSTANCE" classCode="PSN">
                                    <!--审核者姓名 -->
                                    <name xsi:type="BAG_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="AuditUserName"/>
                                                </xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </assignedPerson>
                            </assignedEntity>
                        </verifier>
                        <!-- 多个检验项目循环component2 -->
                        <xsl:for-each select="Component2/ExamItem">
                            <component2>
                                <observationRequest classCode="OBS" moodCode="RQO">
                                    <id>
                                        <!--医嘱ID-->
                                        <item root="2.16.156.10011.1.28" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="OrderID"/>
                                            </xsl:attribute>
                                        </item>
                                    </id>
                                    <!--检验项目编码 必须项已使用 -->
                                    <code code="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="ExamItemCode"/>
                                        </xsl:attribute>
                                        <!--检验项目名称 -->
                                        <displayName value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="ExamItemName"/>
                                            </xsl:attribute>
                                        </displayName>
                                    </code>
                                    <!-- 必须项未使用 -->
                                    <statusCode/>
                                    <methodCode>
                                        <!--检验方法编码 -->
                                        <item code="">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="ExamFunctionCode"/>
                                            </xsl:attribute>
                                            <!--检验方法名 -->
                                            <displayName value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ExamFunctionName"/>
                                                </xsl:attribute>
                                            </displayName>
                                        </item>
                                    </methodCode>
                                    <!--执行科室 -->
                                    <location typeCode="LOC">
                                        <!--执行时间 -->
                                        <time>
                                            <any value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ServiceTime"/>
                                                </xsl:attribute>
                                            </any>
                                        </time>
                                        <serviceDeliveryLocation classCode="SDLOC">
                                            <serviceProviderOrganization determinerCode="INSTANCE" classCode="ORG">
                                                <!--执行科室编码 -->
                                                <id>
                                                    <item extension="" root="2.16.156.10011.1.26">
                                                        <xsl:attribute name="extension">
                                                            <xsl:value-of select="ServiceDeptCode"/>
                                                        </xsl:attribute>
                                                    </item>
                                                </id>
                                                <!-- 执行科室名称 -->
                                                <name xsi:type="BAG_EN">
                                                    <item>
                                                        <part value="">
                                                            <xsl:attribute name="value">
                                                                <xsl:value-of select="ServiceDeptName"/>
                                                            </xsl:attribute>
                                                        </part>
                                                    </item>
                                                </name>
                                            </serviceProviderOrganization>
                                        </serviceDeliveryLocation>
                                    </location>
                                </observationRequest>
                            </component2>
                        </xsl:for-each>
                        <subjectOf6 contextConductionInd="false">
                            <!-- 必须项 未使用 default=false -->
                            <seperatableInd value="false"/>
                            <!--申请注意事项 -->
                            <annotation>
                                <text value="">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="Notices"/>
                                    </xsl:attribute>
                                </text>
                                <statusCode code="completed"/>
                                <author>
                                    <assignedEntity classCode="ASSIGNED"/>
                                </author>
                            </annotation>
                        </subjectOf6>
                        <!--就诊 -->
                        <componentOf1 contextConductionInd="false" typeCode="COMP">
                            <!--就诊 -->
                            <encounter classCode="ENC" moodCode="EVN">
                                <id>
                                    <!--门急诊号-->
                                    <item root="2.16.156.10011.1.11" extension="">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="OutpatientId"/>
                                        </xsl:attribute>
                                    </item>
                                    <!--住院号-->
                                    <item root="2.16.156.10011.1.12" extension="">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="HospitalizationId"/>
                                        </xsl:attribute>
                                    </item>
                                </id>
                                <!--就诊类别代码-->
                                <code code="" codeSystem="2.16.156.10011.2.3.1.271" codeSystemName="患者类型代码表">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="AdmTypeCode"/>
                                    </xsl:attribute>
                                    <displayName value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="AdmTypeName"/>
                                        </xsl:attribute>
                                    </displayName>
                                </code>
                                <!--必须项未使用 -->
                                <statusCode/>
                                <!--病人 必须项未使用 -->
                                <subject typeCode="SBJ">
                                    <patient classCode="PAT">
                                        <id>
                                            <!-- 患者ID -->
                                            <item root="2.16.156.10011.2.5.1.4" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="PatientID"/>
                                                </xsl:attribute>
                                            </item>
                                        </id>
                                        <!--个人信息 必须项已使用 -->
                                        <patientPerson classCode="PSN">
                                            <!-- 身份证号/医保卡号 -->
                                            <id>
                                                <!-- 身份证号 -->
                                                <item extension="" root="2.16.156.10011.1.3">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="IDCardNo"/>
                                                    </xsl:attribute>
                                                </item>
                                                <!-- 医保卡号 -->
                                                <item extension="" root="2.16.156.10011.1.15">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="MedicalInsuranceCard"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <!--姓名 -->
                                            <name xsi:type="DSET_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="PatientName"/>
                                                        </xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <!-- 联系电话 -->
                                            <telecom xsi:type="BAG_TEL">
                                                <!-- 联系电话 -->
                                                <item value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="PatientTelecom"/>
                                                    </xsl:attribute>
                                                </item>
                                            </telecom>
                                            <!--性别代码 -->
                                            <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="PatientGenderCode"/>
                                                </xsl:attribute>
                                                <displayName value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="GenderName"/>
                                                    </xsl:attribute>
                                                </displayName>
                                            </administrativeGenderCode>
                                            <!--出生日期 -->
                                            <birthTime value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="BirthTime"/>
                                                </xsl:attribute>
                                                <!--年龄 -->
                                                <originalText value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="PatientAge"/>
                                                    </xsl:attribute>
                                                </originalText>
                                            </birthTime>
                                            <!--住址 -->
                                            <addr xsi:type="BAG_AD">
                                                <item use="H">
                                                    <part type="AL" value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="PatientAddr"/>
                                                        </xsl:attribute>
                                                    </part>
                                                </item>
                                            </addr>
                                        </patientPerson>
                                    </patient>
                                </subject>
                                <!--住院位置-->
                                <location typeCode="LOC">
                                    <time/>
                                    <serviceDeliveryLocation classCode="SDLOC">
                                        <location classCode="PLC" determinerCode="INSTANCE">
                                            <!--DE01.00.026.00	病床号-->
                                            <id>
                                                <item extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="BedCode"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <name xsi:type="BAG_EN">
                                                <item use="IDE">
                                                    <part value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="BedNumber"/>
                                                        </xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <asLocatedEntityPartOf classCode="LOCE">
                                                <location classCode="PLC" determinerCode="INSTANCE">
                                                    <!--DE01.00.019.00	病房号-->
                                                    <id>
                                                        <item extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="RoomCode"/>
                                                            </xsl:attribute>
                                                        </item>
                                                    </id>
                                                    <name xsi:type="BAG_EN">
                                                        <item use="IDE">
                                                            <part value="">
                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="RoomNumber"/>
                                                                </xsl:attribute>
                                                            </part>
                                                        </item>
                                                    </name>
                                                </location>
                                            </asLocatedEntityPartOf>
                                        </location>
                                        <serviceProviderOrganization classCode="ORG" determinerCode="INSTANCE">
                                            <!--DE08.10.026.00	科室名称-->
                                            <id>
                                                <item extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="DeptCode"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <name xsi:type="BAG_EN">
                                                <item use="IDE">
                                                    <part value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="DeptName"/>
                                                        </xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <asOrganizationPartOf classCode="PART">
                                                <!-- DE08.10.054.00	病区名称 -->
                                                <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                    <id>
                                                        <item extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="InpatientAreaId"/>
                                                            </xsl:attribute>
                                                        </item>
                                                    </id>
                                                    <name xsi:type="BAG_EN">
                                                        <item use="IDE">
                                                            <part value="">
                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="InpatientAreaName"/>
                                                                </xsl:attribute>
                                                            </part>
                                                        </item>
                                                    </name>
                                                </wholeOrganization>
                                            </asOrganizationPartOf>
                                        </serviceProviderOrganization>
                                    </serviceDeliveryLocation>
                                </location>
                                <!--诊断(检验申请原因) -->
                                <pertinentInformation1 typeCode="PERT">
                                    <observationDx classCode="OBS" moodCode="EVN">
                                        <!--诊断类别编码 必须项已使用 -->
                                        <code code="" codeSystem="2.16.156.10011.2.5.1.10">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="DiagnosisTypeCode"/>
                                            </xsl:attribute>
                                            <!--诊断类别名称 -->
                                            <displayName value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="DiagnosisTypeName"/>
                                                </xsl:attribute>
                                            </displayName>
                                        </code>
                                        <!-- 必须项未使用 -->
                                        <statusCode code="active"/>
                                        <!--诊断日期 -->
                                        <effectiveTime>
                                            <any value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="DiagnosisTime"/>
                                                </xsl:attribute>
                                            </any>
                                        </effectiveTime>
                                        <!-- 疾病编码 必须项已使用 -->
                                        <value code="" codeSystem="2.16.156.10011.2.3.3.11">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="DiseaseCode"/>
                                            </xsl:attribute>
                                            <!-- 疾病名称 -->
                                            <displayName value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="DiseaseName"/>
                                                </xsl:attribute>
                                            </displayName>
                                        </value>
                                    </observationDx>
                                </pertinentInformation1>
                            </encounter>
                        </componentOf1>
                    </observationRequest>
                </subject>
            </controlActProcess>
        </POOR_IN200902UV>
    </xsl:template>
</xsl:stylesheet>