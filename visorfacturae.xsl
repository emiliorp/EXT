<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:m="http://www.facturae.es/Facturae/2007/v3.1/Facturae" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:tns="http://schemas.xmlsoap.org/soap/envelope/">
<xsl:output method="html" indent="yes"/>
<xsl:decimal-format grouping-separator="." decimal-separator=","/>
<xsl:template match="/">  
<html>
	<head>
	<xsl:variable name="versionvisor"><xsl:text>0.92</xsl:text></xsl:variable>
    <title>Visor Facturae v.<xsl:value-of select="$versionvisor"/></title>
<style type="text/css" media="screen, print, handheld">
body, html {
	margin: 0em;
	padding: 0em;
	background-color: #ffffff;
	font-size: 12px;
	line-height:18px;
}
sup {
	font-size: 0.6em;
}
p {
	margin: 0em;
	padding: 0em;
}
img {
	border:none;
}
ul {

	list-style-type: none;
}
li {

	color:#000033;
}
table {
	border:1px solid #333333;
	border-collapse:collapse;
	empty-cells:hide;
	margin-bottom:1.5em;
	margin-top:0.2em;
	width:99%;
}

table caption {
	font-size: 1.1em;
	font-weight: bold;
	text-align: center;
	background-color: #5F717F;
	padding: 0.1em;
	color: #FFFFFF;
	margin-top: 1em;
	margin:auto;
	border: 1px solid #4F4F4F;

}
table th {
	padding-left: 0.3em;
	text-align: left;
	margin:auto;
	border: 1px solid #4F4F4F;
	background-color: #CFCFCF;	
}
table td {
	text-align:left;
	border: 1px solid #4F4F4F;
	padding: 0.3em;
	margin:auto;
}

#todo {
	margin-right: auto;
	margin-left: auto;
	font-family: "helvetica neue", helvetica, arial, sans-serif;
	font-size: 1em;
//	overflow: hidden;
	margin-top: 0.5em;
	background-color: #FFFFFF;
	width: 98%;
	padding:0 0 0.5em 0;
	margin-bottom: 0.5em;
	position: relative;
	min-width:720px;
	max-width:100%;
}
#horizontal {
	-moz-border-radius-bottomleft:10px;
	-moz-border-radius-bottomright:10px;
	-moz-border-radius-topleft:10px;
	-moz-border-radius-topright:10px;
	clear:both;
	float:left;
	padding:0.5em;
	width:93%;
	border: 1px solid #E0DFE3;
	margin:0.2em 0.2em 1em;
}
#actores {
	float:left;
  clear:both;
}
#izq {
	-moz-border-radius-bottomleft:10px;
	-moz-border-radius-bottomright:10px;
	-moz-border-radius-topleft:10px;
	-moz-border-radius-topright:10px;
	float:left;
	padding:0.5em;
	width:30%;
	border: 1px solid #E0DFE3;
	margin:0.2em 0.2em 1em;
	overflow:inherit;	
}

#central {
	-moz-border-radius-bottomleft:10px;
	-moz-border-radius-bottomright:10px;
	-moz-border-radius-topleft:10px;
	-moz-border-radius-topright:10px;
	float:left;
	padding:0.5em;
	width:30%;
	border: 1px solid #E0DFE3;	
	margin:0.2em 0.2em 1em;	
	overflow:inherit;	
}

#dcha {
	-moz-border-radius-bottomleft:10px;
	-moz-border-radius-bottomright:10px;
	-moz-border-radius-topleft:10px;
	-moz-border-radius-topright:10px;
	float:left;
	padding:0.5em;
	width:30%;
	border: 1px solid #E0DFE3;
	margin:0.2em 0.2em 1em;	
	overflow:inherit;	
}
#mitad-izq {
	-moz-border-radius-bottomleft:10px;
	-moz-border-radius-bottomright:10px;
	-moz-border-radius-topleft:10px;
	-moz-border-radius-topright:10px;
	float:left;
	padding:0.5em;
	width:37%;
	border:1px solid #E0DFE3;
  margin:0.2em 0.2em 1em;
	overflow:auto;	
}
#mitad-dcha {
	-moz-border-radius-bottomleft:10px;
	-moz-border-radius-bottomright:10px;
	-moz-border-radius-topleft:10px;
	-moz-border-radius-topright:10px;
	float:right;
	padding:0.5em;
	width:57%;
	border:1px solid #E0DFE3;	
	margin:0.2em 0.2em 1em;	
	overflow:auto;
}
.titulo {
	-moz-border-radius-bottomleft:2px;
	-moz-border-radius-bottomright:2px;
	-moz-border-radius-topleft:2px;
	-moz-border-radius-topright:2px;
	font-size: 1.1em;
	font-weight: bold;
	text-align:left;
	background-color: #5F717F;
	padding: 0.1em 0 0 0.5em;
	color: #FFFFFF;
	margin-top: 1em;
	width:99%;
}

#firma_digital {
	background-image:url(data:image/jpeg;base64,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);
	background-position:0.5em 1em;
	background-repeat:no-repeat;
	float:left;
	margin:0.2em 0.2em 1em;
	padding:0.5em 0 0.5em 4em;
	width:90%;
}

#firma_digital p{
	font-weight: bold;
	padding-right: 1em;
}

.cuadro_firma{
	-moz-border-radius-bottomleft:5px;
	-moz-border-radius-bottomright:5px;
	-moz-border-radius-topleft:5px;
	-moz-border-radius-topright:5px;
	padding: 1em;
	margin-top:0.5em;
	border: 1px solid #5F717F;
	background-color:#EFEFEF;
	width:80%;
  overflow:auto;
  word-wrap: break-word;
}

.nombre {
	font-weight: bold;
} 
.nombre2 {
	color: #666666;
}
.img_izquierda {
	float: left;
	margin-right: 1em;
	padding-right: 1em;
	margin-bottom: 1em;
	clear: left;
}


#detalles_factura {
	-moz-border-radius-bottomleft:10px;
	-moz-border-radius-bottomright:10px;
	-moz-border-radius-topleft:10px;
	-moz-border-radius-topright:10px;
	clear:both;
//	display:block;
	float:left;
	margin:0.2em;
//	overflow:hidden;
	padding-left:1em;
	padding-top:0.5em;
	visibility:visible;
	width:93%;
	border: 1px solid #E0DFE3;
}

#bloque_der {
	display:block;
	float:right;
	padding:0.5em;
	width:35%;
}

#bloque_der table th {
	padding-left: 0.3em;
	text-align: left;
	margin:auto;
	border: 1px solid #4F4F4F;
	background-color: #ffffff;	
}

#bloque_der table td {
	text-align: right;
	border: 1px solid #4F4F4F;
	padding: 0.3em;
	margin:auto;
}

#pie {
	clear:left;
	float:left;
	padding:0.5em;
	width:93%;
	margin:0.2em 0.2em 1em;
}
</style>

	</head>
		<xsl:variable name="formatofra">
			<xsl:choose>
				<xsl:when test="m:Facturae/FileHeader/SchemaVersion!=''">Facturae <xsl:value-of select="m:Facturae/FileHeader/SchemaVersion"/></xsl:when>
				<xsl:otherwise>Desconocido</xsl:otherwise>
			</xsl:choose>	
		</xsl:variable>
		<center><span class="nombre">Formato de factura: </span><xsl:value-of select="$formatofra"/></center>
		<xsl:if test="m:Facturae/FileHeader/SchemaVersion">
			<xsl:apply-templates select="//m:Facturae"/>
		</xsl:if>

</html>
</xsl:template>
<!-- ***********************************************PLANTILLA DE FACTURA*********************************************************************************-->
<xsl:template match="m:Facturae">       
<body>
<div id="todo">
<div id="cuerpo">
<!-- ***********************************************DATOS DE FIRMA*********************************************************************************-->
    <div id="horizontal">
		<p class="titulo">Datos de firma </p>
		<xsl:choose>
			<xsl:when test='ds:Signature!=&quot;&quot;'>
				<xsl:apply-templates select="ds:Signature"/>
			</xsl:when>
			<xsl:otherwise>
				LA FACTURA NO ESTÁ FIRMADA
			</xsl:otherwise>
		</xsl:choose>

	</div>		
<!-- **********************************************CABECERA*********************************************************************************-->
    <div id="horizontal">
		<p class="titulo">Cabecera de la factura </p>
		<ul>
			<!-- DATOS DE IDENTIFICATIVOS -->
			<li><span class="nombre">Serie: </span><xsl:if test="Invoices/Invoice/InvoiceHeader/InvoiceSeriesCode!=&quot;&quot;"><xsl:value-of select="Invoices/Invoice/InvoiceHeader/InvoiceSeriesCode"/>			</xsl:if>
				<span class="nombre">  Número: </span> <xsl:value-of select="Invoices/Invoice/InvoiceHeader/InvoiceNumber"/>
<!--				<span class="nombre">  Versión Facturae: </span><xsl:value-of select="FileHeader/SchemaVersion"/>-->
				<span class="nombre">  Fecha de expedición: </span><xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/IssueDate,9,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/IssueDate,6,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/IssueDate,1,4)"/>
				<xsl:if test="Invoices/Invoice/InvoiceIssueData/PlaceOfIssue!=&quot;&quot;"> 
				<span class="nombre">  Lugar de expedición:</span><xsl:value-of select="Invoices/Invoice/InvoiceIssueData/PlaceOfIssue/PostCode"/>-<xsl:value-of select="InvoiceIssueData/PlaceOfIssue/PlaceOfIssueDescription" disable-output-escaping="yes"/>
				</xsl:if>  
				<span class="nombre">  Fecha de operación: </span><xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/OperationDate,9,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/OperationDate,6,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/OperationDate,1,4)"/>
				<span class="nombre">  Moneda de la operación: </span> <xsl:value-of select="Invoices/Invoice/InvoiceIssueData/InvoiceCurrencyCode"/>
			</li> 
			<xsl:if test="Invoices/Invoice/InvoiceIssueData/InvoicingPeriod!=&quot;&quot;">
			<li><span class="nombre">Período de facturación: </span>
			<xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/InvoicingPeriod/StartDate,9,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/InvoicingPeriod/StartDate,6,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/InvoicingPeriod/StartDate,1,4)"/> - 
			<xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/InvoicingPeriod/EndDate,9,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/InvoicingPeriod/EndDate,6,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/InvoicingPeriod/EndDate,1,4)"/>
			</li></xsl:if>
			<xsl:if test="Invoices/Invoice/InvoiceIssueData/InvoiceCurrencyCode!=&quot;EUR&quot;">
			<li><span class="nombre">Detalles tipo de cambio:</span>
				<ul>
					<li><span class="nombre">Tipo de cambio:</span> <xsl:value-of select="Invoices/Invoice/InvoiceIssueData/ExchangeRateDetails/ExchangeRate"/></li>
					<li><span class="nombre">Fecha publicación tipo de cambio:</span> <xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/ExchangeRateDetails/ExchangeRateDate,9,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/ExchangeRateDetails/ExchangeRateDate,6,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceIssueData/ExchangeRateDetails/ExchangeRateDate,1,4)"/></li>
					<li><span class="nombre">Moneda del impuesto:</span> <xsl:value-of select="Invoices/Invoice/nvoiceIssueData/TaxCurrencyCode"/></li>
					<li><span class="nombre">Lengua:</span> <xsl:value-of select="Invoices/Invoice/nvoiceIssueData/LanguageName"/></li>
				</ul>
			</li>
			</xsl:if>
			<li>
			<span class="nombre">  Tipo:</span> <xsl:choose>
			<xsl:when test="Invoices/Invoice/InvoiceHeader/InvoiceDocumentType=&quot;FC&quot;">COMPLETA</xsl:when>
			<xsl:when test="Invoices/Invoice/InvoiceHeader/InvoiceDocumentType=&quot;FA&quot;">ABREVIADA</xsl:when>
			<xsl:when test="Invoices/Invoice/InvoiceHeader/InvoiceDocumentType=&quot;AF&quot;">AUTOFACTURA</xsl:when>                                      
			<xsl:otherwise><xsl:value-of select="Invoices/Invoice/InvoiceHeader/InvoiceDocumentType"/></xsl:otherwise> </xsl:choose>
			<span class="nombre">  Clase: </span> 
			<xsl:choose>
			<xsl:when test="Invoices/Invoice/InvoiceHeader/InvoiceClass=&quot;OO&quot;">ORIGINAL</xsl:when>
			<xsl:when test="Invoices/Invoice/InvoiceHeader/InvoiceClass=&quot;OR&quot;">RECTIFICATIVA
				<span class="nombre">  Factura que rectifica: </span>

	            <xsl:if test="Invoices/Invoice/InvoiceHeader/Corrective/InvoiceSeriesCode!=&quot;&quot;">
				 <span class="nombre">  Serie:</span> <xsl:value-of select="Invoices/Invoice/InvoiceHeader/Corrective/InvoiceSeriesCode"/>  
				</xsl:if>
				<span class="nombre">  Número:</span> <xsl:value-of select="Invoices/Invoice/InvoiceHeader/Corrective/InvoiceNumber"/>

				<span class="nombre">  Motivo: </span> <xsl:value-of select="Invoices/Invoice/InvoiceHeader/Corrective/ReasonCode"/> - <xsl:value-of select="Invoices/Invoice/InvoiceHeader/Corrective/ReasonDescription" disable-output-escaping="yes"/>
				<span class="nombre">  Criterio: </span> <xsl:value-of select="Invoices/Invoice/InvoiceHeader/Corrective/CorrectionMethod"/> - <xsl:value-of select="Invoices/Invoice/InvoiceHeader/Corrective/CorrectionMethodDescription" disable-output-escaping="yes"/>
				
				<li><span class="nombre">Período impositivo desde:</span>
				<xsl:value-of select="substring(Invoices/Invoice/InvoiceHeader/Corrective/TaxPeriod/StartDate,9,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceHeader/Corrective/TaxPeriod/StartDate,6,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceHeader/Corrective/TaxPeriod/StartDate,1,4)"/>
				<span class="nombre"> hasta </span><xsl:value-of select="substring(Invoices/Invoice/InvoiceHeader/Corrective/TaxPeriod/EndDate,9,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceHeader/Corrective/TaxPeriod/EndDate,6,2)"/>-<xsl:value-of select="substring(Invoices/Invoice/InvoiceHeader/Corrective/TaxPeriod/EndDate,1,4)"/></li>
					
				

			</xsl:when>
			<xsl:when test="Invoices/Invoice/InvoiceHeader/InvoiceClass=&quot;CO&quot;">COPIA</xsl:when>
			<xsl:when test="Invoices/Invoice/InvoiceHeader/InvoiceClass=&quot;CR&quot;">COPIA RECTIFICATIVA</xsl:when>
			<xsl:when test="Invoices/Invoice/InvoiceHeader/InvoiceClass=&quot;CC&quot;">COPIA RECAPITULACION</xsl:when>
			<xsl:otherwise><xsl:value-of select="Invoices/Invoice/InvoiceHeader/InvoiceClass"/></xsl:otherwise> </xsl:choose></li>	
		</ul>
    </div>		
    <div id="actores">
<!-- ***********************************************EMISOR*********************************************************************************-->
    <div id="izq">
		<p class="titulo">Datos emisor </p>
		<ul>
			<!-- ACTOR -->
			<xsl:call-template name='actor'>
			<xsl:with-param name='var1' select='Parties/SellerParty'/> 
			</xsl:call-template>
		</ul>
	</div>
<!-- ***********************************************RECEPTOR*********************************************************************************-->
    <div id="central">
		<p class="titulo">Datos receptor </p>
		<ul>
			<!-- ACTOR -->
			<xsl:call-template name='actor'>
			<xsl:with-param name='var1' select='Parties/BuyerParty'/> 
			</xsl:call-template>
		</ul>
	</div>
<!-- ***********************************************TERCERO*********************************************************************************-->
    <div id="central">
		<p class="titulo">Datos tercero </p>
		<ul>
			<!-- ACTOR -->
			<xsl:call-template name='actor'>
			<xsl:with-param name='var1' select='FileHeader/ThirdParty'/> 
			</xsl:call-template>
		</ul>
	</div>
<!-- ***********************************************DATOS DE PAGO*********************************************************************************-->
<xsl:if test="Invoices/Invoice/PaymentDetails!=&quot;&quot;">
    <div id="dcha">
		<p class="titulo">Datos de pago </p>
		<ul>
			<xsl:for-each select="Invoices/Invoice/PaymentDetails/Installment">
				<li><span class="nombre">Fecha de vencimiento:</span><xsl:value-of select="substring(InstallmentDueDate,9,2)"/>-<xsl:value-of select="substring(InstallmentDueDate,6,2)"/>-<xsl:value-of select="substring(InstallmentDueDate,1,4)"/></li>
				<li><span class="nombre">Importe:</span> <xsl:value-of select="format-number(InstallmentAmount,'#.##0,00')"/></li>
				<li><span class="nombre">Forma de pago:</span><xsl:value-of select="PaymentMeans"/></li>
				<li><span class="nombre">Cuenta de abono:</span>
					<ul>
						<li><span class="nombre">IBAN:</span> <xsl:value-of  select="AccountToBeCredited/IBAN"/></li>
						<li><span class="nombre">Número de cuenta:</span><xsl:value-of  select="AccountToBeCredited/BankCode"/>-<xsl:value-of  select="AccountToBeCredited/BranchCode"/> </li>
						<!-- DIRECCIONES -->
						<xsl:call-template name='direcciones'>
						<xsl:with-param name='param1' select='AccountToBeCredited/BranchInSpainAddress'/> 
						<xsl:with-param name='param2' select='AccountToBeCredited/OverseasBranchAddress'/> 
						</xsl:call-template>
					</ul>
				</li>
				
			</xsl:for-each>

		</ul>
    </div>		
</xsl:if>
  </div>
<!-- ***********************************************DATOS DE CESIÓN FACTORING*********************************************************************************-->
<xsl:if test="FileHeader/FactoringAssignmentData!=&quot;&quot;">
    <div id="dcha">
		<p class="titulo">Datos cesión factoring </p>
		<ul>
			<!-- ACTOR -->
			<xsl:call-template name='actor'>
			<xsl:with-param name='var1' select='FileHeader/FactoringAssignmentData/Assignee'/> 
			</xsl:call-template>
		</ul>
	</div>		
</xsl:if>
<!-- ***********************************************LITERALES LEGALES*********************************************************************************-->
<xsl:if test="Invoices/Invoice/LegalLiterals!=&quot;&quot;">
    <div id="izq">
		<p class="titulo">Literales legales </p>
		<ul>
			<xsl:for-each select="Invoices/Invoice/LegalLiterals/LegalReference">
				<li><span class="nombre">Mención:</span><xsl:value-of select="."/></li>
			</xsl:for-each>
		</ul>
    </div>		
</xsl:if>
<!-- ***********************************************DATOS ADICIONALES*********************************************************************************-->
<xsl:if test="Invoices/Invoice/AdditionalData!=&quot;&quot;">
    <div id="central">
		<p class="titulo">Datos adicionales </p>
		<ul>
			<xsl:if test="Invoices/Invoice/AdditionalData/RelayedInvoice!=&quot;&quot;">
				<li><span class="nombre">Factura asociada:</span><xsl:value-of select="Invoices/Invoice/AdditionalData/RelayedInvoice"/></li>
			</xsl:if>
			<xsl:if test="Invoices/Invoice/AdditionalData/InvoiceAdditionalInformation!=&quot;&quot;">
				<li><span class="nombre">Factura asociada:</span><xsl:value-of select="Invoices/Invoice/AdditionalData/InvoiceAdditionalInformation"/></li>
			</xsl:if>
			<xsl:for-each select="Invoices/Invoice/AdditionalData/RelatedDocuments/Attachment">
				<xsl:if test="AttachmentCompressionAlgorithm!=&quot;&quot;">
					<li><span class="nombre">Algoritmo de compresión:</span><xsl:apply-templates select="AttachmentCompressionAlgorithm"/></li>
				</xsl:if>
				<xsl:if test="AttachmentFormat!=&quot;&quot;">
					<li><span class="nombre">Formato:</span><xsl:apply-templates select="AttachmentFormat"/></li>
				</xsl:if>
				<xsl:if test="AttachmentEncoding!=&quot;&quot;">
					<li><span class="nombre">Algoritmo de codificación:</span><xsl:apply-templates select="AttachmentEncoding"/></li>
				</xsl:if>
				<xsl:if test="AttachmentDescription!=&quot;&quot;">
					<li><span class="nombre">Descripción:</span><xsl:apply-templates select="AttachmentDescription"/></li>
				</xsl:if>
				<xsl:if test="AttachmentData!=&quot;&quot;">
					<li><span class="nombre">Datos:</span><xsl:apply-templates select="AttachmentData"/></li>
				</xsl:if>
			</xsl:for-each>			
		</ul>
    </div>		
</xsl:if>
<!-- ***********************************************LINEAS DE DETALLE*********************************************************************************-->
  <div id="detalles_factura">
 
	<table summary="Factura">
		<caption>Líneas de factura</caption>
			<tr>
				<th scope="col">Descripción del bien o servicio</th>
				<xsl:if test="Invoices/Invoice/Items/InvoiceLine/TransactionDate!=&quot;&quot;">		
					<th scope="col">Fecha de prestación/entrega </th>
				</xsl:if>
				<xsl:if test="Invoices/Invoice/Items/InvoiceLine/DiscountsAndRebates!=&quot;&quot;">		
					<th scope="col">Descuentos</th>
				</xsl:if>
				<xsl:if test="Invoices/Invoice/Items/InvoiceLine/Charges!=&quot;&quot;">		
					<th scope="col">Cargos</th>
				</xsl:if>
				<xsl:if test="(Invoices/Invoice/Items/InvoiceLine/TaxesOutputs!=&quot;&quot;) or (Invoices/Invoice/Items/InvoiceLine/TaxesWithheld!=&quot;&quot;)">
					<th scope="col">Impuestos</th>
				</xsl:if>
				<xsl:if test="Invoices/Invoice/Items/InvoiceLine/AdditionalLineItemInformation!=&quot;&quot;">		
					<th scope="col">Observaciones </th>
				</xsl:if>
				<xsl:if test="(Invoices/Invoice/Items/InvoiceLine/DiscountsAndRebates!=&quot;&quot;) or (Invoices/Invoice/Items/InvoiceLine/Charges!=&quot;&quot;)">		
					<th scope="col">Importe bruto</th>
				</xsl:if>
				<th scope="col">Cantidad</th>
				<th scope="col">Precio unitario sin impuestos </th>
				<th scope="col">Coste total</th>
			</tr>
			<xsl:for-each select="Invoices/Invoice/Items/InvoiceLine">
			<tr> 
				<td> <ul>
					<xsl:value-of select="ItemDescription" disable-output-escaping="yes"/>
					<xsl:if test="FileHeader/SchemaVersion=&quot;3.1&quot;">	
						<xsl:if test="PurchaseOrderReference!=&quot;&quot;">
							<li><span class="nombre">Orden de pedido:</span> <xsl:value-of select="PurchaseOrderReference"/></li>
						</xsl:if>
					</xsl:if>
					<xsl:if test="IssuerContractReference!=&quot;&quot;">
						<li><span class="nombre">Referencia del contrato del Emisor:</span> <xsl:value-of select="IssuerContractReference"/></li>
					</xsl:if>
					<xsl:if test="IssuerTransactionReference!=&quot;&quot;">
						<li><span class="nombre">Referencia de la Operación(Pedido,Contrato,etc.) del Emisor:</span> <xsl:value-of select="IssuerTransactionReference"/></li>
					</xsl:if>
					<xsl:if test="ReceiverContractReference!=&quot;&quot;">
						<li><span class="nombre">Referencia del contrato del Receptor:</span> <xsl:value-of select="ReceiverContractReference"/></li>
					</xsl:if>
					<xsl:if test="ReceiverTransactionReference!=&quot;&quot;">
						<li><span class="nombre">Referencia de la Operación(Pedido,Contrato,etc.) del Receptor:</span><xsl:value-of select="ReceiverTransactionReference"/></li>
					</xsl:if>
					<xsl:if test="LineItemPeriod!=&quot;&quot;">
						<li><span class="nombre">Periodo de prestación del servicio:</span>
							<xsl:value-of select="substring(LineItemPeriod/StartDate,9,2)"/>-<xsl:value-of select="substring(LineItemPeriod/StartDate,6,2)"/>-<xsl:value-of select="substring(LineItemPeriod/StartDate,1,4)"/> - 
							<xsl:value-of select="substring(LineItemPeriod/EndDate,9,2)"/>-<xsl:value-of select="substring(LineItemPeriod/EndDate,6,2)"/>-<xsl:value-of select="substring(LineItemPeriod/EndDate,1,4)"/></li>
					</xsl:if>
					<xsl:if test="DeliveryNotesReferences!=&quot;&quot;">
						<li><span class="nombre">Albaranes:</span></li>
						<xsl:for-each select="DeliveryNotesReferences/DeliveryNote">
							Número:<xsl:value-of select="DeliveryNoteNumber"/>
						</xsl:for-each>
					</xsl:if>
				</ul> </td>
				<xsl:if test="TransactionDate!=&quot;&quot;">
					<td>
						<xsl:value-of select="substring(TransactionDate,9,2)"/>-<xsl:value-of select="substring(TransactionDate,6,2)"/>-<xsl:value-of select="substring(TransactionDate,1,4)"/>
					</td>
				</xsl:if>
				<xsl:if test="DiscountsAndRebates!=&quot;&quot;">	
					<td>
                    <xsl:for-each select="DiscountsAndRebates/Discount">
						<xsl:value-of select="DiscountReason"/>:
						<xsl:if test="DiscountsAndRebates/Discount/DiscountRate!=&quot;&quot;">	
							<xsl:value-of select="format-number(DiscountRate,'#.##0,0000')"/> %:
						</xsl:if>
						<xsl:value-of select="format-number(DiscountAmount,'#.##0,00')"/>
                      </xsl:for-each>
					</td>
				</xsl:if>
				<xsl:if test="Charges!=&quot;&quot;">	
					<td>
                    <xsl:for-each select="Charges/Charge">
						<xsl:value-of select="ChargeReason"/>:
						<xsl:if test="Charges/Charge/ChargeRate!=&quot;&quot;">	
							<xsl:value-of select="format-number(ChargeRate,'#.##0,0000')"/> %:
						</xsl:if>
						<xsl:value-of select="format-number(ChargeAmount,'#.##0,00')"/>
                      </xsl:for-each>
					</td>
				</xsl:if>
				<xsl:if test="(TaxesOutputs!=&quot;&quot;) or (TaxesWithheld!=&quot;&quot;)">
				<td><ul>
				<!-- IMPUESTOS -->
				<xsl:if test="TaxesOutputs!=&quot;&quot;">
					<li><span class="nombre">Impuestos repercutidos:</span> </li>
					<xsl:call-template name='impuestos'>
					<xsl:with-param name='param1' select='./TaxesOutputs'/> 
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="TaxesWithheld!=&quot;&quot;">
					<li><span class="nombre">Impuestos retenidos:</span> </li>
					<xsl:call-template name='impuestos'>
					<xsl:with-param name='param1' select='./TaxesWithheld'/> 
					</xsl:call-template>
				</xsl:if>
				</ul></td>
				</xsl:if>
				<xsl:if test="AdditionalLineItemInformation!=&quot;&quot;">
				<td>
					<xsl:apply-templates select="AdditionalLineItemInformation"/>
				</td>
				</xsl:if>
				<xsl:if test="(DiscountsAndRebates!=&quot;&quot;) or (Charges!=&quot;&quot;)">		
					<td>
						<xsl:value-of select="format-number(GrossAmount,'#.##0,00')"/>
					</td>
				</xsl:if>
				<td><xsl:value-of select="format-number(Quantity,'#.##0,00')"/></td>
				<td><xsl:value-of select="format-number(UnitPriceWithoutTax,'#.##0,00')"/></td>
				<td><xsl:value-of select="format-number(TotalCost,'#.##0,00')"/></td>
			</tr>
			</xsl:for-each>
		</table>
<!-- ***********************************************PIE*********************************************************************************-->
 <div id="bloque_der">
 <table summary="Factura">
 <caption> Importes </caption>
  <tr><th scope="row">Importe bruto:</th><td> <xsl:value-of select="format-number(Invoices/Invoice/InvoiceTotals/TotalGrossAmount,'#.##0,00')"/></td></tr>
	<xsl:if test="Invoices/Invoice/InvoiceTotals/GeneralDiscounts!=&quot;&quot;">
		<tr><th scope="row">Descuentos:</th><td>
			<xsl:for-each select="Invoices/Invoice/InvoiceTotals/GeneralDiscounts/Discount">
				<!-- IMPORTES -->
				<xsl:call-template name='importes'>
				<xsl:with-param name='param1' select='Invoices/Invoice/Discount'/> 
				</xsl:call-template>
			</xsl:for-each>
			Total Descuentos:<xsl:value-of select="format-number(Invoices/Invoice/InvoiceTotals/TotalGeneralDiscounts,'#.##0,00')"/>
		</td></tr>
	</xsl:if>
	<xsl:if test="Invoices/Invoice/InvoiceTotals/GeneralSurcharges!=&quot;&quot;">
		<tr><th scope="row">Cargos:</th><td>
			<xsl:for-each select="Invoices/Invoice/InvoiceTotals/GeneralSurcharges/Discount">
				<!-- IMPORTES -->
				<xsl:call-template name='importes'>
				<xsl:with-param name='param1' select='Invoices/Invoice/Charge'/> 
				</xsl:call-template>
			</xsl:for-each>
			Total Cargos:<xsl:value-of select="format-number(Invoices/Invoice/InvoiceTotals/TotalGeneralSurcharges,'#.##0,00')"/>
		</td></tr>
	</xsl:if>
    <tr><th scope="row">Total importe bruto antes de impuestos:</th><td><xsl:value-of select="format-number(Invoices/Invoice/InvoiceTotals/TotalGrossAmountBeforeTaxes,'#.##0,00')"/></td></tr>
	<xsl:if test="Invoices/Invoice/TaxesOutputs!=&quot;&quot;">
		<tr><th scope="row">Impuestos repercutidos:</th><td>
			<xsl:call-template name='impuestos'>
			<xsl:with-param name='param1' select='Invoices/Invoice/TaxesOutputs'/> 
			</xsl:call-template>
			<p>Total repercutidos:<xsl:value-of select="format-number(Invoices/Invoice/InvoiceTotals/TotalTaxOutputs,'#.##0,00')"/></p>
		</td></tr>
	</xsl:if>
	<xsl:if test="Invoices/Invoice/TaxesWithheld!=&quot;&quot;">
		<tr><th scope="row">Impuestos retenidos:</th><td>
			<xsl:call-template name='impuestos'>
			<xsl:with-param name='param1' select='Invoices/Invoice/TaxesWithheld'/> 
			</xsl:call-template>
			Total Impuestos retenidos:<xsl:value-of select="format-number(Invoices/Invoice/InvoiceTotals/TotalTaxesWithheld,'#.##0,00')"/>
		</td></tr>
	</xsl:if>
	<xsl:if test="Invoices/Invoice/Subsidies!=&quot;&quot;">
		<tr><th scope="row">Subvenciones:</th><td>
			<xsl:for-each select="InvoiceTotals/Subsidies/Subsidy">
				Concepto:<xsl:apply-templates select="SubsidyDescription"/>
				<xsl:choose> <xsl:when test="TaxRate!=&quot;&quot;">
					Tipo:<xsl:value-of select="format-number(SubsidyRate,'#.##0,00')"/>
				</xsl:when> </xsl:choose>
				Importe:<xsl:value-of select="format-number(SubsidyAmount,'#.##0,00')"/>
			</xsl:for-each>
		</td></tr>
	</xsl:if>
	<xsl:if test="Invoices/Invoice/PaymentsOnAccount!=&quot;&quot;">
		<tr><th scope="row">Anticipos:</th><td>
			<xsl:for-each select="InvoiceTotals/PaymentsOnAccount/PaymentOnAccount">
				Fecha:<xsl:value-of select="substring(PaymentOnAccountDate,9,2)"/>-<xsl:value-of select="substring(PaymentOnAccountDate,6,2)"/>-<xsl:value-of select="substring(PaymentOnAccountDate,1,4)"/>
				Importe:<xsl:value-of select="format-number(PaymentOnAccountAmount,'#.##0,00')"/>
			</xsl:for-each>
			Total Anticipos:<xsl:value-of select="format-number(Invoices/Invoice/InvoiceTotals/TotalPaymentsOnAccount,'#.##0,00')"/>
		</td></tr>
	</xsl:if>
    <tr><th scope="row">Total a pagar:</th><td><xsl:value-of select="format-number(Invoices/Invoice/InvoiceTotals/TotalOutstandingAmount,'#.##0,00')"/></td></tr>
	<xsl:if test="Invoices/Invoice/AmountsWithheld!=&quot;&quot;">
		<tr><th scope="row">Retención garantía:</th><td>
				<!-- IMPORTES -->
				<xsl:call-template name='importes'>
				<xsl:with-param name='param1' select='Invoices/Invoice/InvoiceTotals/AmountsWithheld/Withholding'/> 
				</xsl:call-template>
		</td></tr>
	</xsl:if>
    <tr><th scope="row">Total a ejecutar:</th><td><xsl:value-of select="format-number(Invoices/Invoice/InvoiceTotals/TotalExecutableAmount,'#.##0,00')"/></td></tr>
    <tr><th scope="row">Total factura:</th><td><xsl:value-of select="format-number(Invoices/Invoice/InvoiceTotals/InvoiceTotal,'#.##0,00')"/></td></tr>
</table>
</div> <!-- pie de factura -->
</div> <!-- este es el fin del bloque derecho. El pie de factura se incluye dentro para que quede alineado) -->
</div> <!-- cuerpo -->


</div> <!-- todo -->
<!--<a rel="license" href="http://creativecommons.org/licenses/by-nc/3.0/es/"><img alt="Licencia de Creative Commons" style="border-width:0" src="http://i.creativecommons.org/l/by-nc/3.0/80x15.png" /></a>-->
<div id="pie"><span xmlns:dc="http://purl.org/dc/elements/1.1/" href="http://purl.org/dc/dcmitype/Text" property="dc:title" rel="dc:type">Visor Facturae</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="http://www.larioja.org" property="cc:attributionName" rel="cc:attributionURL">DGTIC</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/3.0/es/">Creative Commons Attribution-NonCommercial 3.0 Spain License</a>.</div>
</body>
</xsl:template>
<!-- ********************************************************************************************************************************-->
<!--                                                BLOQUES REUTILIZABLES                                                            -->
<!-- ********************************************************************************************************************************-->
<xsl:template name="datos-contacto">       
<xsl:param name='param1' /> 
	<xsl:if test='$param1 !=&quot;&quot;'>
		<li><span class="nombre">Datos de contacto:</span></li>				
		<ul>
			<xsl:if test="$param1/Telephone!=&quot;&quot;">
				<li><span class="nombre">Teléfono:</span> <xsl:value-of select="$param1/Telephone"/></li>
			</xsl:if>
			<xsl:if test="$param1/TeleFax!=&quot;&quot;">
				<li><span class="nombre">Fax:</span> <xsl:value-of select="$param1/TeleFax"/></li> 
			</xsl:if>
			<xsl:if test="$param1/WebAddress!=&quot;&quot;">
				<li><span class="nombre">Web:</span> <xsl:value-of select="$param1/WebAddress"/></li>
			</xsl:if>
			<xsl:if test="$param1/ElectronicMail!=&quot;&quot;">
				<li><span class="nombre">Correo-e:</span> <xsl:value-of select="$param1/ElectronicMail"/></li>
			</xsl:if>
			<xsl:if test="$param1/ContactPersons!=&quot;&quot;">
				<li><span class="nombre">Personas contacto:</span> <xsl:value-of select="$param1/ContactPersons"/></li>
			</xsl:if>
			<xsl:if test="$param1/CnoCnae!=&quot;&quot;">
				<li><span class="nombre">CnoCnae:</span> <xsl:value-of select="$param1/CnoCnae"/></li>
			</xsl:if>

			<xsl:if test="$param1/INETownCode!=&quot;&quot;">
				<li><span class="nombre">Código INE:</span> <xsl:value-of select="$param1/INETownCode"/></li>
			</xsl:if>

			<xsl:if test="$param1/AdditionalContactDetails!=&quot;&quot;">
				<li><span class="nombre">Otros:</span> <xsl:value-of select="$param1/AdditionalContactDetails" disable-output-escaping="yes"/></li>
			</xsl:if>
		</ul>
	</xsl:if>
</xsl:template>
<!-- ********************************************************************************************************************************-->
<xsl:template name="direcciones">       
<xsl:param name='param1' /> 
<xsl:param name='param2' /> 
			<xsl:if test="$param1!=&quot;&quot;">
			<li><span class="nombre">Dirección en España:</span></li>
			<ul>
				<li><span class="nombre2"><xsl:value-of select="$param1/Address" disable-output-escaping="yes"/></span></li>
				<li><span class="nombre2"><xsl:value-of select="$param1/PostCode"/> 
				-<xsl:value-of select="$param1/Town"/>
				(<xsl:value-of select="$param1/Province"/>)
				-<xsl:value-of select="$param1/CountryCode"/></span></li>
			</ul>
			</xsl:if>
			<xsl:if test="$param2/OverseasAddress!=&quot;&quot;">
			<li><span class="nombre">Dirección en el extranjero:</span></li>
			<ul>
				<li><span class="nombre2"><xsl:value-of select="$param2/Address" disable-output-escaping="yes"/></span></li>
				<li><span class="nombre2"><xsl:value-of select="$param2/PostCodeAndTown"/> 
				(<xsl:value-of select="$param2/Province"/>)
				-<xsl:value-of select="$param2/CountryCode"/></span></li>
			</ul>
			</xsl:if>
</xsl:template>
<!-- ********************************************************************************************************************************-->
<xsl:template name="identificacion">       
<xsl:param name='param1' /> 
			<xsl:if test="$param1/LegalEntity!=&quot;&quot;">
			<li><span class="nombre">Razón social:</span> <xsl:value-of select="$param1/LegalEntity/CorporateName" disable-output-escaping="yes"/></li>
			</xsl:if>
			<xsl:if test="$param1/LegalEntity/TradeName!=&quot;&quot;">
			<li><span class="nombre">Nombre comercial:</span> <xsl:value-of select="$param1/LegalEntityy/TradeName" disable-output-escaping="yes"/></li>
			</xsl:if>         
			<xsl:if test="$param1/Individual!=&quot;&quot;">
			<li><span class="nombre">Nombre:</span> <xsl:value-of select="$param1/Individual/Name" disable-output-escaping="yes"/></li>
			<li><span class="nombre">Primer  apellido:</span> <xsl:value-of select="$param1/Individual/FirstSurname" disable-output-escaping="yes"/></li>
			<li><span class="nombre">Segundo apellido:</span> <xsl:value-of select="$param1/Individual/SecondSurname" disable-output-escaping="yes"/></li>
			</xsl:if>
			<li><span class="nombre">Identificación fiscal:</span></li>
			<ul>
				<li><span class="nombre">Tipo de persona:</span> 
				<xsl:choose>
					<xsl:when test="$param1/TaxIdentification/PersonTypeCode=&quot;F&quot;">Física</xsl:when>
					<xsl:when test="$param1/TaxIdentification/PersonTypeCode=&quot;J&quot;">Jurídica</xsl:when>                                     
					<xsl:otherwise><xsl:value-of select="$param1/TaxIdentification/PersonTypeCode"/></xsl:otherwise>
				</xsl:choose>
				</li>
				<li><span class="nombre">Tipo de residencia:</span>
				<xsl:choose>
					<xsl:when test="$param1/TaxIdentification/ResidenceTypeCode=&quot;E&quot;">Extranjero</xsl:when>
					<xsl:when test="$param1/TaxIdentification/ResidenceTypeCode=&quot;R&quot;">Residente</xsl:when> 
					<xsl:when test="$param1/TaxIdentification/ResidenceTypeCode=&quot;U&quot;">Residente en la Unión Europea</xsl:when>                                   
					<xsl:otherwise><xsl:value-of select="$param1/TaxIdentification/ResidenceTypeCode"/></xsl:otherwise>
				</xsl:choose>
				</li>
				<li><span class="nombre">NIF/CIF:</span> <xsl:value-of select="$param1/TaxIdentification/TaxIdentificationNumber"/></li>
			</ul>
			<xsl:if test="$param1/PartyIdentification!=&quot;&quot;">
			<li><span class="nombre">Identificación:</span> <xsl:value-of select="$param1/PartyIdentification"/></li>
			</xsl:if>
</xsl:template>
<!-- ********************************************************************************************************************************-->
<xsl:template name="datos-registrales">
<xsl:param name='param1' /> 
	<xsl:if test="$param1/RegistrationData!=&quot;&quot;">				
	<li><span class="nombre">Datos registrales:</span></li>				
		<ul>
			<li><span class="nombre">Libro:</span> <xsl:value-of select="$param1/RegistrationData/Book"/></li>
			<li><span class="nombre">Registro Mercantil:</span> <xsl:value-of select="$param1/RegistrationData/RegisterOfCompaniesLocation"/></li> 
			<li><span class="nombre">Hoja:</span> <xsl:value-of select="$param1/RegistrationData/Sheet"/></li>
			<li><span class="nombre">Folio:</span> <xsl:value-of select="$param1/RegistrationData/Folio"/></li>
			<li><span class="nombre">Sección:</span> <xsl:value-of select="$param1/RegistrationData/Section"/></li>
			<li><span class="nombre">Tomo:</span><xsl:value-of select="$param1/RegistrationData/Volume"/></li>
			<li><span class="nombre">Otros:</span><xsl:value-of select="$param1/RegistrationData/AdditionalRegistrationData" disable-output-escaping="yes"/></li>
		</ul>
	</xsl:if>				
</xsl:template>
<!-- ********************************************************************************************************************************-->
<xsl:template name="centros">
<xsl:param name='param1' /> 
			<xsl:if test="$param1/AdministrativeCentres!=&quot;&quot;">
				<xsl:for-each select="$param1/AdministrativeCentres/AdministrativeCentre">
				<li><span class="nombre">Centro:</span></li>
				<ul>
					<xsl:if test="CentreCode!=&quot;&quot;">
						<li><span class="nombre">Nº departamento emisor:</span> <xsl:apply-templates select="CentreCode"/></li>
					</xsl:if>
					<xsl:if test="RoleTypeCode!=&quot;&quot;">
						<li><span class="nombre">Tipo de rol:</span> <xsl:apply-templates select="RoleTypeCode"/></li>
					</xsl:if>
					<xsl:if test="(Name!=&quot;&quot;) or (FirstSurname!=&quot;&quot;) or (SecondSurname!=&quot;&quot;)">
						<li><span class="nombre">Responsable del centro:</span>
						<xsl:value-of select="Name"/>
						<xsl:value-of select="FirstSurname"/>
						<xsl:value-of select="SecondSurname"/>
						</li>
					</xsl:if>
					<!-- DIRECCIONES -->
					<xsl:call-template name='direcciones'>
					<xsl:with-param name='param1' select='./AddressInSpain'/> 
					<xsl:with-param name='param2' select='./OverseasAddress'/> 
					</xsl:call-template>
					<!-- DATOS DE CONTACTO -->
					<xsl:call-template name='datos-contacto'>
					<xsl:with-param name='param1' select='./ContactDetails'/> 
					</xsl:call-template>
					<xsl:if test="PhysicalGLN!=&quot;&quot;">
						<li><span class="nombre">GLN Físico:</span> <xsl:apply-templates select="PhysicalGLN"/></li>
					</xsl:if>
					<xsl:if test="LogicalOperationalPoint!=&quot;&quot;">
						<li><span class="nombre">Punto lógico operacional:</span> <xsl:apply-templates select="LogicalOperationalPoint"/></li>
					</xsl:if>
					<xsl:if test="CentreDescription!=&quot;&quot;">
						<li><span class="nombre">Descripción del centro:</span> <xsl:apply-templates select="CentreDescription"/></li>
					</xsl:if>
				</ul>
				</xsl:for-each>
			</xsl:if>					
</xsl:template>
<!-- ********************************************************************************************************************************-->
<xsl:template name="impuestos">
<xsl:param name='param1' /> 
		<xsl:for-each select="$param1/Tax">
			Clase:<xsl:apply-templates select="TaxTypeCode"/>
			<xsl:if test="TaxRate!=&quot;&quot;">
				Tipo:<xsl:value-of select="format-number(TaxRate,'#.##0,00')"/>
			</xsl:if>
			<xsl:if test="TaxableBase!=&quot;&quot;">
				<p>Base imponible:<xsl:value-of select="format-number(TaxableBase/TotalAmount,'#.##0,00')"/></p>
			</xsl:if>
			<xsl:if test="//m:Facturae/FileHeader/Batch/InvoiceCurrencyCode!=&quot;EUR&quot;">
				<xsl:if test="TaxableBase/EquivalentInEuros!=&quot;&quot;">
					<p>Base en euros:<xsl:value-of select="format-number(TaxableBase/EquivalentInEuros,'#.##0,00')"/></p>
				</xsl:if>
			</xsl:if>
			<xsl:if test="TaxAmount!=&quot;&quot;">
				<p>Cuota:<xsl:value-of select="format-number(TaxAmount/TotalAmount,'#.##0,00')"/></p>
			</xsl:if>
			<xsl:if test="//m:Facturae/FileHeader/Batch/InvoiceCurrencyCode!=&quot;EUR&quot;">
				<xsl:if test="TaxAmount/EquivalentInEuros!=&quot;&quot;">
					Cuota en euros:<xsl:value-of select="format-number(TaxAmount/EquivalentInEuros,'#.##0,00')"/>
				</xsl:if>
			</xsl:if>
		</xsl:for-each>
</xsl:template>
<!-- ********************************************************************************************************************************-->
<xsl:template name="importes">
<xsl:param name='param1' /> 
				Concepto: <xsl:value-of select="concat($param1,'Reason')" disable-output-escaping="yes"/>
				<xsl:if test="concat($param1,'Rate')!=&quot;&quot;">
					Tipo: <xsl:value-of select="format-number(concat($param1,'Rate'),'#.##0,0000')"/>
				</xsl:if>
				Importe: <xsl:value-of select="format-number(concat($param1,'Amount'),'#.##0,00')"/>
</xsl:template>
<!-- ********************************************************************************************************************************-->
<xsl:template name="actor">
<xsl:param name='var1' /> 
		<!-- IDENTIFICACION -->
		<xsl:call-template name='identificacion'>
		<xsl:with-param name='param1' select='$var1'/> 
		</xsl:call-template>
		<!-- PERSONA JURÍDICA -->
		<!-- DIRECCIONES -->
		<xsl:call-template name='direcciones'>
		<xsl:with-param name='param1' select='$var1/LegalEntity/AddressInSpain'/> 
		<xsl:with-param name='param2' select='$var1/LegalEntity/OverseasAddress'/> 
		</xsl:call-template>
		<!-- DATOS REGISTRALES -->
		<xsl:call-template name='datos-registrales'>
		<xsl:with-param name='param1' select='$var1/LegalEntity'/> 
		</xsl:call-template>
		<!-- DATOS DE CONTACTO -->
		<xsl:call-template name='datos-contacto'>
		<xsl:with-param name='param1' select='$var1/LegalEntity/ContactDetails'/> 
		</xsl:call-template>
		<!-- PERSONA FÍSICA -->
		<!-- DIRECCIONES -->
		<xsl:call-template name='direcciones'>
		<xsl:with-param name='param1' select='$var1/Individual/AddressInSpain'/> 
		<xsl:with-param name='param2' select='$var1/Individual/OverseasAddress'/> 
		</xsl:call-template>
		<!-- DATOS DE CONTACTO -->
		<xsl:call-template name='datos-contacto'>
		<xsl:with-param name='param1' select='$var1/Individual/ContactDetails'/> 
		</xsl:call-template>
		<!-- CENTROS -->
		<xsl:call-template name='centros'>
		<xsl:with-param name='param1' select='$var1'/> 
		</xsl:call-template>
</xsl:template>
<!-- ***********************************************PLANTILLA DE FIRMA*********************************************************************************-->
<xsl:template match="ds:Signature">
<!-- Se utiliza un for-each..descendant porque algunas facturas usan el dominio xades y otras ninguno para determinadas etiquetas-->
    <div id="mitad-izq">
	<ul>
		<xsl:variable name="urlpolicy">
		<xsl:for-each select="descendant::*">
			<xsl:if test="local-name() = 'Identifier'">
				<xsl:value-of select='.' />
			</xsl:if>
		</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="urlpolicyname">
		<xsl:for-each select="descendant::*">
			<xsl:if test="local-name() = 'Description'">
				<xsl:value-of select='.' />
			</xsl:if>
		</xsl:for-each>
		</xsl:variable>
		<li>
		<span class="nombre">Formato de firma:</span>
		<xsl:choose>
		<xsl:when test="$urlpolicy!=&quot;&quot; and $urlpolicyname!=&quot;&quot;">
			XAdES-EPES
		</xsl:when>
		<xsl:otherwise>
			XAdES-BES
		</xsl:otherwise>
		</xsl:choose>
		</li>
		<li><span class="nombre">Fecha y hora de la firma:</span>
			<xsl:for-each select="descendant::*">
				<xsl:if test="local-name() = 'SigningTime'">
					<xsl:value-of select="substring(.,9,2)"/>-<xsl:value-of select="substring(.,6,2)"/>-<xsl:value-of select="substring(.,1,4)"/> a las 
					<xsl:value-of select="substring(.,12,2)"/> horas <xsl:value-of select="substring(.,15,2)"/> min. <xsl:value-of select="substring(.,18,2)"/> seg.
				</xsl:if>
			</xsl:for-each>
		</li>
		<li><span class="nombre">Entidad certificadora:</span>
			<ul>
				<xsl:for-each select="descendant::*">
					<xsl:if test="local-name() = 'X509IssuerName'">
						<li><span class="nombre">CIF:</span>
						<xsl:value-of select="substring-before(substring-after(.,'- CIF'),',')"/></li>
						<li><span class="nombre">Nombre:</span>
						<xsl:value-of select="substring-before(substring-after(.,'CN='),',')" disable-output-escaping="yes"/></li>
						<li><span class="nombre">Descripción:</span>
						<xsl:value-of select="substring-before(substring-after(.,'O='),',')" disable-output-escaping="yes"/></li>
						<li><span class="nombre">Dirección:</span>
						<xsl:value-of select="substring-before(substring-after(.,',L='),',')" disable-output-escaping="yes"/> 
						(<xsl:value-of select="substring-before(substring-after(.,',ST='),',')" disable-output-escaping="yes"/> )
						</li>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</li>
		<xsl:if test="$urlpolicy!=&quot;&quot; and $urlpolicyname!=&quot;&quot;">
			<li><span class="nombre">Política de firma: </span>
			<a href="{$urlpolicy}"><xsl:value-of select='$urlpolicyname'/></a>
			</li>
		</xsl:if>
	</ul>
	</div>
	<div id="mitad-dcha">
		<div id="firma_digital"><p>Firma digital:</p><div class="cuadro_firma"><xsl:value-of select="ds:SignatureValue"/></div></div>
	</div>
</xsl:template>
</xsl:stylesheet>


