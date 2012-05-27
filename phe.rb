framework 'Quartz'

pdf = PDFDocument.alloc.initWithURL NSURL.fileURLWithPath('tpp.pdf')

for i in 0..pdf.pageCount - 1
  page = pdf.pageAtIndex(i)

  page.annotations.each do |a|
    if a.type == 'Highlight'
      highlight = a.quadrilateralPoints # need to convert to NSRect for selection
      # Grab the quadrilaterial points for the hightlight
      # Grab the text at those points
      # Possibly use page.selectionForRect or page.selectionForRange() for selecting the text
    end
  end
end