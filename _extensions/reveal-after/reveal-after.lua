-- reveal-after.lua
-- Author: Kristof Meers

function Meta(meta)
  -- this will only run for HTML documents
  if not quarto.doc.isFormat("html:js") then
    return pandoc.Null()
  end

  quarto.doc.add_html_dependency({
      name = "reveal-after",
      scripts = { "assets/reveal-after.js" },
      stylesheets = { "assets/reveal-after.css" }
  })

  local raMeta = meta.reveal_after

  local reveal_date = "2099-01-01"
  local reveal_after_override = "no"

  if raMeta ~= nil then
    if raMeta['reveal_date'] ~= nil then
      reveal_date = pandoc.utils.stringify(raMeta['reveal_date'])
    end
  end

  if os.getenv("REVEAL_AFTER_OVERRIDE") ~= nil then
    reveal_after_override = "yes"
  end

  local scriptTag = "<script>var reveal_after_date_string = '" .. reveal_date .. "'; var reveal_after_override = '" .. reveal_after_override .. "';</script>"

  quarto.doc.include_text("after-body", scriptTag)

  return meta
end