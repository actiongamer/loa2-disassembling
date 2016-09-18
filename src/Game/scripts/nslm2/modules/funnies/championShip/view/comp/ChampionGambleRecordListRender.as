package nslm2.modules.funnies.championShip.view.comp
{
   import game.ui.championship.comp.GambleRecordListRenderUI;
   import proto.CompeteGambleInfo;
   import morn.core.components.Button;
   import nslm2.modules.funnies.championShip.service.ChampionShipService;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.CompeteStageInfoRes;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.PlayerBaseInfo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.expands.MornExpandUtil;
   import com.mz.core.mediators.RollMediator;
   
   public class ChampionGambleRecordListRender extends GambleRecordListRenderUI
   {
       
      
      private var _data:CompeteGambleInfo;
      
      public function ChampionGambleRecordListRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         parts.push(new RollMediator(this,rollHandler));
         img_selected.visible = false;
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_get !== _loc2_)
         {
            if(btn_see === _loc2_)
            {
               ChampionShipService.ins.requestNodeInfo(_data.frontStageIndex,_data.gStageIndex,getNodeInfoCallBack);
            }
         }
         else
         {
            ChampionShipService.ins.getGambleReward(_data.gStageIndex,_data.frontStageIndex,getRwdCallBack);
         }
      }
      
      private function getRwdCallBack(param1:Object) : void
      {
         ChampionShipModel.ins.canGetGambleReward = param1.canGetGambleReward;
         _data.rewardStatus = 2;
         dataSource = _data;
         ObserverMgr.ins.sendNotice("notice_get_gamle_reward_success");
      }
      
      private function getNodeInfoCallBack(param1:CompeteStageInfoRes) : void
      {
         ModuleMgr.ins.showModule(50401,param1,50403);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         _data = param1 as CompeteGambleInfo;
         if(_data)
         {
            if(_data.status > 5)
            {
               _loc4_ = _data.status - 10;
               _loc5_ = 50400408;
            }
            else
            {
               _loc4_ = _data.status;
               _loc5_ = 50400407;
            }
            _loc2_ = new PlayerBaseInfo();
            _loc2_.id = _data.playerId;
            _loc2_.name = _data.playerName;
            _loc3_ = LocaleMgr.ins.getStr(_loc5_,[_loc4_,_loc2_,_data.gambleDiamond]);
            txt_content.text = _loc3_;
            switch(int(_data.rewardStatus))
            {
               case 0:
                  btn_get.label = LocaleMgr.ins.getStr(10700007);
                  btn_get.disabled = true;
                  break;
               case 1:
                  btn_get.label = LocaleMgr.ins.getStr(10700007);
                  btn_get.disabled = false;
                  break;
               case 2:
                  btn_get.disabled = true;
                  btn_get.label = LocaleMgr.ins.getStr(10700013);
            }
            if(_data.rewardDiamond > _data.gambleDiamond)
            {
               this.img_title.skin = "png.uiChampionship.y";
            }
            else if(_data.rewardDiamond < _data.gambleDiamond && _data.rewardDiamond > 0)
            {
               this.img_title.skin = "png.uiChampionship.k";
            }
            txt_reward.text = _data.rewardDiamond + "";
         }
         .super.dataSource = param1;
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         img_selected.visible = param1;
      }
   }
}
