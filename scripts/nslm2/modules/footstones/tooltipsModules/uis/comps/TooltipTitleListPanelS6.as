package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.TooltipTitleListPanelS6UI;
   import nslm2.modules.footstones.tooltipsModules.TooltipEquipAttrVo;
   import morn.core.components.Label;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Image;
   import com.greensock.TweenLite;
   
   public class TooltipTitleListPanelS6 extends TooltipTitleListPanelS6UI
   {
       
      
      public var curHeight:int = 22;
      
      public function TooltipTitleListPanelS6(param1:String, param2:Array, param3:Class = null)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         super();
         this.txt_title.text = param1;
         var _loc8_:int = 0;
         var _loc7_:* = param2;
         for each(var _loc6_ in param2)
         {
            _loc4_ = new Label();
            _loc4_.x = 16;
            _loc4_.y = curHeight;
            _loc4_.leading = 5;
            _loc4_.width = 194;
            _loc4_.multiline = true;
            _loc4_.wordWrap = true;
            _loc4_.text = "【" + LocaleMgr.ins.getStr(_loc6_.attr_name) + "】" + LocaleMgr.ins.getStr(_loc6_.attr_disc) + "\n" + "（" + LocaleMgr.ins.getStr(_loc6_.active_disc) + "）";
            _loc4_.color = !!_loc6_.actived?458496:7566195;
            _loc5_ = new Image();
            _loc5_.skin = "png.a5.prefabs.img_titlePoint";
            _loc5_.x = 4;
            _loc5_.y = curHeight + 6;
            curHeight = curHeight + (_loc4_.textHeight + 5);
            this.addChild(_loc5_);
            this.addChild(_loc4_);
            TweenLite.from(_loc5_,0.5,{
               "alpha":0,
               "x":86
            });
            TweenLite.from(_loc4_,0.5,{
               "alpha":0,
               "x":74
            });
         }
         this.height = curHeight - 5;
         this.x = 15;
      }
   }
}
