# clone mermaid repo but remove on exit
temp_dir <- tempfile(pattern = "mermaid")
on.exit(unlink(temp_dir, recursive = TRUE), add = TRUE)
processx::run("git", c("clone", "git@github.com:mermaid-js/mermaid.git", temp_dir))
processx::run("git", c("checkout", "v10.9.1"), wd = temp_dir)

# look for syntax files
syntax_files <- list.files(
  paste0(temp_dir, "/packages/mermaid/src/docs/syntax"),
  full.names = TRUE,
  recursive = TRUE,
  pattern = "\\.md$"
)

if (!dir.exists("syntax")) dir.create("syntax")

# convert to qmd file
for (file in syntax_files) {
  new_lines <- readr::read_lines(file) %>%
    paste(collapse = "\n") %>%
    # fix mermaid blocks
    gsub("```(mermaid-example|mmd|mermaid)", "```{mermaid}", .)
    # remove titles in codeblocks
    gsub("```\\{mermaid\\}\n---\ntitle:[^-]*\n---", "```{mermaid}", .) %>%
    # fix callout blocks, e.g. from ```warning\n...\n``` to `:::{.callout-warning}\n...\n:::`
    gsub("```(note|warning|tip|important|caution)\n(.*?)\n```", ":::{.callout-\\1}\n\\2\n:::", .)

  dest_file <- paste0("syntax/", gsub("\\.md", ".qmd", basename(file)))
  readr::write_lines(new_lines, dest_file)
}

# # also render to gfm
# for (qmd in list.files("syntax", pattern = "*.qmd$", full.names = TRUE)) {
#   dest_file <- paste0(dirname(qmd), "/_", gsub("\\.qmd$", ".md", basename(qmd)))
#   out <- system(paste0("quarto render ", qmd, " --to gfm --output -"), intern = TRUE, ignore.stderr = TRUE)
#   readr::write_lines(out, dest_file)
# }
