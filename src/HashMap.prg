&& ======================================================================== &&
&& Class HashMap
&& ======================================================================= &&
Define Class HashMap As Session
	Items = .Null.
&& ======================================================================== &&
&& Function Init
&& ======================================================================== &&
	Function Init
		Set Deleted on
		Set Exact on
		Set Near off
		This.Items = Createobject("Collection")
		Create Cursor qDataList (cKey c(100), nIndex i)
	Endfunc
&& ======================================================================== &&
&& Function Put
&& ======================================================================== &&
	Function Put(tcKey as string, tvData As variant)
		Local lnKeyIdx As Integer
		lnKeyIdx = This.GetIndex(tcKey)
		If Empty(lnKeyIdx)
			nCount = Iif(Empty(This.Items.Count), 1, This.Items.count + 1)
			Insert into qDataList (cKey, nIndex) values(tcKey, nCount)
		Else
			This.Items.Remove(lnKeyIdx)
		EndIf
		This.Items.add(tvData)
	EndFunc
&& ======================================================================== &&
&& Function Get
&& ======================================================================== &&
	Function Get(tcKey As String) as Variant
		Local lnIndex
		lnIndex = This.GetIndex(tcKey)
		Return Iif(lnIndex > 0, This.Items.Item(lnIndex), .Null.)
	EndFunc
&& ======================================================================== &&
&& Function Containskey
&& ======================================================================== &&
	Function Containskey(tcKey As String) As Boolean
		Return This.GetIndex(tcKey) > 0
	EndFunc
&& ======================================================================== &&
&& Hidden Function GetIndex
&& ======================================================================== &&
	Hidden Function GetIndex(tcKey As String) As Integer
		Dimension aIndex(1)
		aIndex(1) = 0
		Select nIndex from qDataList where Alltrim(cKey) == Alltrim(tcKey) into array aIndex
		lnDataIndex = aIndex[1]
		Return lnDataIndex
	EndFunc
&& ======================================================================== &&
&& Function Clear
&& ======================================================================== &&
	Function Clear
		This.Items = CreateObject("Collection")
	EndFunc
&& ======================================================================== &&
&& Function IsEmpty
&& ======================================================================== &&
	Function IsEmpty
		Return Empty(This.Items.Count)
	EndFunc
Enddefine
