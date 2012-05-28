framework 'Quartz'

pdf = PDFDocument.alloc.initWithURL NSURL.fileURLWithPath('tpp.pdf')

for i in 0..pdf.pageCount - 1
  page = pdf.pageAtIndex(i)

  page.annotations.each do |a|
    if a.type == 'Highlight'  
      highlight= a.quadrilateralPoints
      
      for j in (0..highlight.count - 1).step(2)
        h_start = highlight.objectAtIndex(j).pointValue
        h_end = highlight.objectAtIndex(j+1).pointValue
        
        h_start.x += a.bounds.origin.x
        h_start.y += a.bounds.origin.y
        
        h_end.x += a.bounds.origin.x
        h_end.y += a.bounds.origin.y
        
        # all sorts of error prone but we're almost there -- getting dupes and overlap
        puts page.selectionForRange(NSRange.new(h_start.x, h_start.y), NSRange.new(h_end.x, h_end.y)).string
      end
    end
  end
end