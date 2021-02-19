<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0913Rt">
        <POOR_IN200901UV ITSVersion="XML_1.0" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/POOR_IN200901UV.xsd">
            <!-- 消息ID -->
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="MsgID"/>
                </xsl:attribute>
            </id>
            <!-- 消息创建时间 -->
            <creationTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </creationTime>
            <!-- 消息的服务标识-->
            <interactionId root="2.16.156.10011.2.5.1.2" extension="POOR_IN200901UV"/>
            <!--处理代码，标识此消息是否是产品、训练、调试系统的一部分。D：调试；P：产品；T：训练 -->
            <processingCode code="P"/>
            <!-- 消息处理模式: A(Archive); I(Initial load); R(Restore from archive); T(Current processing) -->
            <processingModeCode/>
            <!-- 消息应答: AL(Always); ER(Error/reject only); NE(Never) -->
            <acceptAckCode code="AL"/>
            <!-- 接受者 -->
            <receiver typeCode="RCV">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <!-- 接受者ID -->
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Receiver"/>
                            </xsl:attribute>
                        </item>
                    </id>
                </device>
            </receiver>
            <!-- 发送者 -->
            <sender typeCode="SND">
                <device classCode="DEV" determinerCode="INSTANCE">
                    <!-- 发送者ID -->
                    <id>
                        <item root="2.16.156.10011.2.5.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Sender"/>
                            </xsl:attribute>
                        </item>
                    </id>
                </device>
            </sender>
            <!--封装的消息内容 -->
            <controlActProcess classCode="CACT" moodCode="EVN">
                <subject typeCode="SUBJ" contextConductionInd="false">
                    <!--消息类型 -->
                    <procedureRequest classCode="PROC" moodCode="RQO">
                        <!--申请单号 必须项 -->
                        <id>
                            <!--申请单号 必须项 -->
                            <item extension="" root="2.16.156.10011.1.24">
                                <xsl:attribute name="extension">
                                    <xsl:value-of select="AppInfoID"/>
                                </xsl:attribute>
                            </item>
                        </id>
                        <code/>
                        <!--描述/说明 -->
                        <text value=""/>
                        <!--状态代码 必须项未使用 -->
                        <statusCode/>
                        <!--申请日期 -->
                        <effectiveTime xsi:type="IVL_TS">
                            <low value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="AppTime"/>
                                </xsl:attribute>
                            </low>
                        </effectiveTime>
                        <!-- 麻醉方式 -->
                        <methodCode>
                            <!-- 麻醉方式编码 -->
                            <item code="" codeSystem="2.16.156.10011.2.3.1.159">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="AnaesthesiaTypeCode"/>
                                </xsl:attribute>
                                <!-- 麻醉方式名称 -->
                                <displayName value="">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="AnaesthesiaTypeName"/>
                                    </xsl:attribute>
                                </displayName>
                            </item>
                            <!--手术性质编码-->
                            <item code="" codeSystem="2.16.156.10011.2.5.1.15">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="OperationTypeCode"/>
                                </xsl:attribute>
                                <!-- 手术性质名称（择期，围期） -->
                                <displayName value="">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="OperationTypeName"/>
                                    </xsl:attribute>
                                </displayName>
                            </item>
                        </methodCode>
                        <!-- 申请人信息(服务者) -->
                        <author typeCode="AUT" contextControlCode="OP">
                            <assignedEntity classCode="ASSIGNED">
                                <!-- 申请医师工号(assignedEntity - 2.16.840.1.113883.11.11595) -->
                                <id>
                                    <item root="2.16.156.10011.1.4" extension="">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="AuthorID"/>
                                        </xsl:attribute>
                                    </item>
                                </id>
                                <!-- 申请医师 -->
                                <assignedPerson classCode="PSN" determinerCode="INSTANCE" xsi:nil="false">
                                    <name xsi:type="LIST_EN">
                                        <item>
                                            <part value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="AuthorName"/>
                                                </xsl:attribute>
                                            </part>
                                        </item>
                                    </name>
                                </assignedPerson>
                                <!-- 申请科室 -->
                                <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                                    <!-- 申请科室编码 -->
                                    <id>
                                        <item extension="" root="2.16.156.10011.1.26">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="AuthorDeptCode"/>
                                            </xsl:attribute>
                                        </item>
                                    </id>
                                    <!--申请科室 -->
                                    <name xsi:type="LIST_EN">
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
                        <!-- 审核人 -->
                        <verifier typeCode="VRF">
                            <!-- 审核日期 -->
                            <time value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="AuditTime"/>
                                </xsl:attribute>
                            </time>
                            <assignedEntity classCode="ASSIGNED">
                                <!-- 审核医师工号 -->
                                <id>
                                    <item root="2.16.156.10011.1.4" extension="">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="AuditUserWorkNo"/>
                                        </xsl:attribute>
                                    </item>
                                </id>
                                <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                    <!--审核人姓名 -->
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
                        <!-- 一个手术申请单包含多个手术  多个手术可以循环,循环节点component -->
                        <xsl:for-each select="Component2/OperationInfoItem">
                            <component2>
                                <procedureRequest classCode="PROC" moodCode="RQO">
                                    <id/>
                                    <!--手术名称编码 必须项 -->
                                    <code code="" codeSystem="2.16.156.10011.2.3.3.12">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="OperationCode"/>
                                        </xsl:attribute>
                                        <!--手术名称 -->
                                        <displayName value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="OperationName"/>
                                            </xsl:attribute>
                                        </displayName>
                                    </code>
                                    <statusCode/>
                                    <!-- 手术等级编码(2.16.840.1.113883.5.7) -->
                                    <priorityCode code="" codeSystem="2.16.156.10011.2.3.1.258">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="OperationLevelCode"/>
                                        </xsl:attribute>
                                        <displayName value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="OperationLevelTime"/>
                                            </xsl:attribute>
                                        </displayName>
                                    </priorityCode>
                                    <!--手术医生 -->
                                    <performer typeCode="PRF">
                                        <!-- 预订手术时间 -->
                                        <time>
                                            <low value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ReserveOperationTime"/>
                                                </xsl:attribute>
                                            </low>
                                        </time>
                                        <assignedEntity classCode="ASSIGNED">
                                            <!-- 手术医师工号 -->
                                            <id>
                                                <item extension="" root="2.16.156.10011.1.4">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="OperationDrID"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <code>
                                                <displayName value=""/>
                                            </code>
                                            <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                                                <name xsi:type="LIST_EN">
                                                    <!-- 手术医师姓名 -->
                                                    <item>
                                                        <part value="">
                                                            <xsl:attribute name="value">
                                                                <xsl:value-of select="OperationDrName"/>
                                                            </xsl:attribute>
                                                        </part>
                                                    </item>
                                                </name>
                                            </assignedPerson>
                                            <representedOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <!-- 执行科室编码 -->
                                                <id>
                                                    <item extension="" root="2.16.156.10011.1.26">
                                                        <xsl:attribute name="extension">
                                                            <xsl:value-of select="ServiceDeptCode"/>
                                                        </xsl:attribute>
                                                    </item>
                                                </id>
                                                <!-- 执行科室 -->
                                                <name xsi:type="LIST_EN">
                                                    <item>
                                                        <part value="">
                                                            <xsl:attribute name="value">
                                                                <xsl:value-of select="ServiceDeptName"/>
                                                            </xsl:attribute>
                                                        </part>
                                                    </item>
                                                </name>
                                            </representedOrganization>
                                        </assignedEntity>
                                    </performer>
                                </procedureRequest>
                            </component2>
                        </xsl:for-each>
                        <!-- 注意事项 -->
                        <subjectOf6 contextConductionInd="true">
                            <!-- 必须项 未使用 default=false -->
                            <seperatableInd value="false"/>
                            <annotation>
                                <!--必须项 -->
                                <text value="">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="Notices"/>
                                    </xsl:attribute>
                                </text>
                                <!--必须项未使用 -->
                                <statusCode/>
                                <!-- 必须项未使用 -->
                                <author typeCode="AUT">
                                    <assignedEntity classCode="ASSIGNED"/>
                                </author>
                            </annotation>
                        </subjectOf6>
                        <!-- 就诊 -->
                        <componentOf1 contextConductionInd="false" typeCode="COMP" contextControlCode="OP">
                            <encounter classCode="ENC" moodCode="EVN">
                                <id>
                                    <!-- 就诊次数 -->
                                    <item extension="" root="2.16.156.10011.2.5.1.8">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="VisitNum"/>
                                        </xsl:attribute>
                                    </item>
                                    <!-- 就诊流水号 -->
                                    <item extension="" root="2.16.156.10011.2.5.1.9">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="AdmID"/>
                                        </xsl:attribute>
                                    </item>
                                </id>
                                <!--就诊类别编码-->
                                <code codeSystem="2.16.156.10011.2.3.1.271" code="">
                                    <xsl:attribute name="code">
                                        <xsl:value-of select="AdmTypeCode"/>
                                    </xsl:attribute>
                                    <!-- 就诊类别名称 -->
                                    <displayName value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="AdmTypeName"/>
                                        </xsl:attribute>
                                    </displayName>
                                </code>
                                <!-- 必须项未使用 -->
                                <statusCode code="active"/>
                                <!--就诊(住院)日期 -->
                                <effectiveTime xsi:type="IVL_TS">
                                    <low value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="SeenTime"/>
                                        </xsl:attribute>
                                    </low>
                                </effectiveTime>
                                <!--手术对象 -->
                                <subject typeCode="SBJ">
                                    <!--患者 -->
                                    <patient classCode="PAT">
                                        <id>
                                            <!-- 域ID -->
                                            <item root="2.16.156.10011.2.5.1.5" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="DomainId"/>
                                                </xsl:attribute>
                                            </item>
                                            <!-- 患者ID -->
                                            <item root="2.16.156.10011.2.5.1.4" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="PatientID"/>
                                                </xsl:attribute>
                                            </item>
                                            <!-- 门诊号 -->
                                            <item root="2.16.156.10011.1.11" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="OutpatientId"/>
                                                </xsl:attribute>
                                            </item>
                                            <!-- 住院号 -->
                                            <item root="2.16.156.10011.1.12" extension="">
                                                <xsl:attribute name="extension">
                                                    <xsl:value-of select="HospitalizationId"/>
                                                </xsl:attribute>
                                            </item>
                                        </id>
                                        <!-- 个人信息 -->
                                        <patientPerson classCode="PSN" determinerCode="INSTANCE" xsi:nil="false">
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
                                            <!-- 患者姓名 -->
                                            <name xsi:type="DSET_EN">
                                                <item>
                                                    <part value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="PatientName"/>
                                                        </xsl:attribute>
                                                    </part>
                                                </item>
                                            </name>
                                            <!-- 电话 -->
                                            <telecom xsi:type="BAG_TEL">
                                                <item value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="PatientTelecom"/>
                                                    </xsl:attribute>
                                                </item>
                                            </telecom>
                                            <!-- 性别代码 -->
                                            <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="GenderCode"/>
                                                </xsl:attribute>
                                                <displayName value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="GenderName"/>
                                                    </xsl:attribute>
                                                </displayName>
                                            </administrativeGenderCode>
                                            <!-- 出生日期-派生年龄 -->
                                            <birthTime value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="BirthTime"/>
                                                </xsl:attribute>
                                                <originalText value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="PatientAge"/>
                                                    </xsl:attribute>
                                                </originalText>
                                            </birthTime>
                                            <!-- 地址 -->
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
                                            <!--DE01.00.026.00	病床编码 -->
                                            <id>
                                                <item extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="BedCode"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <!-- 病床号 -->
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
                                                    <!--DE01.00.019.00	病房编码 -->
                                                    <id>
                                                        <item extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="RoomCode"/>
                                                            </xsl:attribute>
                                                        </item>
                                                    </id>
                                                    <!-- 病房号 -->
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
                                            <!--DE08.10.026.00	科室编码 -->
                                            <id>
                                                <item extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="DeptCode"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <!-- 科室名称 -->
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
                                                <!-- DE08.10.054.00	病区编码 -->
                                                <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                    <id>
                                                        <item extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="InpatientAreaId"/>
                                                            </xsl:attribute>
                                                        </item>
                                                    </id>
                                                    <!-- 病区名称 -->
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
                                <!--诊断(手术申请原因) -->
                                <xsl:for-each select="Diags/DiagItem">
                                    <pertinentInformation1 typeCode="PERT" xsi:nil="false">
                                        <observationDx classCode="OBS" moodCode="EVN">
                                            <!--诊断类别代码  必须项已使用 -->
                                            <code code="" codeSystem="2.16.156.10011.2.5.1.10">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="DiagnosisTypeCode"/>
                                                </xsl:attribute>
                                                <displayName value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="DiagnosisTypeName"/>
                                                    </xsl:attribute>
                                                </displayName>
                                            </code>
                                            <!-- 必须项未使用 -->
                                            <statusCode code="active"/>
                                            <!-- 疾病代码 必须项已使用 -->
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
                                </xsl:for-each>
                            </encounter>
                        </componentOf1>
                    </procedureRequest>
                </subject>
            </controlActProcess>
        </POOR_IN200901UV>
    </xsl:template>
</xsl:stylesheet>