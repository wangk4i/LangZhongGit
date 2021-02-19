<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="C0004">
        <ClinicalDocument xmlns="urn:hl7-org:v3" xmlns:mif="urn:hl7-org:v3/mif" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
            <realmCode code="CN"/>
            <typeId root="2.16.840.1.113883.1.3" extension="POCD_MT000040"/>
            <templateId root="2.16.156.10011.2.1.1.24"/>
            <!-- 文档流水号 -->
            <id root="2.16.156.10011.1.1" extension="">
                <xsl:attribute name="extension">
                    <xsl:value-of select="DocID"/>
                </xsl:attribute>
            </id>
            <code code="C0004" codeSystem="2.16.156.10011.2.4" codeSystemName="卫生信息共享文档规范编码体系"/>
            <title>西药处方</title>
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
                        <age unit="岁" value="">
                            <xsl:attribute name="value">
                                <xsl:value-of select="PatientInfo/PatientAge"/>
                            </xsl:attribute>
                        </age>
                    </patient>
                    <!-- 开立科室 -->
                    <providerOrganization>
                        <id root="2.16.156.10011.1.26"/>
                        <name>
                            <xsl:value-of select="PrescribeDept"/>
                        </name>
                        <asOrganizationPartOf>
                            <wholeOrganization>
                                <!-- 机构代码 -->
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
            <!--创建者-->
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
                    <!-- 处方开立医师 -->
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
            <!-- 处方审核药剂师签名 -->
            <xsl:for-each select="AuditDoctor/row">
                <legalAuthenticator>
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
                </legalAuthenticator>
            </xsl:for-each>
            <!-- 处方调配药剂师签名 -->
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
            <!-- 处方核对药剂师 -->
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
            <!-- 处方发药药剂师签名 -->
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
                    <id/>
                    <setId/>
                    <versionNumber/>
                </parentDocument>
            </relatedDocument>
            <component>
                <structuredBody>
                    <!--诊断记录章节-->
                    <component>
                        <section>
                            <code code="29548-5" displayName="Diagnosis" codeSystem="2.16.840.1.11883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <!--条目：诊断-->
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE05.01.024.00" displayName="诊断代码" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录"/>
                                    <value xsi:type="CD" code="" codeSystem="2.16.156.10011.2.3.3.11.3" codeSystemName="诊断代码表ICD-10">
                                        <xsl:attribute name="code">
                                            <xsl:value-of select="DiagCode"/>
                                        </xsl:attribute>
                                    </value>
                                </observation>
                            </entry>
                        </section>
                    </component>
                    <!--用药章节 1..*-->
                    <xsl:for-each select="MedDetails/row">
                        <component>
                            <section>
                                <code code="10160-0" codeSystem="2.16.840.1.113883.6.1" displayName="HISTORY OF MEDICATION USE" codeSystemName="LOINC"/>
                                <text/>
                                <entry>
                                    <substanceAdministration classCode="SBADM" moodCode="EVN">
                                        <text/>
                                        <routeCode code="" codeSystem="2.16.156.10011.2.3.1.158" codeSystemName="用药途径代码表">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="MedicationUseCode"/>
                                            </xsl:attribute>
                                        </routeCode>
                                        <!--用药剂量-单次 -->
                                        <doseQuantity value="" unit="mg">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="MedicationDosage"/>
                                            </xsl:attribute>
                                        </doseQuantity>
                                        <!--用药频率 -->
                                        <rateQuantity value="" unit="次/日">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="MedicationFrequency"/>
                                            </xsl:attribute>
                                        </rateQuantity>
                                        <!--药物剂型 -->
                                        <administrationUnitCode code="" displayName="药物剂型代码表" codeSystem="2.16.156.10011.2.3.1.211">
                                            <xsl:attribute name="code">
                                                <xsl:value-of select="MedicationDosageFormCode"/>
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
                                                <code code="DE08.50.043.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物规格"/>
                                                <value xsi:type="ST">
                                                    <xsl:value-of select="DrugSpecification"/>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                        <entryRelationship typeCode="COMP">
                                            <observation classCode="OBS" moodCode="EVN">
                                                <code code="DE06.00.135.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="药物使用总剂量"/>
                                                <value xsi:type="PQ" value="">
                                                    <xsl:attribute name="value">
                                                        <xsl:value-of select="DrugTotalDose"/>
                                                    </xsl:attribute>
                                                </value>
                                            </observation>
                                        </entryRelationship>
                                    </substanceAdministration>
                                </entry>
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE06.00.294.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="处方有效天数"/>
                                        <value xsi:type="PQ" value="" unit="天">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="EffectiveDays"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE08.50.056.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="处方药品组号"/>
                                        <value xsi:type="INT" value="">
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="DrugGroupNum"/>
                                            </xsl:attribute>
                                        </value>
                                    </observation>
                                </entry>
                                <entry>
                                    <observation classCode="OBS" moodCode="EVN">
                                        <code code="DE06.00.179.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="处方备注信息"/>
                                        <value xsi:type="ST">
                                            <xsl:value-of select="NoteDesc"/>
                                        </value>
                                    </observation>
                                </entry>
                            </section>
                        </component>
                    </xsl:for-each>
                    <!--费用章节-->
                    <component>
                        <section>
                            <code code="48768-6" displayName="PAYMENT SOURCES" codeSystem="2.16.840.1.113883.6.1" codeSystemName="LOINC"/>
                            <text/>
                            <entry>
                                <observation classCode="OBS" moodCode="EVN">
                                    <code code="DE07.00.004.00" codeSystem="2.16.156.10011.2.2.1" codeSystemName="卫生信息数据元目录" displayName="处方药品金额"/>
                                    <value xsi:type="MO" value="" currency="元">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="PrescriptionExpense"/>
                                        </xsl:attribute>
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