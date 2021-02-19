<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0005">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.25"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0005" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>中药处方</title>
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
                    <!--门急（诊）号-->
                    <id root="2.16.156.10011.1.11" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="OutPatientID"/>
                        </xsl:attribute>
                    </id>
                    <!--处方编号-->
                    <id root="2.16.156.10011.1.20" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="PrescriptionID"/>
                        </xsl:attribute>
                    </id>
                    <patient classCode="PSN" determinerCode="INSTANCE">
                        <!--患者身份证号标识-->
                        <id root="2.16.156.10011.1.3" extension="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="PatientInfo/IDCardNo"/>
                            </xsl:attribute>
                        </id>
                        <!--患者姓名、性别、年龄-->
                        <name>
                            <xsl:value-of select="PatientInfo/PatientName"/>
                        </name>
                        <administrativeGenderCode code="" codeSystem="2.16.156.10011.2.3.3.4" codeSystemName="生理性别代码表(GB/T 2261.1)" displayName="">
                            <xsl:attribute name="code">
                                <xsl:value-of select="PatientInfo/GenderCode"/>
                            </xsl:attribute>
                            <xsl:attribute name="displayName">
                                <xsl:value-of select="PatientInfo/GenderName"/>
                            </xsl:attribute>
                        </administrativeGenderCode>
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                    <!-- 开立科室 -->
                    <providerOrganization>
                        <id root="2.16.156.10011.1.26">
                            <xsl:value-of select="PrescribeDeptCode"/>
                        </id>
                        <name>
                            <xsl:value-of select="PrescribeDeptName"/>
                        </name>
                        <asOrganizationPartOf>
                            <wholeOrganization>
                                <!-- 医疗机构组织机构代码 -->
                                <id root="2.16.156.10011.1.5" extension="">
                                    <xsl:attribute name="extension">
                                        <xsl:value-of select="PrescribeOrgCode"/>
                                    </xsl:attribute>
                                </id>
                                <name>
                                    <xsl:value-of select="PrescribeOrgName"/>
                                </name>
                            </wholeOrganization>
                        </asOrganizationPartOf>
                    </providerOrganization>
                </patientRole>
            </recordTarget>
            <!-- 文档创作者 -->
            <author typeCode="AUT" contextControlCode="OP">
                <!-- 处方开立日期 -->
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
                    <!--处方开立医师-->
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
            <!-- 签名 -->
            <legalAuthenticator>
                <!--签名日期时间-->
                <time value="">
                    <xsl:attribute name="value">
                        <xsl:value-of select="PrescribeDoctor/Time"/>
                    </xsl:attribute>
                </time>
                <signatureCode/>
                <assignedEntity>
                    <id root="2.16.156.10011.1.4" extension="">
                        <xsl:attribute name="extension">
                            <xsl:value-of select="PrescribeDoctor/Code"/>
                        </xsl:attribute>
                    </id>
                    <code displayName="处方开立医师"/>
                    <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                        <name>
                            <xsl:value-of select="PrescribeDoctor/Name"/>
                        </name>
                    </assignedPerson>
                </assignedEntity>
            </legalAuthenticator>
            <!-- 签名 -->
            <xsl:for-each select="AuditDoctor/row">
                <authenticator>
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
                        <code displayName="处方审核药剂师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!-- 签名 -->
            <xsl:for-each select="MixDoctor/row">
                <authenticator>
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
                        <code displayName="处方调配药剂师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!-- 签名 -->
            <xsl:for-each select="CheckDoctor/row">
                <authenticator>
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
                        <code displayName="处方核对药剂师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <!-- 签名 -->
            <xsl:for-each select="DispenseDoctor/row">
                <authenticator>
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
                        <code displayName="处方发药药剂师"/>
                        <assignedPerson classCode="PSN" determinerCode="INSTANCE">
                            <name>
                                <xsl:value-of select="Name"/>
                            </name>
                        </assignedPerson>
                    </assignedEntity>
                </authenticator>
            </xsl:for-each>
            <relatedDocument typeCode="RPLC">
                <parentDocument>
                    <id>
                        <xsl:value-of select="ParentDocID"/>
                    </id>
                    <setId>
                        <xsl:value-of select="ParentDocSetID"/>
                    </setId>
                    <versionNumber>
                        <xsl:value-of select="ParentVersion"/>
                    </versionNumber>
                </parentDocument>
            </relatedDocument>
            <!--
*******************************************************
WS/T XXXXX—2013
24
文档体Body
*******************************************************
-->
            <component>
                <structuredBody>
                    <!--
********************************************************
诊断章节
********************************************************
-->
                    <!--诊断章节-->
                    <component>
                        <section>
                            <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--条目：诊断-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.024.00" displayName="西医诊断编码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11" codeSystemName="ICD-10" displayName="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="WesternDiagCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="WesternDiagName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中医诊断病名代码">
                                        <qualifier>
                                            <name displayName="中医诊断病名代码"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)" displayName="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="ChineseDiagCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="ChineseDiagName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.10.130.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="中医证候代码">
                                        <qualifier>
                                            <name displayName="中医证候代码"/>
                                        </qualifier>
                                    </code>
                                    <value xsi:type="CD" code="" displayName="" codeSystem="2.16.156.10011.2.3.3.14" codeSystemName="中医病证分类与代码表( GB/T 15657)">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="ChineseSymptomCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="ChineseSymptomName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
********************************************************
用药章节
********************************************************
-->
                    <!--用药章节 1..*-->
                    <component>
                        <section>
                            <code code="10160-0" displayName="HISTORY OF MEDICATION USE" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--处方条目-->
                            <xsl:for-each select="PrescriptionInfo/row">
                                <entry>
                                    <substanceAdministration classCode="SBADM" moodCode="EVN">
                                        <text/>
                                        <routeCode code="" displayName="" codeSystem="2.16.156.10011.2.3.1.158" codeSystemName="用药途径代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="RouteCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="RouteName"/>
                                            </xsl:attribute>
                                        </routeCode>
                                        <!--用药剂量-单次 -->
                                        <doseQuantity value="" unit="mg">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="Dosage"/>
                                            </xsl:attribute>
                                        </doseQuantity>
                                        <!--用药频率 -->
                                        <rateQuantity>
                                            <translation code="" displayName="bid">
                                                <xsl:attribute name="code">
                                                    <xsl:value-of select="Frequency"/>
                                                </xsl:attribute>
                                            </translation>
                                        </rateQuantity>
                                        <!--药物剂型 -->
                                        <administrationUnitCode code="" displayName="" codeSystem="2.16.156.10011.2.3.1.211" codeSystemName="药物剂型代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="UnitCode"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="displayName">
                                                <xsl:value-of select="UnitName"/>
                                            </xsl:attribute>
                                        </administrationUnitCode>
                                        <consumable>
                                            <manufacturedProduct>
                                                <manufacturedLabeledDrug>
                                                    <!--药品代码及名称(通用名) -->
                                                    <code/>
                                                    <name>
                                                        <xsl:value-of select="DrugName"/>
                                                    </name>
                                                </manufacturedLabeledDrug>
                                            </manufacturedProduct>
                                        </consumable>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE08.50.043.00" displayName="药物规格" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="DrugUnit"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.135.00" displayName="药物使用总剂量" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="PQ" value="" unit="mg">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="DrugTotalDose"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </substanceAdministration>
                                </entry>
                            </xsl:for-each>
                            <!--处方有效天数-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.294.00" displayName="处方有效天数" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="PQ" value="" unit="天">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="EffectiveDays"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--处方药品组号-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE08.50.056.00" displayName="处方药品组号" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="INT" value="">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="DrugGroupNum"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                            <!--中药饮片处方-->
                            <xsl:for-each select="Decoction/row">
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN ">
                                        <code code="DE08.50.049.00" displayName="中药饮片处方" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="DecoctionPieces"/>
                                        </value>
                                        <!--中药饮片剂数-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN ">
                                                <code code="DE08.50.050.00" displayName="中药饮片剂数" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="PQ" value="" unit="剂">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="PiecesNum"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--中药饮片煎煮法-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN ">
                                                <code code="DE08.50.047.00" displayName="中药煎煮法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="DecoctMethod"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <!--中药用药方法-->
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN ">
                                                <code code="DE06.00.136.00" displayName="中药用药法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="UseMethod"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </observation>
                                </entry>
                            </xsl:for-each>
                            <!-- 处方类别代码 DE08.50.032.00 处方类别代码 -->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE08.50.032.00" displayName="处方类别代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.2.40" codeSystemName="处方类别代码表" displayName="">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="PrescriptionTypeCode"/>
                                        </xsl:attribute>
                                        <xsl:attribute name="displayName">
                                            <xsl:value-of select="PrescriptionTypeName"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
**********************************************
费用章节
**********************************************
-->
                    <component>
                        <section>
                            <code code="48768-6" displayName="PAYMENT SOURCES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE07.00.004.00" displayName="处方药品金额" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="MO" value="" currency="元">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PrescriptionDrugFee"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--
***********************************************
治疗计划章节
***********************************************
-->
                    <component>
                        <section>
                            <code code="18776-5" displayName="TREATMENT PLAN" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--处方备注信息-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.179.00" displayName="处方备注信息" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="PrescriptionNote"/>
                                    </value>
                                </observation>
                            </entry>
                            <!--治则治法-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE06.00.300.00" displayName="治则治法" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="ST">
                                        <xsl:value-of select="TreatmentPrinciple"/>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                </structuredBody>
            </component>
        </ClinicalDocument>
    </xsl:template>
</xsl:stylesheet>