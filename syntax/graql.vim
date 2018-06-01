" Vim syntax file
" Language:     Graql
" Maintainer:   Elliot Winkler <elliot.winkler@gmail.com>
" Filenames:    *.gql
" Last Change:  2018 May 20
" Sources:
" * https://github.com/graknlabs/grakn/blob/master/grakn-graql/src/main/antlr4/ai/grakn/graql/internal/antlr/Graql.g4
" * http://dev.grakn.ai/docs/api-references/ddl

if exists("b:current_syntax")
  finish
endif

syntax keyword graqlMatchProperty add-more-here contained
highlight def link graqlMatchProperty Keyword
syntax keyword graqlDatatype boolean double long string date true false contained
highlight def link graqlDatatype Keyword
syntax keyword graqlRuleAdverb when then contained
highlight def link graqlRuleAdverb Keyword

syntax region graqlComment start=/^#/ end=/$/
syntax region graqlStatement start=/\v(define|insert|match)(\s|\n)+/ end=/;(\s|\n)*(define|insert|match)/ms=s-1 contains=graqlQueryType,graqlDefineVariablePattern,graqlInsertVariablePattern
syntax region graqlDefineVariablePattern start=/\v[^[:space:]\n]+(\s|\n)+sub/ end=/;/ contains=graqlCommonProperty,graqlDefineProperty,graqlIdentifier,graqlVariable,graqlString,graqlSchemaConcept contained
syntax region graqlInsertVariablePattern start=/\v[^[:space:]\n]+(\s|\n)+(\([^()]+\)(\s|\n)+)?isa/ end=/;/ contains=graqlCommonProperty,graqlInsertProperty,graqlIdentifier,graqlVariable,graqlString contained
syntax region graqlString start=/"/ skip=/\\"/ end=/"/ contained

syntax match graqlIdentifier /\v[a-zA-Z_][a-zA-Z0-9_-]*/ contained
syntax match graqlVariable /\v\$[a-zA-Z0-9_-]+/ contained
syntax match graqlQueryType /\v<(define|insert|match)>/ contained
syntax match graqlCommonProperty /\v<(has)>/ contained
syntax match graqlDefineProperty /\v<(datatype|is-abstract|key|plays|relates|sub)>/ contained
syntax match graqlInsertProperty /\v<(isa)>/ contained
syntax match graqlSchemaConcept /\v(sub(\s|\n)+)\@<=[a-zA-Z_][a-zA-Z0-9_-]*/ contained

highlight def link graqlComment Comment
highlight def link graqlString String
highlight def link graqlIdentifier Identifier
highlight def link graqlVariable Identifier
highlight def link graqlQueryType Keyword
highlight def link graqlCommonProperty Keyword
highlight def link graqlDefineProperty Keyword
highlight def link graqlInsertProperty Keyword
highlight def link graqlSchemaConcept Type

let b:current_syntax = "graql"
