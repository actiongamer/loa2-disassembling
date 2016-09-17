package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.NpcCarrerTypeRenderUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class NpcCarrerTypeRender extends NpcCarrerTypeRenderUI
   {
       
      
      public function NpcCarrerTypeRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         var _loc2_:int = param1.index as int;
         img_icon.url = UrlLib.npcTypeImg(_loc2_);
         txt_type.text = LocaleMgr.ins.getStr(30100020 + _loc2_);
         txt_des.text = LocaleMgr.ins.getStr(30100024 + _loc2_);
         img_selected.visible = _loc2_ == param1.type;
      }
   }
}
