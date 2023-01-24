function getPDFText(src, out)

	doc = pdDocOpen(src)

	docinfo = pdDocGetInfo(doc) 
	open(out, "w") do io
	
		npage = pdDOCGetPageCount(doc)
	
		for i=1:npage
			page = pdDocGetPage(doc, i)
			pdPageExtractText(io, page)
        	end
	end
	pdDocClose(doc)
	return docinfo
end