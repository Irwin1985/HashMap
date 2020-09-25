&& ======================================================================== &&
&& Class HashMap
&& ======================================================================= &&
Define Class HashMap As Custom
	Items = .Null.
&& ======================================================================== &&
&& Function Init
&& ======================================================================== &&
	Function Init
		This.Items = Createobject("Collection")
	Endfunc
&& ======================================================================== &&
&& Function Put
&& ======================================================================== &&
	Function Put(tcKey as string, tvData As variant)
		If !Empty(This.Items.GetKey(tcKey))
			This.Items.Remove(tckey)
		EndIf
		This.Items.Add(tvData, tcKey)
	EndFunc
&& ======================================================================== &&
&& Function Get
&& ======================================================================== &&
	Function Get(tcKey As String) as Variant
		Local lnIndex
		lnIndex = This.Items.Getkey(tcKey)
		Return Iif(Empty(lnIndex), .Null., This.Items.Item(lnIndex))
	EndFunc
&& ======================================================================== &&
&& Function Containskey
&& ======================================================================== &&
	Function Containskey(tcKey As String) As Boolean
		Return This.Items.Getkey(tcKey) > 0
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
