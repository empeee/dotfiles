/* 
This function manages visible layers in the LSW

Will load a file named "custom_layers.il" from the working directory
1st then from home directory
if neither exists, it will use a default setting.

*/

;/*Loading "custom_layers.il" from working directory or home directory and setting defaults if files do not exist*/
if( isFile(sprintf(custom_layers_file "%s/custom_layers.il" getWorkingDir())) then
  println( custom_layers_file)
  load(custom_layers_file)
else
  ;/*DEFAULT GROUPS*/
grp1=list( 
'("M1" "drawing")
'("CO" "drawing")
'("M1" "pin")
'("M1" "net")
'("M1" "text")
);end grp1

grp2=list(
'("M2" "drawing")
'("VIA1" "drawing")
'("M2" "pin")
'("M2" "net")
'("M2" "text")
);end grp2

grp3=list(
'("M3" "drawing")
'("VIA2" "drawing")
'("M3" "pin")
'("M3" "net")
'("M3" "text")
);end grp3

grp4=list(
'("M4" "drawing")
'("VIA3" "drawing")
'("M4" "pin")
'("M4" "net")
'("M4" "text")
);end grp4

grp5=list(
'("M5" "drawing")
'("VIA4" "drawing")
'("M5" "pin")
'("M5" "net")
'("M5" "text")
);end grp5

grp6=list(
'("M6" "drawing")
'("VIA5" "drawing")
'("M6" "pin")
'("M6" "net")
'("M6" "text")
);end grp6

grp7=list(
'("M7" "drawing")
'("VIA6" "drawing")
'("M7" "pin")
'("M7" "net")
'("M7" "text")
); end grp7

grp8=list(
'("AP" "drawing")
'("RV" "drawing")
'("AP" "pin")
'("AP" "text")
'("AP" "text")
); end grp8


grp9=list(
'("PO" "drawing")
'("PSUB2" "drawing")
'("PSUB2" "text") 
'("NW" "drawing")
'("NW" "net")
'("DNW" "drawing")
'("DNW" "net") 
'("DNW" "text")
'("NP" "drawing")
'("PP" "drawing")
'("CO" "drawing")
'("PO" "pin")
'("PO" "net")
'("PO" "text")
);end grp9

grpIGNORE=list(
'("prBoundary" "drawing")
'("instance" "drawing")
'("text" "drawing")
'("y0" "drawing") 
'("y1" "drawing")
'("y2" "drawing") 
'("y3" "drawing") 
'("y4" "drawing") 
'("y5" "drawing")
'("y6" "drawing") 
'("y7" "drawing")
'("y8" "drawing") 
'("y9" "drawing")
);end IGNORE

);/*end if*/

;/*LayerVis procedure*/
procedure(LayerVis(l_layers ;/*required arguments*/
@optional (p_toggle nil)
);/*end arguments*/

  prog( () 
  ;/*function modifies selected layer if toggled to not visible*/
    p_vis=t
    p_hide_others=t
    if( p_toggle then
      p_vis=!LayerVisGetState(l_layers)
      if( !p_vis && member( leGetEntryLayer() l_layers) then 
        leSetEntryLayer(FindNewEntryLayer(l_layers))
        );/*end if*/
      p_hide_others=nil
    );/*end if*/

    ;/*SPECIAL CASE - not in list of layers*/
    if( !listp(l_layers) then
      case( upperCase(l_layers)
        ("ALL"  
        SetLayersVisible(grpIGNORE t)
        hiRedraw()
        return()
        );/*end case ALL*/
        (t
        return(println("Unrecognized argument"))
        );/*end catchall*/
      );/*end case*/
    );/*end if*/
    ;/*END SPECIAL CASE*/

    if(p_vis then 
      leSetEntryLayer(car(l_layers))
    );/*end if*/
    if(p_hide_others then 
      SetLayersVisible(grpIGNORE nil)
    );/*end if*/
    foreach(layer l_layers
      leSetLayerVisible( layer p_vis )
    );/*end foreach*/
    hiRedraw()
    return(t)
  );/*end prog*/
);/*end procedure LayerVis*/

;/*LayerVisGetState procedure*/
procedure(LayerVisGetState(l_layers)
  prog( () 
  ;/*function returns t if all layers in the list are visible, nil otherwise*/
    foreach( layer l_layers
      if( !leIsLayerVisible(layer) then 
        return(nil)
      );/*end if*/
    );/*end foreach*/
    return(t)
  );/*end prog*/
);/*end procedure LayerVisGetState*/

;/*SetLayersVisible procedure*/
procedure(SetLayersVisible(l_ignore p_visible)
  prog( ()
    techfile_dbId=techGetTechFile(geGetEditCellView()) ;/*changed from techfile_dbId=FindTechFile()*/
    foreach( layer leGetValidLayerList(techfile_dbId)
      if( !member(layer cons(leGetEntryLayer(techfile_dbId) l_ignore)) then 
        leSetLayerVisible( layer p_visible )
      );/*end if*/
    );/*end foreach*/
  );/*end prog*/
);/*end procedure SetLayersVisible*/

/*FindNewEntryLayer procedure*/
procedure(FindNewEntryLayer(l_layers)
  prog( ()
    techfile_dbId=techGetTechFile(geGetEditCellView()) ;/*changed from techfile_dbId=FindTechFile()*/
    l_layers_out=nil
    foreach( layer leGetValidLayerList(techfile_dbId)
      if( leIsLayerVisible( layer ) && !member( layer l_layers ) then 
        l_layers_out=cons(layer l_layers_out)
      );/*end if*/
    );/*end foreach*/
    if( !l_layers_out then
      return( car(leGetValidLayerList(techfile_dbId))
    );/*end if*/
    else
      return( car(reverse(l_layers_out)))
    );/*endif*/
  );/*end prog*/
);/*end procedure FindNewEntryLayer*/

;/*FindTechFile procedure*/
procedure(FindTechFile()
  prog( ()
  ;/*function finds correct tech file*/
    l_techfile_dbId=techGetOpenTechFiles() ;/*lists tech files open - encrypted*/
    l_techfile_dbId_subset=setof( techfile l_techfile_dbId lowerCase(techfile~>libName)==getShellEnvVar("CAD_PROCESS") || techfile~>libName=="LIBNAMEHERE")
    if( length(l_techfile_dbId_subset) != 1 then
      lib_prop_list = getCurrentWindow()~>cellView~>lib~>prop
      foreach( lib_prop lib_prop_list
        if( strcmp(lib_prop~>name, "techLibName")==0 then 
          techfile_name=lib_prop~>value
        );/*end if*/
      );/*end foreach*/
      foreach(possible_techfile_dbID l_techfile_dbId_subset
        if( strcmp(possible_techfile_dbID~>libName techfile_name)==0 then 
          techfile_dbId=possible_techfile_dbID
        );/*end if*/
      );/*end foreach*/
    else
      techfile_dbId=car(l_techfile_dbId_subset)
    );/*end if*/
  return(techfile_dbId)
  );/*end prog*/
);/*end procedure FindTechFile*/

