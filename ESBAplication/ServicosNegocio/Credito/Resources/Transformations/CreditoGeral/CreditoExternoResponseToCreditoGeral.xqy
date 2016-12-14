xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://pucminas.br/sn/creditoservice/cleberigor";
(:: import schema at "../../../../../EBS/Credito/xsd/ParametrosCredito.xsd" ::)

declare namespace cle = "http://pucminas.br/mc/soa/cleberigor";

declare variable $param as element() (:: schema-element(ns1:resultadoVerificaCreditoExterno) ::) external;

declare function local:func($param as element() (:: schema-element(ns1:resultadoVerificaCreditoExterno) ::)) as element() (:: schema-element(ns1:resultadoVerificaCreditoGeral) ::) {
    <ns1:resultadoVerificaCreditoGeral>
        <ns1:credito>
            <cle:pessoa>
                <cle:id>{fn:data($param/ns1:credito/cle:pessoa/cle:id)}</cle:id>
                <cle:nome>{fn:data($param/ns1:credito/cle:pessoa/cle:nome)}</cle:nome>
                <cle:dataNascimento>{fn:data($param/ns1:credito/cle:pessoa/cle:dataNascimento)}</cle:dataNascimento>
                <cle:cpf>{fn:data($param/ns1:credito/cle:pessoa/cle:cpf)}</cle:cpf>
                <cle:telefone>{fn:data($param/ns1:credito/cle:pessoa/cle:telefone)}</cle:telefone>
            </cle:pessoa>
            <cle:indicaCreditoExterno>{fn:false()}</cle:indicaCreditoExterno>
            <cle:indicaCreditoInterno>{fn:false()}</cle:indicaCreditoInterno>
            <cle:indicaWhiteList>{fn:false()}</cle:indicaWhiteList>
            <cle:situacao>{fn:data($param/ns1:credito/cle:situacao)}</cle:situacao>
            <cle:score>{fn:data($param/ns1:credito/cle:score)}</cle:score>
        </ns1:credito>
    </ns1:resultadoVerificaCreditoGeral>
};

local:func($param)
