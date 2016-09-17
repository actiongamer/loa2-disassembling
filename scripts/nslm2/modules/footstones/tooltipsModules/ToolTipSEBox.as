package nslm2.modules.footstones.tooltipsModules
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import nslm2.modules.funnies.secretExplore.SEBoxTipsVo;
   import morn.core.components.Label;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.List;
   import nslm2.modules.funnies.teamGuajiScenes.changeChallenges.WealthRenderS5;
   
   public class ToolTipSEBox extends TooltipUICommon
   {
       
      
      public function ToolTipSEBox()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         super.show(param1,param2);
         var _loc3_:SEBoxTipsVo = param1 as SEBoxTipsVo;
         var _loc5_:Label = new Label();
         _loc5_.width = 296;
         _loc5_.wordWrap = true;
         _loc5_.multiline = true;
         _loc5_.text = LocaleMgr.ins.getStr(50700128,[_loc3_.phase + 1]);
         _loc5_.x = 15;
         this.box.addChild(_loc5_);
         var _loc4_:List = new List();
         _loc4_.itemRender = WealthRenderS5;
         _loc4_.repeatX = _loc3_.items.length;
         _loc4_.array = _loc3_.items;
         _loc4_.scale = 0.8;
         _loc4_.x = 15;
         this.box.addChild(_loc4_);
         this.validateSize();
      }
   }
}
