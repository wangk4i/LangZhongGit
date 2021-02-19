<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0010">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.30"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0010" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>麻醉术前访视记录</title>
            <!-- 文档机器生成时间 -->
            <effectiveTime value="">
                <xsl:attribute name="value">
                    <xsl:value-of select="CreateTime"/>
                </xsl:attribute>
            </effectiveTime>
            <confidentialityCode code="N" codeSystem="2.16.840.1.113883.5.25" codeSystemName="Confidentiality" displayName="正常访问保密级别"/>
            <languageCode code="zh-CN"/>
            <setId>
                <xsl:value-of select="DocSetID"/>
            </setId>
            <versionNumber>
                <xsl:value-of select="Version"/>
            </versionNumber>
            <!--文档记录对象（患者） [1..*] contextControlCode="OP"表示本信息可以被重载-->
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!--门诊号标识-->
                    <id root="2.16.156.10011.1.11" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="OutPatientID"/>
                        </xsl:attribute>
                    </id>
                    <!--住院号标识-->
                    <id root="2.16.156.10011.1.12" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="HospitalizationID"/>
                        </xsl:attribute>
                    </id>
                    <!--电子申请单编号-->
                    <id root="2.16.156.10011.1.24" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="ApplyID"/>
                        </xsl:attribute>
                    </id>
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者身份证号标识-->
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="PatientInfo/IDCardNo"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="PatientInfo/PatientName"/>
                        </name>
                        <administrativeGenderCode code="" displayName="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <!-- 年龄 -->
                        <age value="" unit="岁">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                </patientRole>
            </recordTarget>
            <!-- 文档创作者 -->
            <author typeCode="AUT" contextControlCode="OP">
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="RecordTime"/>
                    </xsl:attribute>
                </time>
                <assignedAuthor classCode="ASSIGNED">
                    <id root="2.16.156.10011.1.7" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="AuthorCode"/>
                        </xsl:attribute>
                    </id>
                    <assignedPerson>
                        <name>
                            <xsl:value-of select="AuthorName"/>
                        </name>
                    </assignedPerson>
                </assignedAuthor>
            </author>
            <!-- 保管机构 -->
            <custodian typeCode="CST">
                <assignedCustodian classCode="ASSIGNED">
                    <representedCustodianOrganization classCode="ORG" determinerCode="INSTANCE">
                        <id root="2.16.156.10011.1.5" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="CustodianOrgCode"/>
                            </xsl:attribute>
                        </id>
                        <name>
                            <xsl:value-of select="CustodianOrgName"/>
                        </name>
                    </representedCustodianOrganization>
                </assignedCustodian>
            </custodian>
            <!--麻醉医师签名-->
            <xsl:for-each select="AnesthesiaInfoSignInfo/row">
                <authenticator>
                    <!--签名日期时间-->
                    <time value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="Time"/>
                        </xsl:attribute>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="麻醉医师"/>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <relatedDocument typeCode="RPLC">
                <parentDocument>
                    <id/>
                    <setId/>
                    <versionNumber/>
                </parentDocument>
            </relatedDocument>
            <!--病床号、病房、病区、科室和医院的关联 -->
            <componentOf>
                <encompassingEncounter>
                    <!-- 入院日期时间 -->
                    <effectiveTime value="">
                        <xsl:attribute name="value">
                            <xsl:value-of select="HospitalizationTime"/>
                        </xsl:attribute>
                    </effectiveTime>
                    <location>
                        <healthCareFacility>
                            <serviceProviderOrganization>
                                <asOrganizationPartOf classCode="PART">
                                    <!-- DE01.00.026.00病床号 -->
                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                        <id root="2.16.156.10011.1.22" extension="">
                                            <xsl:attribute name="extension">
                                                <xsl:value-of select="BedCode"/>
                                            </xsl:attribute>
                                        </id>
                                        <name>
                                            <xsl:value-of select="BedName"/>
                                        </name>
                                        <!-- DE01.00.019.00病房号 -->
                                        <asOrganizationPartOf classCode="PART">
                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                <id root="2.16.156.10011.1.21" extension="">
                                                    <xsl:attribute name="extension">
                                                        <xsl:value-of select="RoomCode"/>
                                                    </xsl:attribute>
                                                </id>
                                                <name>
                                                    <xsl:value-of select="RoomName"/>
                                                </name>
                                                <!-- DE08.10.026.00科室名称 -->
                                                <asOrganizationPartOf classCode="PART">
                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                        <id root="2.16.156.10011.1.26" extension="">
                                                            <xsl:attribute name="extension">
                                                                <xsl:value-of select="DeptCode"/>
                                                            </xsl:attribute>
                                                        </id>
                                                        <name>
                                                            <xsl:value-of select="DeptName"/>
                                                        </name>
                                                        <!-- DE08.10.054.00病区名称 -->
                                                        <asOrganizationPartOf classCode="PART">
                                                            <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                <id root="2.16.156.10011.1.27" extension="">
                                                                    <xsl:attribute name="extension">
                                                                        <xsl:value-of select="AreaCode"/>
                                                                    </xsl:attribute>
                                                                </id>
                                                                <name>
                                                                    <xsl:value-of select="AreaName"/>
                                                                </name>
                                                                <!--XXX医院 -->
                                                                <asOrganizationPartOf classCode="PART">
                                                                    <wholeOrganization classCode="ORG" determinerCode="INSTANCE">
                                                                        <id root="2.16.156.10011.1.5" extension="">
                                                                            <xsl:attribute name="extension">
                                                                                <xsl:value-of select="OrganCode"/>
                                                                            </xsl:attribute>
                                                                        </id>
                                                                        <name>
                                                                            <xsl:value-of select="OrganName"/>
                                                                        </name>
                                                                    </wholeOrganization>
                                                                </asOrganizationPartOf>
                                                            </wholeOrganization>
                                                        </asOrganizationPartOf>
                                                    </wholeOrganization>
                                                </asOrganizationPartOf>
                                            </wholeOrganization>
                                        </asOrganizationPartOf>
                                    </wholeOrganization>
                                </asOrganizationPartOf>
                            </serviceProviderOrganization>
                        </healthCareFacility>
                    </location>
                </encompassingEncounter>
            </componentOf>
            <!--***************************************************
            文档体Body
            *******************************************************
            -->
            <component>
                <structuredBody>
                    <!--
                    ********************************************************
                    术前诊断章节
                    ********************************************************
                    -->
                    <component>
                        <section>
                            <code code="10219-4" displayName="Surgical operation note preoperative Dx" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--术前诊断-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <!--术前诊断编码-->
                                    <code code="DE05.01.024.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前诊断编码"/>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PreoperativeDiagCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="PreoperativeDiagName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 术前合并疾病 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.076.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前合并疾病"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PreoperativeComorbidities"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--现病史章节-->
                    <component>
                        <section>
                            <code code="10164-2" displayName="HISTORY OF PRESENT ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--简要病史条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.140.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="简要病史"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="BriefIllnessDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--既往史章节-->
                    <component>
                        <section>
                            <code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--过敏史条目-->
                            <xsl:for-each select="AllergiesDesc/AllergiesDescItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.022.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--体格检查章节-->
                    <component>
                        <section>
                            <code code="29545-1" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC" displayName="PHYSICAL EXAMINATION"/>
                            <text/>
                            <!-- 体重 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.188.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体重"/>
                                    <value xsi:type="PQ" value="" unit="kg">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PatientWeight"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 一般状况检查结果 -->
                            <xsl:for-each select="GeneralExamResult/GeneralExamResultItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE04.10.219.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="一般状况检查结果"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!-- 精神状态正常标志 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.142.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="精神状态正常标志"/>
                                    <value xsi:type="BL" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="MentalStateSign"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 心脏听诊结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.207.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="心脏听诊结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="HeartAuscultationResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 肺部听诊结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.031.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="肺部听诊结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="LungsAuscultationResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 四肢检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.179.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="四肢检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="LimbsExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 脊柱检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.093.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="脊柱检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="SpineExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 腹部检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.046.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="腹部检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="AbdominalExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 气管检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.230.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="气管检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TracheaExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 牙齿检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.10.264.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="牙齿检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TeethExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
                    ********************************************************
                    实验室检查章节
                    ********************************************************
                    -->
                    <component>
                        <section>
                            <code code="30954-2" displayName="STUDIES SUMMARY" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry typeCode="COMP">
                                <!-- 血型-->
                                <organizer classCode="BATTERY" moodCode="EVN">
                                    <statusCode/>
                                    <component typeCode="COMP">
                                        <!-- ABO血型 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.001.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="ABO血型代码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.85" codeSystemName="ABO血型代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="ABOBloodTypeCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="ABOBloodTypeName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                    <component typeCode="COMP">
                                        <!-- Rh血型 -->
                                        <observation classCode="OBS" moodCode="EVN">
                                            <code code="DE04.50.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="Rh（D）血型代码"/>
                                            <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.250" codeSystemName="Rh(D)血型代码表">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="RHBloodTypeCode"/>
                                                </xsl:attribute>
                                                <xsl:attribute name="displayName">
                                                    <xsl:value-of select="RHBloodTypeName"/>
                                                </xsl:attribute>
                                            </value>
                                        </observation>
                                    </component>
                                </organizer>
                            </entry>
                            <!-- 心电图检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.30.043.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="心电图检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ECGExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 胸部X线检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.30.045.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="胸部X线检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ChestXRayExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- CT检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.30.005.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="CT检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="CTExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- B超检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.30.002.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="B超检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="BScanExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- MRI检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.30.009.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="MRI检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="MRIExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 肺功能检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.30.009.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="肺功能检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="LungFunctionExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 血常规检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.50.128.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="血常规检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="BloodRoutineExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 尿常规检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.50.048.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="尿常规检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="UrineRoutineExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 凝血功能检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.50.142.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="凝血功能检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="BloodCoagulationExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 肝功能检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.50.026.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="肝功能检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="LiverFunctionExamCode"/>
                                    </value>
                                </observation>
                            </entry>
                            <!-- 血气分析检查结果 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.50.128.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="血气分析检查结果"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="BloodGasExamResult"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
                    ********************************************************
                    治疗计划章节
                    ********************************************************
                    -->
                    <component>
                        <section>
                            <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!-- 拟实施手术及操作编码 DE06.00.093.00 -->
                            <xsl:for-each select="AnticipatedOperationInfo/row">
                                <entry>
                                    <procedure classCode="PROC" moodCode="EVN">
                                        <code xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.12" codeSystemName="手术(操作)代码表(ICD-9-CM)">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="AnticipatedOperationCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="AnticipatedOperationName"/>
                                            </xsl:attribute>
                                        </code>
                                        <!--手术间编号-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.256.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="患者实施手术所在的手术室编号"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="OperationRoomCode"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </procedure>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="AnticipatedAnesthesiaInfo/row">
                                <entry>
                                    <!-- 拟实施麻醉方法代码 -->
                                    <observation classCode="OBS" moodCode="INT">
                                        <code code="DE06.00.073.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="拟实施麻醉方法代码"/>
                                        <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.159" codeSystemName="麻醉方法代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="AnticipatedAnesthesiaMethodCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="AnticipatedAnesthesiaMethodName"/>
                                            </xsl:attribute>
                                        </value>
                                        <!-- 术前麻醉医嘱 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="INT">
                                                <code code="DE06.00.287.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="术前麻醉医嘱"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="AnesthesiaOrderDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!-- 麻醉适应证 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.227.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="麻醉适应证"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="AnesthesiaIndicationDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!-- 注意事项 -->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE09.00.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="注意事项"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="AnesthesiaNote"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>