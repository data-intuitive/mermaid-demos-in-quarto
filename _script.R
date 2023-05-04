# clone mermaid repo but remove on exit
temp_dir <- tempfile(pattern = "mermaid")
on.exit(unlink(temp_dir, recursive = TRUE), add = TRUE)
system(paste0("git clone git@github.com:mermaid-js/mermaid.git ", temp_dir))
# todo: check out tag v9.3.0

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
  lines <- readr::read_lines(file)

  new_lines <- gsub("```(mermaid-example|mmd|mermaid)", "```{mermaid}", lines)
  # remove titles in codeblocks
  new_lines <- gsub("```\\{mermaid\\}\n---\ntitle:[^-]*\n---", "```{mermaid}", paste(new_lines, collapse = "\n"))

  dest_file <- paste0("syntax/", gsub("\\.md", ".qmd", basename(file)))
  readr::write_lines(new_lines, dest_file)
}

# also render to gfm
for (qmd in list.files("syntax", pattern = "*.qmd$", full.names = TRUE)) {
  dest_file <- paste0(dirname(qmd), "/_", gsub("\\.qmd$", ".md", basename(qmd)))
  out <- system(paste0("quarto render ", qmd, " --to gfm --output -"), intern = TRUE, ignore.stderr = TRUE)
  readr::write_lines(out, dest_file)
}
