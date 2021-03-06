xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://pucminas.br/sn/creditoservice/cleberigor";
(:: import schema at "../../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)
declare namespace ns2="http://whitelist.com.br/SN/WhiteList";
(:: import schema at "../../../../../Mock_Legacy/Interfaces/Schemas/InternalWhiteList.xsd" ::)

declare namespace cle = "http://pucminas.br/mc/soa/cleberigor";

declare variable $param as element() (:: schema-element(ns1:parametrosVerificaCreditoGeral) ::) external;

declare function local:func($param as element() (:: schema-element(ns1:parametrosVerificaCreditoGeral) ::)) as element() (:: schema-element(ns2:ParametrosWhiteList) ::) {
    <ns2:ParametrosWhiteList>
        <ns2:num_documento>{fn:data($param/ns1:pessoa/cle:cpf)}</ns2:num_documento>
        <ns2:dt_nascimento>{fn:data($param/ns1:pessoa/cle:dataNascimento)}</ns2:dt_nascimento>
    </ns2:ParametrosWhiteList>
};

local:func($param)
