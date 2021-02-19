<xsl:stylesheet version="1.0" xmlns="urn:hl7-org:v3" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:template match="H0303Rt">
		<PRPM_IN406010UV01 xmlns="urn:hl7-org:v3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" ITSVersion="XML_1.0" xsi:schemaLocation="urn:hl7-org:v3 ../multicacheschemas/PRPM_IN406010UV01.xsd">
			<id root="2.16.156.10011.2.5.1.1" extension="">
				<xsl:attribute name="extension"><xsl:value-of select="MsgID"/></xsl:attribute>
			</id>
			<creationTime value="">
				<xsl:attribute name="value"><xsl:value-of select="CreateTime"/></xsl:attribute>
			</creationTime>
			<interactionId root="2.16.156.10011.2.5.1.2" extension="PRPM_IN406010UV01"/>
			<processingCode code="P"/>
			<processingModeCode/>
			<acceptAckCode code="AL"/>
			<receiver typeCode="RCV">
				<device classCode="DEV" determinerCode="INSTANCE">
					<id>
						<item root="2.16.156.10011.2.5.1.3" extension ="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Sender"/>
                            </xsl:attribute>
                        </item>
					</id>
				</device>
			</receiver>
			<sender typeCode="SND">
				<device classCode="DEV" determinerCode="INSTANCE">
					<id>
						<item root="2.16.156.10011.2.5.1.3" extension ="">
                            <xsl:attribute name="extension">
                                <xsl:value-of select="Sender"/>
                            </xsl:attribute>
                        </item>
					</id>
				</device>
			</sender>
			<controlActProcess classCode="CACT" moodCode="EVN">
				<queryByParameterPayload>
					<!--查询事件的状态-->
					<statusCode code="new"/>
					<!--医疗卫生机构（科室）ID-->
					<organizationID>
						<value root="2.16.156.10011.1.26" extension="">
							<xsl:attribute name="extension"><xsl:value-of select="DeptCode"/></xsl:attribute>
						</value>
					</organizationID>
					<!--医疗卫生机构（科室）实体名称-->
					<organizationName>
						<value>
							<part value="">
								<xsl:attribute name="value"><xsl:value-of select="DeptName"/></xsl:attribute>
							</part>
						</value>
					</organizationName>
					<!--医疗卫生机构（科室）状态AssignedEntity.statusCode-->
					<status>
						<value code="active"/>
					</status>
				</queryByParameterPayload>
			</controlActProcess>
		</PRPM_IN406010UV01>
	</xsl:template>
</xsl:stylesheet>