package nslm2.modules.scenes.ctrls
{
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.funnies.newYears.newYear2016s.bossPanels.NewYear2016_BossFightAlert;
   import nslm2.modules.funnies.npcFuncLists.FuncOpenTimeVo;
   import nslm2.utils.ServerTimer;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class NewYear2016_SceneBossCtrl extends SceneDefaultFuncCtrl
   {
       
      
      public function NewYear2016_SceneBossCtrl()
      {
         super();
         autoRo = false;
      }
      
      public function get service() : NewYear2016Service
      {
         return NewYear2016Service.ins;
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         this.npc.useShadow = false;
      }
      
      override protected function runHandler() : void
      {
         this.onTrigger();
      }
      
      public function onTrigger() : void
      {
         var _loc1_:* = null;
         if(NpcFuncService.ins.isOpenTime(13312))
         {
            AlertUtil.comfirm(new NewYear2016_BossFightAlert(),btn_get_alert_yes);
         }
         else
         {
            _loc1_ = NpcFuncService.ins.getOpenTimeVo(13312);
            if(_loc1_)
            {
               if(ServerTimer.ins.second < _loc1_.startTime)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(13310015));
               }
               else
               {
                  AlertUtil.floadFuncTimeIsExpire();
                  if(npc)
                  {
                     this.npc.dispose();
                     this.npc = null;
                  }
               }
            }
            else
            {
               AlertUtil.floadFuncTimeIsExpire();
               if(npc)
               {
                  this.npc.dispose();
                  this.npc = null;
               }
            }
         }
      }
      
      private function btn_get_alert_yes() : void
      {
         this.service.server_bossStart();
      }
   }
}
