# alorenzetti 20210413

# description ####
# this script will load libraries
# get and parse tables
# and knit the website

# loading libs ####
packs = c("knitr",
          "tidyverse",
          "DT")

library(pacman)

p_load(char = packs)

# downloading COG info for halo nrtx ####
cog = read_tsv(file = "https://alanlorenzetti.github.io/halo_nr_tx/data/cog.tsv")

# getting tables ####
table = list()
table[["s1"]] = read_tsv(file = "~/gdrive/lsm_analysis/results/interactionListNRTX.tsv")
table[["s2"]] = read_tsv(file = "~/gdrive/dlsm/dlsm_de_analysis_kallisto/results/DESeq2.tsv")
table[["s3"]] = read_tsv(file = "~/gdrive/dlsmPhenotype_imageAnalysis/countsPerPlate.tsv")
table[["s4"]] = bind_rows(read_tsv(file = "~/gdrive/nanopore-2nd/dfins.txt") %>% 
                            mutate(sv_type = "insertion"),
                          read_tsv(file = "~/gdrive/nanopore-2nd/dfdel.txt") %>% 
                            mutate(sv_type = "excision"))
table[["s5"]] = read_tsv(file = "~/gdrive/documentos/doutorado/isb/tlr_v2/results/hmaFuncat.tsv")

# parsing ####
# table s1
table[["s1"]] = table[["s1"]] %>% 
  left_join(x = .,
            y = cog,
            by = "representative") %>% 
  mutate(across(.cols = everything(),
                .fns = ~ case_when(is.na(.x) ~ "Undefined",
                                   TRUE ~ as.character(.x)))) %>% 
  select(locus_tag = representative,
         smap1_interaction = LSmInteraction,
         product = product,
         cog_category = cog_category)
  
# table s2
table[["s2"]] = table[["s2"]] %>% 
  left_join(x = .,
            y = cog %>% select(representative,
                               cog_category),
            by = c("locus_tag" = "representative")) %>% 
  mutate(across(.cols = where(is.character),
                .fns = ~ case_when(is.na(.x) ~ "Undefined",
                                   TRUE ~ as.character(.x)))) %>% 
  mutate(across(.cols = where(is.numeric),
                .fns = ~ round(.x, digits = 3))) %>% 
  select(-stat)

# table s3
table[["s3"]] = table[["s3"]] %>% 
  mutate(strain = case_when(strain == "dLSm" ~ "dura3dsmap1",
                            strain == "dUra3" ~ "dura3",
                            TRUE ~ as.character(strain)))

# table s4
table[["s4"]] = table[["s4"]] %>% 
  select(-rnames) %>% 
  mutate(across(.cols = where(is.character),
                .fns = ~ str_replace_all(string = .x,
                                         pattern = "\\*",
                                         replacement = ""))) %>% 
  mutate(across(.cols = where(is.character),
                .fns = ~ str_replace_all(string = .x,
                                         pattern = "&Delta;",
                                         replacement = "d")))

# table s5
table[["s5"]] = table[["s5"]] %>% 
  select(c(locus_tag,
           smap1_interaction = lsmSense,
           asRNA,
           hl = HL,
           cai,
           GCdev,
           starts_with("mean"))) %>% 
  mutate(across(.cols = where(is.numeric),
                .fns = ~ round(.x, digits = 3)))

# saving objects to data folder ####
# for(i in names(table)){
#   write_tsv(x = table[[i]],
#             file = paste0("data/table_", i, ".tsv"))
# }

# getting extended version of heatmap
if(!dir.exists("results")){dir.create("results")}
file.copy(from = "~/gdrive/documentos/doutorado/isb/tlr_v2/plots/tese/abundanceHeatmap_expanded.pdf",
          to = "~/gdrive/suplementar_tese/results/")

# loading and rendering using knitr ####
rmarkdown::render(input = "scripts/02_create_website.R",
                  output_dir = ".",
                  output_file = "index.html")

# securing page
system2(command = "staticrypt",
        args = c("./index.html",          # file to be encrypted
                 "''",                      # my pw here; see thesis doc
                 "-e",                    # embedded cryto.js in the page
                 "-o", "./index.html"))   # output file
