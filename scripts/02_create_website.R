#' ---
#' title: "Material suplementar"
#' author: "Alan Lorenzetti"
#' date: 13 de abril de 2021
#' ---
#' 
#' 
#' Este é um _companion website_ para a tese de doutorado de Alan Lorenzetti. Seu objetivo é fornecer os resultados mais extensos por meio de tabelas interativas que podem ser baixadas pelo usuário.  
#' 
#' * Tabela S1: Lista de genes que interagem com a proteína SmAP1  
#' * Tabela S2: Resultados da análise de expressão diferencial  
#' * Tabela S3: Resultados da detecção de mutantes espontâneos em placa  
#' * Tabela S4: Resultados da detecção de de mobilizações por meio de DNA-Seq  
#' * Tabela S5: Compêndio com dados da dinâmica de transcritoma, perfilamento ribossomal e proteômica  
#' 
#'
#' ## Browsable tables {.tabset}
#' ### Tabela S1
#'
#' locus_tag: identificador do transcrito  
#' smap1_interaction: status de interação com proteína SmAP1  
#' product: produto do transcrito  
#' cog_category: categoria de acordo com o COG 2020  
#' 
#' 
#' <div style = "width:100%; height: auto; margin: auto;">
#+ echo=FALSE
datatable(table[["s1"]],
          rownames = F,
          extensions = "Buttons",
          options = list(scrollX = "800px",
                         buttons = c("copy", "csv", "excel"),
                         dom = "Blfrtip"))
#' </div>
#'
#' ### Tabela S2
#' 
#' locus_tag: identificador do transcrito  
#' baseMean: média de contagens normalizadas divido pelo fator de tamanho da amostra para todas as amostras  
#' log2FoldChange: magnitude da mudança  
#' lfcSE: estimativa do erro padrão para log2FoldChange  
#' pvalue: p-valor do test estatístico para o transcrito  
#' padj: p-valor ajustado de acordo com o método de Benjamini-Hochberg  
#' product: produto do transcrito  
#' cog_category: categoria de acordo com o COG 2020  
#' 
#' 
#' <div style = "width:100%; height: auto; margin: auto;">
#+ echo=FALSE
datatable(table[["s2"]],
          rownames = F,
          extensions = "Buttons",
          options = list(scrollX = "800px",
                         buttons = c("copy", "csv", "excel"),
                         dom = "Blfrtip"))
#' </div>
#'
#' ### Tabela S3
#' 
#' plateID: identificador da placa  
#' counts: colônias válidas na placa  
#' mutcounts: colônias mutantes na placa  
#' strain: linhagem  
#' replicate: réplica  
#' experiment: experimento de origem (primeiro ou segundo)  
#' 
#' 
#' <div style = "width:100%; height: auto; margin: auto;">
#+ echo=FALSE
datatable(table[["s3"]],
          rownames = F,
          extensions = "Buttons",
          options = list(scrollX = "800px",
                         buttons = c("copy", "csv", "excel"),
                         dom = "Blfrtip"))
#' </div>
#'
#' ### Tabela S4
#' 
#' strain: linhagem  
#' cluster: identificador do cluster  
#' replicon: replicon no qual o cluster foi detectado  
#' ISName: nome da sequência de inserção que causou a variação estrutural  
#' ISFamily: família da sequência de inserção que causou a variação estrutural  
#' meanStart: estimativa da posição inicial do cluster  
#' sdStart: desvio padrão da estimativa da posição inicial do cluster  
#' meanLength:  tamanho médio da variação estrutural  
#' sdLength:  desvio padrão do tamanhoda variação estrutural  
#' count:  quantidade de reads que suportam o cluster  
#' status:  status do cluster com relação ao número de reads que suportam o cluster vs. a cobertura do sequenciamento  
#' sv_type:  tipo de variação estrutural  
#' 
#' 
#' <div style = "width:100%; height: auto; margin: auto;">
#+ echo=FALSE
datatable(table[["s4"]],
          rownames = F,
          extensions = "Buttons",
          options = list(scrollX = "800px",
                         buttons = c("copy", "csv", "excel"),
                         dom = "Blfrtip"))
#' </div>
#'
#' ### Tabela S5
#' 
#' locus_tag: identificador do transcrito  
#' smap1_interaction: status de interação com proteína SmAP1  
#' asRNA: status de ocorrência de RNAs antissenso ao transcrito  
#' hl:  meia-vida do transcrito em minutos  
#' cai:  índice de adaptação dos códons
#' GCdev:  resíduo do conteúdo GC em relação ao conteúdo GC médio  
#' mean_abundance_protein_lysate_TP#: níveis de proteína para os tempos da curva de crescimento TP1, TP2, TP3 e TP4  
#' mean_abundance_rna_total_TP#: níveis de mRNA para os tempos da curva de crescimento TP1, TP2, TP3 e TP4  
#' mean_abundance_rna_ribofraction_TP#: níveis de ribosome protected fragments para os tempos da curva de crescimento TP1, TP2, TP3 e TP4  
#' 
#' 
#' <div style = "width:100%; height: auto; margin: auto;">
#+ echo=FALSE
datatable(table[["s5"]],
          rownames = F,
          extensions = "Buttons",
          options = list(scrollX = "800px",
                         buttons = c("copy", "csv", "excel"),
                         dom = "Blfrtip"))
#' </div>
#'