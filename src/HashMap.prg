* ================================================================================== *
* Dictionary Class (internal data structure)
* ================================================================================== *
define class Dictionary as collection
	function ContainsKey(tcKey)
		local lnIndex
		if empty(tcKey)
			return .f.
		endif
		return this.getkey(tcKey) > 0
	endfunc

	function put(tcKey, tvValue)
		if this.ContainsKey(tcKey)
			this.remove(this.getkey(tcKey))
		endif
		this.add(tvValue, tcKey)
	endfunc

	function get(tvIndexOrKey) as object
		do case
		case type('tvIndexOrKey') == 'N'
			if !between(tvIndexOrKey, 1, this.count)
				return .null.
			endif
			return this.item(tvIndexOrKey)
		case type('tvIndexOrKey') == 'C'
			tvIndexOrKey = this.getkey(tvIndexOrKey)
			if tvIndexOrKey > 0
				return this.item(tvIndexOrKey)
			endif
		endcase
		return .null.
	endfunc

	function toString as string
		local loItem, lcOutput, i, llIsMap, lcKey, lcValue
		llIsMap = this.tag == 'Map'
		lcOutput = iif(llIsMap, '{', '[')
		i = 1
		for i = 1 to this.count
			if i > 1
				lcOutput = lcOutput + ', '
			endif
			lcKey = '"' + this.getkey(i) + '"'
			lcValue = stringify(this.item(i))
			lcOutput = lcOutput + lcKey + ':' + lcValue
		endfor
		lcOutput = lcOutput + iif(llIsMap, '}', ']')
		return lcOutput
	endfunc

enddefine
