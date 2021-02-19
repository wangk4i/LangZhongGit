<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0907Rp">
        <QUMT_IN020040UV01 xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ITSVersion="XML_1.0" xsi:schemaLocation=" urn:hl7-org:v3 ../multicacheschemas/QUMT_IN020040UV01.xsd">
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
            <interactionId root="2.16.156.10011.2.5.1.2" extension="QUMT_IN020040UV01"/>
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
            <!--typeCode为处理结果，AA表示成功 AE表示失败-->
            <acknowledgement typeCode="">
                <xsl:attribute name="typeCode">
                    <xsl:value-of select="ResultCode"/>
                </xsl:attribute>
                <targetMessage>
                    <id root="2.16.156.10011.2.5.1.1" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="RequestMsgID"/>
                        </xsl:attribute>
                    </id>
                </targetMessage>
                <acknowledgementDetail>
                    <text value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="ResultDesc"/>
                        </xsl:attribute>
                    </text>
                </acknowledgementDetail>
            </acknowledgement>
            <xsl:choose>
                <xsl:when test="ResultCode = 'AA'">
                    <controlActProcess classCode="CACT" moodCode="EVN">
                        <!-- 可返回多个病理申请信息，返回多个循环subject -->
                        <xsl:for-each select="Subject/PathologyAppInfoItem">
                            <subject typeCode="SUBJ">
                                <observationRequest classCode="OBS" moodCode="RQO">
                                    <!-- 检查申请单编号 必须项已使用 -->
                                    <id>
                                        <item root="2.16.156.10011.1.24" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="AppInfoID"/>
                                            </xsl:attribute>
                                        </item>
                                    </id>
                                    <code/>
                                    <!-- 申请单详细内容 -->
                                    <text value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="AppInfoDetail"/>
                                        </xsl:attribute>
                                    </text>
                                    <!-- 检查状态 必须项未使用 -->
                                    <statusCode/>
                                    <!-- 检查申请日期 -->
                                    <effectiveTime xsi:type="IVL_TS">
                                        <low value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="ItemAppTime"/>
                                            </xsl:attribute>
                                        </low>
                                    </effectiveTime>
                                    <methodCode>
                                        <!--检查类型编码 -->
                                        <item code="" codeSystem="2.16.156.10011.2.5.1.16">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="ItemTypeCode"/>
                                            </xsl:attribute>
                                            <!--检查类型名称 -->
                                            <displayName value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ItemTypeName"/>
                                                </xsl:attribute>
                                            </displayName>
                                        </item>
                                    </methodCode>
                                    <!-- 标本 -->
                                    <specimen typeCode="SPC">
                                        <specimen classCode="SPEC">
                                            <id/>
                                            <code/>
                                            <!-- 送检组织 -->
                                            <specimenNatural classCode="ENT" determinerCode="INSTANCE">
                                                <code>
                                                    <displayName value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="SpecimenNatural"/>
                                                        </xsl:attribute>
                                                    </displayName>
                                                </code>
                                                <quantity value="" unit="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="SpecimenNaturalNumber"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="unit">
                                                        <xsl:value-of select="SpecimenNaturalUnit"/>
                                                    </xsl:attribute>
                                                </quantity>
                                                <!-- 取材部位 多个可循环 -->
                                                <xsl:for-each select="DerivedSpecimen/DerivedSpecimen">
                                                    <derivedSpecimen classCode="SPEC">
                                                        <!--条码号 必须项已使用 -->
                                                        <id extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="SpecimenID"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <!--必须项目未使用 -->
                                                        <code/>
                                                        <specimenNatural classCode="ENT" determinerCode="INSTANCE">
                                                            <code>
                                                                <displayName value="">
                                                                    <xsl:attribute name="value">
                                                                        <xsl:value-of select="DerivedSpecimenPart"/>
                                                                    </xsl:attribute>
                                                                </displayName>
                                                            </code>
                                                            <quantity value="" unit="">
                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="DerivedSpecimenNumber"/>
                                                                </xsl:attribute>
                                                                <xsl:attribute name="unit">
                                                                    <xsl:value-of select="DerivedSpecimenUnit"/>
                                                                </xsl:attribute>
                                                            </quantity>
                                                        </specimenNatural>
                                                    </derivedSpecimen>
                                                </xsl:for-each>
                                            </specimenNatural>
                                            <subjectOf1 typeCode="SBJ">
                                                <specimenProcessStep classCode="SPECCOLLECT" moodCode="EVN">
                                                    <!-- 采集日期 -->
                                                    <effectiveTime xsi:type="IVL_TS">
                                                        <low value="">
                                                            <xsl:attribute name="value">
                                                                <xsl:value-of select="CaptureTime"/>
                                                            </xsl:attribute>
                                                        </low>
                                                    </effectiveTime>
                                                    <subject typeCode="SBJ" contextControlCode="OP">
                                                        <specimenInContainer classCode="CONT">
                                                            <!-- 固定液 -->
                                                            <containerAdditiveMaterial classCode="MAT" determinerCode="INSTANCE">
                                                                <code>
                                                                    <displayName value="">
                                                                        <xsl:attribute name="value">
                                                                            <xsl:value-of select="Fixative"/>
                                                                        </xsl:attribute>
                                                                    </displayName>
                                                                </code>
                                                            </containerAdditiveMaterial>
                                                        </specimenInContainer>
                                                    </subject>
                                                    <performer typeCode="PRF">
                                                        <assignedEntity classCode="ASSIGNED">
                                                            <!-- 送检医师Id -->
                                                            <id>
                                                                <item extension="" root="2.16.156.10011.1.4">
                                                                    <xsl:attribute name="extension">
                                                                        <xsl:value-of select="SubmitUserID"/>
                                                                    </xsl:attribute>
                                                                </item>
                                                            </id>
                                                            <assignedPerson determinerCode="INSTANCE" classCode="PSN">
                                                                <!-- 送检医师姓名 -->
                                                                <name xsi:type="BAG_EN">
                                                                    <item>
                                                                        <part value="">
                                                                            <xsl:attribute name="value">
                                                                                <xsl:value-of select="SubmitUserName"/>
                                                                            </xsl:attribute>
                                                                        </part>
                                                                    </item>
                                                                </name>
                                                            </assignedPerson>
                                                        </assignedEntity>
                                                    </performer>
                                                </specimenProcessStep>
                                            </subjectOf1>
                                        </specimen>
                                    </specimen>
                                    <!--开医嘱者/送检医生 -->
                                    <author typeCode="AUT">
                                        <!-- 开单时间 -->
                                        <time value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="AuthorTime"/>
                                            </xsl:attribute>
                                        </time>
                                        <assignedEntity classCode="ASSIGNED">
                                            <!--开单医生工号 -->
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
                                    <!-- 确认人 -->
                                    <verifier typeCode="VRF">
                                        <!--确认时间 -->
                                        <time value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="ConfirmTime"/>
                                            </xsl:attribute>
                                        </time>
                                        <assignedEntity classCode="ASSIGNED">
                                            <!--确认医生工号 -->
                                            <id>
                                                <item extension="" root="2.16.156.10011.1.4">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="ConfirmUserID"/>
                                                    </xsl:attribute>
                                                </item>
                                            </id>
                                            <assignedPerson determinerCode="INSTANCE" classCode="PSN">
                                                <!--确认人姓名 -->
                                                <name xsi:type="BAG_EN">
                                                    <item>
                                                        <part value="">
                                                            <xsl:attribute name="value">
                                                                <xsl:value-of select="ConfirmUserName"/>
                                                            </xsl:attribute>
                                                        </part>
                                                    </item>
                                                </name>
                                            </assignedPerson>
                                        </assignedEntity>
                                    </verifier>
                                    <reason typeCode="RSON" contextConductionInd="true" contextControlCode="OP">
                                        <!-- 病历摘要及手术所见 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE06.00.182.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                            <value xsi:type="ST" value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="CaseSummary"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </reason>
                                    <!--1..n 一个申请单可以包含多个检查项目，每个检查项目对应一个component2,多个检查项目重复component2 -->
                                    <xsl:for-each select="Component2/Item">
                                        <component2>
                                            <observationRequest classCode="OBS">
                                                <id/>
                                                <!--检查项目编码 必须项已使用 -->
                                                <code code="" codeSystem="2.16.156.10011.2.5.1.17">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="ItemCode"/>
                                                    </xsl:attribute>
                                                    <!--检查项目名称 -->
                                                    <displayName value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="ItemName"/>
                                                        </xsl:attribute>
                                                    </displayName>
                                                </code>
                                                <!-- 必须项未使用 -->
                                                <statusCode/>
                                                <!--检查方式编码 -->
                                                <methodCode>
                                                    <item code=" " codeSystem="2.16.156.10011.2.3.2.47">
                                                        <xsl:attribute name="code">
                                                            <xsl:value-of select="ItemFunctionCode"/>
                                                        </xsl:attribute>
                                                        <!--检查方式名 -->
                                                        <displayName value="">
                                                            <xsl:attribute name="value">
                                                                <xsl:value-of select="ItemFunctionName"/>
                                                            </xsl:attribute>
                                                        </displayName>
                                                    </item>
                                                </methodCode>
                                                <!--检查部位编码 -->
                                                <targetSiteCode>
                                                    <item code="" codeSystem="2.16.156.10011.2.5.1.18">
                                                        <xsl:attribute name="code">
                                                            <xsl:value-of select="ItemPartCode"/>
                                                        </xsl:attribute>
                                                        <!--检查部位名称 -->
                                                        <displayName value="">
                                                            <xsl:attribute name="value">
                                                                <xsl:value-of select="ItemPartName"/>
                                                            </xsl:attribute>
                                                        </displayName>
                                                    </item>
                                                </targetSiteCode>
                                                <!--执行科室 -->
                                                <location typeCode="LOC">
                                                    <!-- 执行时间 -->
                                                    <time>
                                                        <low value="">
                                                            <xsl:attribute name="value">
                                                                <xsl:value-of select="ServiceTime"/>
                                                            </xsl:attribute>
                                                        </low>
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
                                    <subjectOf6 contextConductionInd="false" xsi:nil="false">
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
                                    <componentOf1 contextConductionInd="false" xsi:nil="false" typeCode="COMP">
                                        <!--就诊 -->
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
                                            <!--必须项未使用 -->
                                            <statusCode/>
                                            <!--病人 必须项未使用 -->
                                            <subject typeCode="SBJ">
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
                                                        <!--门（急）诊号标识 -->
                                                        <item root="2.16.156.10011.1.10" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="OutpatientId"/>
                                                            </xsl:attribute>
                                                        </item>
                                                        <!--住院号标识-->
                                                        <item root="2.16.156.10011.1.12" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="HospitalizationId"/>
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
                                                        <name xsi:type="BAG_EN">
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
                                                        <!--婚姻状况类别编码 -->
                                                        <maritalStatusCode code="" codeSystem="2.16.156.10011.2.3.3.5"/>
                                                        <!--民族编码 -->
                                                        <ethnicGroupCode>
                                                            <item code="" codeSystem="2.16.156.10011.2.3.3.3"/>
                                                        </ethnicGroupCode>
                                                        <!--雇佣关系 -->
                                                        <asEmployee classCode="EMP">
                                                            <!--职业编码 -->
                                                            <occupationCode code="" codeSystem="2.16.156.10011.2.3.3.13">
                                                                <!--职业 -->
                                                                <displayName value=""/>
                                                            </occupationCode>
                                                            <!--工作单位 -->
                                                            <employerOrganization determinerCode="INSTANCE" classCode="ORG">
                                                                <!--工作单位名称 -->
                                                                <name xsi:type="BAG_EN">
                                                                    <item>
                                                                        <part value=""/>
                                                                    </item>
                                                                </name>
                                                                <contactParty classCode="CON" xsi:nil="true"/>
                                                            </employerOrganization>
                                                        </asEmployee>
                                                        <!--公民身份 -->
                                                        <asCitizen>
                                                            <!--所属国家 -->
                                                            <politicalNation>
                                                                <!--国籍编码 -->
                                                                <code code="" codeSystem="2.16.156.10011.2.3.3.1">
                                                                    <!--国家 -->
                                                                    <displayName value=""/>
                                                                </code>
                                                            </politicalNation>
                                                        </asCitizen>
                                                        <!--联系人（0..n可循环） -->
                                                        <contactParty classCode="CON">
                                                            <!--联系人电话-->
                                                            <telecom xsi:type="BAG_TEL">
                                                                <item use="MC" value="" capabilities="voice"/>
                                                            </telecom>
                                                            <!--联系人姓名/亲属 -->
                                                            <contactPerson>
                                                                <name xsi:type="BAG_EN">
                                                                    <item use="IDE">
                                                                        <part value=" "/>
                                                                    </item>
                                                                </name>
                                                            </contactPerson>
                                                        </contactParty>
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
                                            <!--诊断(检查申请原因) -->
                                            <xsl:for-each select="PertinentInformation1/Diagnosis">
                                                <pertinentInformation1 typeCode="PERT" xsi:nil="false">
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
                                                            <low value="">
                                                                <xsl:attribute name="value">
                                                                    <xsl:value-of select="DiagnosisTime"/>
                                                                </xsl:attribute>
                                                            </low>
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
                                            </xsl:for-each>
                                        </encounter>
                                    </componentOf1>
                                </observationRequest>
                            </subject>
                        </xsl:for-each>
                        <queryAck>
                            <queryResponseCode code="">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="ResponseCode"/>
                                </xsl:attribute>
                            </queryResponseCode>
                        </queryAck>
                    </controlActProcess>
                </xsl:when>
                <xsl:otherwise>
                    <controlActProcess classCode="CACT" moodCode="EVN">
                        <queryAck>
                            <queryResponseCode code="">
                                <xsl:attribute name="code">
                                    <xsl:value-of select="ResponseCode"/>
                                </xsl:attribute>
                            </queryResponseCode>
                        </queryAck>
                    </controlActProcess>
                </xsl:otherwise>
            </xsl:choose>
        </QUMT_IN020040UV01>
    </xsl:template>
</xsl:stylesheet>