package nslm2.modules.footstones.tooltipsModules.uis
{
   import proto.HeroInfo;
   import nslm2.modules.footstones.tooltipsModules.uis.ctrls.TooltipHeroCtrl;
   import nslm2.modules.roleInfos.equipPanels.RoleMengYuePanel;
   import nslm2.modules.cultivates.position.TooltipPositionVo;
   
   public class TooltipPosition extends TooltipUICommon
   {
       
      
      public function TooltipPosition()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         super.show(param1,param2);
         var _loc4_:HeroInfo = param2 as HeroInfo;
         this.parts.push(new TooltipHeroCtrl(this,_loc4_));
         var _loc3_:RoleMengYuePanel = new RoleMengYuePanel();
         _loc3_.updateMengYueData((param1 as TooltipPositionVo).toolTipYuanFenVo.mengYueArr);
         _loc3_.x = this.width;
         _loc3_.y = 4;
         this.addChild(_loc3_);
         this.width = _loc3_.x + _loc3_.width;
         this.validateSize();
      }
   }
}
