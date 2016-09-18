package nslm2.modules.funnies.families.familyBosses.view
{
   import game.ui.familyBosses.DamageRewardShowPanelUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import flash.events.MouseEvent;
   import com.greensock.TweenLite;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.funnies.families.familyBosses.model.FamilyBossModel;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class DamageRewardShowPanel extends DamageRewardShowPanelUI implements IObserver
   {
       
      
      public var glowFilterCtrl:GlowFilterBreathCtrl;
      
      private var btnEff:BmcSpriteSheet;
      
      public function DamageRewardShowPanel()
      {
         super();
         box_mini.addEventListener("click",miniBtnClick);
         btn_getReward.clickHandler = gotoGetReward;
         update();
         ObserverMgr.ins.regObserver(this);
      }
      
      protected function miniBtnClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(this.box_content.x > -2)
         {
            _loc2_ = -2;
            TweenLite.to(box_content,0.2,{"x":_loc2_});
            TweenLite.to(img_suofang,0.2,{"rotation":180});
         }
         else
         {
            _loc2_ = box_content.width + 10;
            TweenLite.to(box_content,0.2,{"x":_loc2_});
            TweenLite.to(img_suofang,0.2,{"rotation":0});
         }
      }
      
      private function gotoGetReward() : void
      {
         ModuleMgr.ins.showModule(40743,null,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      public function update() : void
      {
         var _loc1_:* = FamilyBossModel.ins.rwdCnt > 0;
         if(_loc1_)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.init(10000002,1,"all",true);
               this.box_content.addChild(btnEff);
               btnEff.x = 82;
               btnEff.y = 218;
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
         list_reward.dataSource = FamilyBossModel.ins.dmgRewardData;
      }
      
      public function getFocusNotices() : Array
      {
         return ["family_boss_update_dmg_rwd","family_boss_get_dmg_rwd_success"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("family_boss_update_dmg_rwd" !== _loc3_)
         {
            if("family_boss_get_dmg_rwd_success" === _loc3_)
            {
               update();
            }
         }
         else
         {
            update();
         }
      }
      
      override public function dispose() : void
      {
         if(glowFilterCtrl != null)
         {
            glowFilterCtrl.dispose();
            glowFilterCtrl = null;
         }
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
