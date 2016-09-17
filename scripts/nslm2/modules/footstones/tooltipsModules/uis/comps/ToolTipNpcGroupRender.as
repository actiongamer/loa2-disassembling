package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.NpcGroupRenderUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class ToolTipNpcGroupRender extends NpcGroupRenderUI
   {
       
      
      public function ToolTipNpcGroupRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:int = param1.index as int;
         img_icon.url = UrlLib.npcGroupImg(_loc2_);
         txt_des.text = LocaleMgr.ins.getStr(30100310 + _loc2_);
         img_selected.visible = _loc2_ == param1.type;
      }
   }
}
