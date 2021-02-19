<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0911Rt">
        <POOR_IN200902UV ITSVersion="XML_1.0" xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/POOR_IN200902UV.xsd">
            <!--id-消息流水号-->
            <id root="2.16.156.10011.2.5.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="MsgID"/>
                </xsl:attribute>
            </id>
            <!--creationTime-消息创建时间-->
            <creationTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </creationTime>
            <!--interactionId-消息的服务标识-->
            <interactionId root="2.16.156.10011.2.5.1.2" extension="POOR_IN200902UV"/>
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
            <controlActProcess classCode="CACT" moodCode="EVN">
                <subject typeCode="SUBJ">
                    <procedureRequest classCode="PROC" moodCode="RQO">
                        <!-- 申请单编号-->
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
                        <statusCode/>
                        <!--申请日期时间 -->
                        <effectiveTime xsi:type="IVL_TS">
                            <low value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="AppTime"/>
                                </xsl:attribute>
                            </low>
                        </effectiveTime>
                        <!--优先（紧急）度-->
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
                        <!--开单医生/送检医生 -->
                        <author typeCode="AUT">
                            <!-- 开单时间 -->
                            <time value="">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="AuthorTime"/>
                                </xsl:attribute>
                            </time>
                            <assignedEntity classCode="ASSIGNED">
                                <!--开单医生编码 -->
                                <id>
                                    <item root="2.16.156.10011.1.4" extension="">
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
                                        <item root="2.16.156.10011.1.26" extension="">
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
                                    <item root="2.16.156.10011.1.4" extension="">
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
                        <pertinentInformation typeCode="SUBJ" contextConductionInd="true">
                            <organizer classCode="CONTAINER" moodCode="EVN">
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="01">
                                            <originalText value="患者ABO血型"/>
                                        </code>
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="PatientABOCode"/>
                                            </xsl:attribute>
                                            <displayName value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="PatientABODescribe"/>
                                                </xsl:attribute>
                                            </displayName>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="02">
                                            <originalText value="患者Rh血型"/>
                                        </code>
                                        <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh（D）血型代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="PatientRHCode"/>
                                            </xsl:attribute>
                                            <displayName value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="PatientRHDescribe"/>
                                                </xsl:attribute>
                                            </displayName>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="GEN" moodCode="EVN">
                                        <code code="03">
                                            <originalText value="身高"/>
                                        </code>
                                        <value xsi:type="PQ" value="" unit="cm">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="PatientHeight"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="GEN" moodCode="EVN">
                                        <code code="04">
                                            <originalText value="体重"/>
                                        </code>
                                        <value xsi:type="PQ" value="" unit="kg">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="PatientWeight"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="GEN" moodCode="EVN">
                                        <code code="05">
                                            <originalText value="收缩压"/>
                                        </code>
                                        <value xsi:type="PQ" value="130" unit="mmHg">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="PatientSystolicPressure"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="GEN" moodCode="EVN">
                                        <code code="06">
                                            <originalText value="舒张压"/>
                                        </code>
                                        <value xsi:type="PQ" value="130" unit="mmHg">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="PatientDiastolicPressure"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="GEN" moodCode="EVN">
                                        <code code="07">
                                            <originalText value="体温"/>
                                        </code>
                                        <value xsi:type="PQ" value="37" unit="℃">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="PatientTemperature"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="GEN" moodCode="EVN">
                                        <code code="08">
                                            <originalText value="脉搏"/>
                                        </code>
                                        <value xsi:type="PQ" value="80" unit="次/分">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="PatientPulse"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="09">
                                            <originalText value="申请ABO血型"/>
                                        </code>
                                        <value xsi:type="CD" code="1" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="ApplyABOCode"/>
                                            </xsl:attribute>
                                            <displayName value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ApplyABODescribe"/>
                                                </xsl:attribute>
                                            </displayName>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="10">
                                            <originalText value="申请Rh血型"/>
                                        </code>
                                        <value xsi:type="CD" code="1" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh（D）血型代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="ApplyRHCode"/>
                                            </xsl:attribute>
                                            <displayName value="">
                                                <xsl:attribute name="value">
                                                    <xsl:value-of select="ApplyRHDescribe"/>
                                                </xsl:attribute>
                                            </displayName>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="11">
                                            <originalText value="采血标记"/>
                                        </code>
                                        <value xsi:type="BL" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="BloodCollectionMark"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="12">
                                            <originalText value="输血地点"/>
                                        </code>
                                        <value xsi:type="ST" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="BloodTransfusionSite"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="13">
                                            <originalText value="输血目的"/>
                                        </code>
                                        <value xsi:type="ST" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="BloodTransfusionPurpose"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="14">
                                            <originalText value="输血性质"/>
                                        </code>
                                        <value xsi:type="ST" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="BloodTransfusionNature"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="15">
                                            <originalText value="输血紧急标志"/>
                                        </code>
                                        <value xsi:type="BL" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="BloodTransfusionMark"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="16">
                                            <originalText value="病史信息"/>
                                        </code>
                                        <value xsi:type="ST" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="MedicalHistoryInfo"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="17">
                                            <originalText value="输血史"/>
                                        </code>
                                        <value xsi:type="ST" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="BloodTransfusionHistory"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="18">
                                            <originalText value="输血反应史"/>
                                        </code>
                                        <value xsi:type="ST" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="BloodTransfusionReactionHistory"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="19">
                                            <originalText value="药物过敏史"/>
                                        </code>
                                        <value xsi:type="ST" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="DrugAllergyHistory"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="GEN" moodCode="EVN">
                                        <code code="20">
                                            <originalText value="孕次"/>
                                        </code>
                                        <value xsi:type="PQ" value="2" unit="次">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="PregnanciesNumber"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="GEN" moodCode="EVN">
                                        <code code="21">
                                            <originalText value="产次"/>
                                        </code>
                                        <value xsi:type="PQ" value="2" unit="次">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="BirthsNumber"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="22">
                                            <originalText value="其他重要病史"/>
                                        </code>
                                        <value xsi:type="ST" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="OtherMedicalHistory"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="23">
                                            <originalText value="备注"/>
                                        </code>
                                        <value xsi:type="ST" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="Notices"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                                <component typeCode="COMP">
                                    <observation classCode="GEN" moodCode="EVN">
                                        <code code="24">
                                            <originalText value="血量"/>
                                        </code>
                                        <value xsi:type="PQ" value="" unit="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="BloodVolume"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="unit">
                                                <xsl:value-of select="BloodVolumeUnit"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </component>
                            </organizer>
                        </pertinentInformation>
                        <!--就诊 -->
                        <componentOf1 contextConductionInd="false" xsi:nil="false" typeCode="COMP">
                            <!--就诊 -->
                            <encounter classCode="ENC" moodCode="EVN">
                                <id>
                                    <!-- 就诊次数 -->
                                    <item extension="2" root="2.16.156.10011.2.5.1.8">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="VisitNum"/>
                                        </xsl:attribute>
                                    </item>
                                    <!-- 就诊流水号 -->
                                    <item extension="123456" root="2.16.156.10011.2.5.1.9">
                                        <xsl:attribute name="extension">
                                            <xsl:value-of select="AdmID"/>
                                        </xsl:attribute>
                                    </item>
                                </id>
                                <!--就诊类别编码-->
                                <code codeSystem="2.16.156.10011.2.3.1.271" codeSystemName="患者类型代码表" code="01">
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
                                            <administrativeGenderCode code="1" codeSystem="2.16.156.10011.2.3.3.4">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="GenderCode"/>
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
                            </encounter>
                        </componentOf1>
                    </procedureRequest>
                </subject>
            </controlActProcess>
        </POOR_IN200902UV>
    </xsl:template>
</xsl:stylesheet>