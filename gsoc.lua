function add_mp3_filename(meta)
    local mp3_map = {}
    
    function add_mp3_filename_to_paragraph(para)
      if para.content and para.content[1] and para.content[1].t == "Str" then
        local text = pandoc.utils.stringify(para.content)
        local filename = mp3_map[text]
        if filename then
          local audio_element = pandoc.RawInline("html", '<audio controls><source src="' .. filename .. '" type="audio/mpeg"></audio>')
          table.insert(para.content, audio_element)
        end
      end
      return para
    end
    
    function collect_mp3_filenames(element)
      if element.t == "Div" and element.classes:includes("mp3-filename") then
        for _, block in ipairs(element.content) do
          if block.t == "CodeBlock" then
            mp3_map[block.text] = block.attr.attributes[1]
          end
        end
      end
    end
    
    return {
      {Meta = collect_mp3_filenames},
      {Para = add_mp3_filename_to_paragraph}
    }
  end
  
  return {
    {Meta = add_mp3_filename}
  }
  