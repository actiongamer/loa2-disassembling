package nslm2.modules.footstones.tooltipsModules
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import game.ui.secretExplore.SETipsUI;
   import proto.MjtxEnemyInfo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.utils.WealthUtil;
   import game.ui.secretExplore.SETipFaceUI;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class ToolTipSecretExplore extends TooltipUICommon
   {
       
      
      public var ui:SETipsUI;
      
      public function ToolTipSecretExplore()
      {
         super();
         ui = new SETipsUI();
         addChild(ui);
         this.img_bg.visible = false;
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         var _loc6_:int = 0;
         var _loc5_:int = 0;
         var _loc4_:* = null;
         super.show(param1,param2);
         var _loc3_:MjtxEnemyInfo = param1 as MjtxEnemyInfo;
         ui.txt_reward.text = LocaleMgr.ins.getStr(50700116,[_loc3_.reward]);
         _loc6_ = 0;
         while(_loc6_ < _loc3_.bpModelId.length)
         {
            _loc5_ = _loc3_.bpModelId[_loc6_];
            _loc4_ = StcMgr.ins.getNpcVo(_loc5_);
            if(_loc4_)
            {
               if(ui.hasOwnProperty("f" + _loc6_))
               {
                  WealthUtil.changeQualitySkin(SETipFaceUI(ui["f" + _loc6_]).img_quality,_loc4_.quality);
                  SETipFaceUI(ui["f" + _loc6_]).img_icon.url = UrlLib.headIcon(_loc4_.head_id);
               }
            }
            _loc6_++;
         }
      }
      
      override protected function validateSize() : void
      {
         super.validateSize();
      }
   }
}
