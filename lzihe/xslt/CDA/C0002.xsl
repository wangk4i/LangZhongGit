<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0002">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.22"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0002" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>门（急）诊病历</title>
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
            <recordTarget typeCode="RCT" contextControlCode="OP">
                <patientRole classCode="PAT">
                    <!--门（急）诊号标识 -->
                    <id root="2.16.156.10011.1.11" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="OutPatientID"/>
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
                        <birthTime value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/BirthTime"/>
                            </xsl:attribute>
                        </birthTime>
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                    <providerOrganization>
                        <id root="2.16.156.10011.1.26"/>
                        <name>
                            <xsl:value-of select="DeptName"/>
                        </name>
                        <asOrganizationPartOf>
                            <wholeOrganization>
                                <!-- 机构代码 -->
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
                    </providerOrganization>
                </patientRole>
            </recordTarget>
            <!--创建者-->
            <author typeCode="AUT" contextControlCode="OP">
                <!-- 就诊日期时间 -->
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
                    <!-- 就诊医师 -->
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
            <!-- 医师签名 -->
            <xsl:for-each select="AnesthetistInfo/row">
                <legalAuthenticator>
                    <time>
                        <xsl:value-of select="Time"/>
                    </time>
                    <signatureCode/>
                    <assignedEntity>
                        <id root="2.16.156.10011.1.4" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Code"/>
                            </xsl:attribute>
                        </id>
                        <code displayName="责任医生"/>
                        <assignedPerson>
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </legalAuthenticator>
            </xsl:for-each>
            <relatedDocument typeCode="RPLC">
                <parentDocument>
                    <id/>
                    <setId/>
                    <versionNumber/>
                </parentDocument>
            </relatedDocument>
            <component>
                <structuredBody>
                    <!-- 过敏史章节 -->
                    <component>
                        <section>
                            <code code="48765-2" displayName="Allergies, adverse reactions, alerts" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="AllergiesInfo/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.023.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="过敏史标志"/>
                                        <value xsi:type="BL" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="AllergiesSign"/>
                                            </xsl:attribute>
                                        </value>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.022.00" displayName="过敏史" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="AllergiesDesc"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!--主诉章节-->
                    <component>
                        <section>
                            <code code="10154-3" displayName="CHIEF COMPLAINT" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--主诉条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE04.01.119.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="主诉"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ChiefComplaintsDesc"/>
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
                            <!--现病史条目-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.071.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="现病史"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PresentIllnessDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!-- 既往史章节 -->
                    <component>
                        <section>
                            <code code="11348-0" displayName="HISTORY OF PAST ILLNESS" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="PastIllnessDesc/PastIllnessDescItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE02.10.099.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="既往史"/>
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
                            <code code="29545-1" displayName="PHYSICAL EXAMINATION" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--体格检查-一般状况检查结果-->
                            <xsl:for-each select="PhysicalExamResult/PhysicalExamResultItem">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE04.10.258.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="体格检查"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="."/>
                                        </value>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!-- 实验室检验章节 -->
                    <component>
                        <section>
                            <code code="30954-2" displayName="STUDIES SUMMARY" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="LaboratoryExamResult/LaboratoryExamResultItem">
                                <entry>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.30.010.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="辅助检查项目"/>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE04.30.009.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="辅助检查结果"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="."/>
                                                </value>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!-- 诊断记录章节 -->
                    <component>
                        <section>
                            <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--初诊标志代码-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.196.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="初诊标志代码"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.2.39" codeSystemName="初诊标志代码表" displayName="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="FirstVisitCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="FirstVisitName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--中医“四诊”观察结果-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE02.10.028.00" displayName="中医“四诊”观察结果" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="ChineseObserveDiagResult"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--条目：诊断-->
                            <xsl:for-each select="WesternDiagInfo/row">
                                <entry>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.01.025.00" displayName="诊断名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="WesternDiagValue"/>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.01.024.00" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表（ICD-10）">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="WesternDiagCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="ChineseDiagInfo/row">
                                <entry>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.172.00" displayName="中医病名名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                                    <qualifier>
                                                        <name displayName="中医病名名称"/>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="ChineseDiagName"/>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.130.00" displayName="中医病名代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                                    <qualifier>
                                                        <name displayName="中医病名代码"/>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表(GB/T 15657)">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="ChineseDiagCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="ChineseDiagName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                            <xsl:for-each select="ChineseSymptomInfo/row">
                                <entry>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.172.00" displayName="中医证候名称" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                                    <qualifier>
                                                        <name displayName="中医证候名称"/>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="ChineseSymptomName"/>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE05.10.130.00" displayName="中医证候代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录">
                                                    <qualifier>
                                                        <name displayName="中医证候代码"/>
                                                    </qualifier>
                                                </code>
                                                <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="ChineseSymptomCode"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                    <!-- 治疗计划章节 -->
                    <component>
                        <section>
                            <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--辨证依据描述-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.132.00" displayName="辨证依据" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="DialecticalBasisDesc"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--治则治法-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.300.00" displayName="治则治法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TreatmentPrincipleDesc"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--医嘱章节-->
                    <component>
                        <section>
                            <code code="46209-3" codeSystem="2.16.840.1.113883.6.1" displayName="ProviderOrders" codeSystemName="LOINC"/>
                            <text/>
                            <xsl:for-each select="OrderInfo/row">
                                <entry>
                                    <organizer classCode="CLUSTER" moodCode="EVN">
                                        <statusCode/>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.289.00" displayName="医嘱项目类型" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.1.268" codeSystemName="医嘱项目类型代码表">
                                                    <xsl:attribute name="code">
                                                        <xsl:value-of select="OrderItemTypeCode"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="displayName">
                                                        <xsl:value-of select="OrderItemTypeName"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </component>
                                        <component>
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.288.00" displayName="医嘱项目内容" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <effectiveTime>
                                                    <!--医嘱计划开始日期时间-->
                                                    <low value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderTimeLow"/>
                                                        </xsl:attribute>
                                                    </low>
                                                    <!--医嘱计划结束日期时间-->
                                                    <high value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderTimeHigh"/>
                                                        </xsl:attribute>
                                                    </high>
                                                </effectiveTime>
                                                <!--医嘱计划信息-->
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="OrderItemContent"/>
                                                </value>
                                                <!--执行者-->
                                                <performer>
                                                    <!--医嘱执行日期时间：DE06.00.222.00-->
                                                    <time value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderExcuteTime"/>
                                                        </xsl:attribute>
                                                    </time>
                                                    <assignedEntity>
                                                        <id root="2.16.156.10011.1.4"/>
                                                        <!--角色-->
                                                        <code displayName="医嘱执行者"/>
                                                        <!--医嘱执行者签名：DE02.01.039.00-->
                                                        <assignedPerson>
                                                            <name>
                                                                <xsl:value-of select="OrderExcutorName"/>
                                                            </name>
                                                        </assignedPerson>
                                                        <!--医嘱执行科室：DE08.10.026.00-->
                                                        <representedOrganization>
                                                            <name>
                                                                <xsl:value-of select="OrderExcuteDept"/>
                                                            </name>
                                                        </representedOrganization>
                                                    </assignedEntity>
                                                </performer>
                                                <!--作者：医嘱开立者-->
                                                <author>
                                                    <!--医嘱开立日期时间：DE06.00.220.00-->
                                                    <time value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderMakeTime"/>
                                                        </xsl:attribute>
                                                    </time>
                                                    <assignedAuthor>
                                                        <id root="2.16.156.10011.1.4"/>
                                                        <!--角色-->
                                                        <code displayName="医嘱开立者"/>
                                                        <!--医嘱开立者签名：DE02.01.039.00-->
                                                        <assignedPerson>
                                                            <name>
                                                                <xsl:value-of select="OrderMakePerson"/>
                                                            </name>
                                                        </assignedPerson>
                                                        <!--医嘱开立科室：DE08.10.026.00-->
                                                        <representedOrganization>
                                                            <name>
                                                                <xsl:value-of select="OrderMakeDept"/>
                                                            </name>
                                                        </representedOrganization>
                                                    </assignedAuthor>
                                                </author>
                                                <!--医嘱审核-->
                                                <participant typeCode="ATND">
                                                    <!--医嘱审核日期时间：DE09.00.088.00-->
                                                    <time value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderAuditTime"/>
                                                        </xsl:attribute>
                                                    </time>
                                                    <participantRole classCode="ASSIGNED">
                                                        <id root="2.16.156.10011.1.4"/>
                                                        <!--角色-->
                                                        <code displayName="医嘱审核人"/>
                                                        <!--医嘱审核人签名：DE02.01.039.00-->
                                                        <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                            <name>
                                                                <xsl:value-of select="OrderAuditPerson"/>
                                                            </name>
                                                        </playingEntity>
                                                    </participantRole>
                                                </participant>
                                                <!--医嘱取消-->
                                                <participant typeCode="ATND">
                                                    <!--医嘱取消日期时间：DE06.00.234.00-->
                                                    <time value="">
                                                        <xsl:attribute name="value">
                                                            <xsl:value-of select="OrderCancelTime"/>
                                                        </xsl:attribute>
                                                    </time>
                                                    <participantRole classCode="ASSIGNED">
                                                        <id root="2.16.156.10011.1.4"/>
                                                        <!--角色-->
                                                        <code displayName="医嘱取消人"/>
                                                        <!--取消医嘱者签名：DE02.01.039.00-->
                                                        <playingEntity classCode="PSN" determinerCode="INSTANCE">
                                                            <name>
                                                                <xsl:value-of select="OrderCancelPerson"/>
                                                            </name>
                                                        </playingEntity>
                                                    </participantRole>
                                                </participant>
                                                <!--医嘱备注信息-->
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE06.00.179.00" displayName="医嘱备注信息" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="OrderNote"/>
                                                        </value>
                                                    </observation>
                                                </entryRelationship>
                                                <!--医嘱执行状态-->
                                                <entryRelationship typeCode="COMP">
                                                    <observation classCode="OBS" moodCode="EVN">
                                                        <code code="DE06.00.290.00" displayName="医嘱执行状态" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                        <value xsi:type="ST">
                                                            <xsl:value-of select="OrderExcuteStatus"/>
                                                        </value>
                                                    </observation>
                                                </entryRelationship>
                                            </observation>
                                        </component>
                                    </organizer>
                                </entry>
                            </xsl:for-each>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>