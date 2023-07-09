
SerenClones <- read.table(file = here::here("data", "CETaccession_list_tagname.txt"),
                          sep = "\t", header = F)
GenClones <- read.table(file = here::here("output", "AllChrom_RefPanelAndGSprogeny_ReadyForGP_2022Aug03.fam"),
                        sep = " ", header = F) %>% select(V2)

SerenClonesIn <- SerenClones[SerenClones$V1 %in% GenClones$V2,]

write.table(SerenClonesIn, file = here::here("data", "CETaccession_list_tagname.txt"),
            sep = "\t", col.names = F, row.names = F, quote = F)

system(paste0("vcftools --gzvcf output/AllChrom_RefPanelAndGSprogeny_ReadyForGP_2022Aug03.vcf.gz --keep ",
              "data/CETaccession_list_tagname.txt --recode --stdout | bgzip -c -@ 20 > ",
              "output/AllChrom_RefPanelAndGSprogeny_ReadyForGP_2022Aug03Seren.vcf.gz"))
