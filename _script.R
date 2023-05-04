# Load required libraries
library(rvest)
library(purrr)
library(glue)

# clone mermaid repo but remove on exit
temp_dir <- tempfile(pattern = "mermaid")
on.exit(unlink(temp_dir, recursive = TRUE), add = TRUE)
system(paste0("git clone git@github.com:mermaid-js/mermaid.git ", temp_dir))
# todo: check out tag v9.3.0

demo_files <- list.files(
  paste0(temp_dir, "/demos"),
  full.names = TRUE,
  recursive = TRUE,
  pattern = "\\.html$"
)

if (!dir.exists("demos")) dir.create("demos")

for (source_file in demo_files) {
  # Read HTML content
  html_content <- read_html(source_file)

  # Extract body content
  body_content <- html_content %>%
    html_node("body") %>%
    html_children()

  # Extract text from the body content and format it as markdown
  markdown_text <- body_content %>%
    map_chr(function(x) {
      tag_name <- xml2::xml_name(x)
      if (tag_name == "h1") {
        text <- gsub("\"", "\\\\\\\"", html_text(x))
        glue("---\ntitle: \"{text}\"\n---")
      } else if (tag_name == "pre") {
        glue("```{{mermaid}}\n{html_text(x)}\n```")
      } else if (tag_name == "hr") {
        "---"
      } else {
        ""
      }
    }) %>%
    paste(collapse = "\n\n")

  # Write markdown to file
  dest_file <- paste0("demos/", gsub("\\.html", ".qmd", basename(source_file)))
  readr::write_lines(markdown_text, dest_file)
}

# todo: copy md from syntax dir


syntax_files <- list.files(
  paste0(temp_dir, "/packages/mermaid/src/docs/syntax"),
  full.names = TRUE,
  recursive = TRUE,
  pattern = "\\.md$"
)

if (!dir.exists("syntax")) dir.create("syntax")


for (file in syntax_files) {
  lines <- readr::read_lines(file)

  # 
  new_lines <- gsub("```mermaid-example", "```{mermaid}", lines)
  # remove titles in codeblocks
  new_lines <- gsub("```\\{mermaid\\}\n---\ntitle:[^-]*\n---", "```{mermaid}", paste(new_lines, collapse = "\n"))

  dest_file <- paste0("syntax/", gsub("\\.md", ".qmd", basename(file)))
  readr::write_lines(new_lines, dest_file)
}
