xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://creditlegacy.com.br/SN/CreditLegacy";
(:: import schema at "../../../../../Mock_Legacy/Interfaces/Schemas/CreditLegacy.xsd" ::)
declare namespace ns1="http://pucminas.br/sn/creditoservice/cleberigor";
(:: import schema at "../../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace cle = "http://pucminas.br/mc/soa/cleberigor";

declare variable $param as element() (:: schema-element(ns1:parametrosVerificaCreditoGeral) ::) external;

declare function local:func($param as element() (:: schema-element(ns1:parametrosVerificaCreditoGeral) ::)) as element() (:: schema-element(ns2:ParametrosCreditLegacy) ::) {
    <ns2:ParametrosCreditLegacy>
        <ns2:cpf>{fn:data($param/ns1:pessoa/cle:cpf)}</ns2:cpf>
        <ns2:dt_solicitacao>{fn:current-dateTime()}</ns2:dt_solicitacao>
    </ns2:ParametrosCreditLegacy>
};

local:func($param)
