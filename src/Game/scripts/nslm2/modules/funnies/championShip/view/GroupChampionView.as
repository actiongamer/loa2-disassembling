package nslm2.modules.funnies.championShip.view
{
   import game.ui.championship.GroupChampionViewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   import nslm2.modules.funnies.championShip.service.ChampionShipService;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.components.Button;
   import proto.CompeteStageInfoRes;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.funnies.championShip.util.ChampionShipUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.CompeteGroupStageInfoRes;
   import proto.CompetePlayerDisplayInfo;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.funnies.championShip.consts.ChampionshipConsts;
   import morn.customs.expands.MornExpandUtil;
   
   public class GroupChampionView extends GroupChampionViewUI implements IViewStackPage, IObserver
   {
      
      public static const LINE_MAX_INDEX:int = 30;
      
      public static const MAX_BTN_INDEX:int = 14;
      
      public static const MAX_PLAYER_INDEX:int = 15;
       
      
      private var model:ChampionShipModel;
      
      private var service:ChampionShipService;
      
      private var preRoundArr:Array;
      
      private var wingEffect1:BmcSpriteSheet;
      
      private var wingEffect2:BmcSpriteSheet;
      
      public function GroupChampionView()
      {
         model = ChampionShipModel.ins;
         service = ChampionShipService.ins;
         preRoundArr = [];
         super();
         initView();
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         wingEffect1 = new BmcSpriteSheet();
         wingEffect1.init(5040001,1,"all",true);
         wingEffect1.x = 630;
         wingEffect1.y = 256;
         addChild(wingEffect1);
         wingEffect2 = new BmcSpriteSheet();
         wingEffect2.init(5040001,1,"all",true);
         wingEffect2.x = 777;
         wingEffect2.y = 256;
         addChild(wingEffect2);
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc2_:int = param1.name.split("_")[1];
         model.selectedNodeIndex = _loc2_;
         service.requestNodeInfo(_loc2_,model.selectedGroupIndex,getStageInfoHandler);
      }
      
      private function getStageInfoHandler(param1:CompeteStageInfoRes) : void
      {
         model.crtCompeteStageInfoRes = param1;
         ModuleMgr.ins.showModule(50401,param1);
      }
      
      public function getFocusNotices() : Array
      {
         return ["notice_update_playres","notice_update_status","notice_change_group_index","notice_update_nodes"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("notice_update_playres" !== _loc3_)
         {
            if("notice_update_status" !== _loc3_)
            {
               if("notice_update_nodes" !== _loc3_)
               {
                  if("notice_change_group_index" === _loc3_)
                  {
                     ChampionShipUtil.initView(this,30,14);
                     update();
                  }
               }
               else
               {
                  updateProgressLine();
                  updateChampion();
               }
            }
            else
            {
               if(preRoundArr[model.selectedGroupIndex] == 0 && model.crtStatus != preRoundArr[model.selectedGroupIndex])
               {
                  service.server_competePlayerDisplay(model.selectedGroupIndex);
               }
               service.reqeustGroupNodeData(model.selectedGroupIndex);
               updateBtnStauts();
            }
         }
         else
         {
            updatePlayersList();
         }
      }
      
      public function viewStackIn() : void
      {
         ObserverMgr.ins.regObserver(this);
         this.visible = true;
         update();
      }
      
      private function update() : void
      {
         if(model.getGroupPlayersData())
         {
            if(preRoundArr[model.selectedGroupIndex] == 0 && model.crtStatus != preRoundArr[model.selectedGroupIndex])
            {
               service.server_competePlayerDisplay(model.selectedGroupIndex);
            }
            else
            {
               updatePlayersList();
            }
         }
         else
         {
            service.server_competePlayerDisplay(model.selectedGroupIndex);
         }
         updateCompeData();
      }
      
      private function updateCompeData() : void
      {
         var _loc1_:CompeteGroupStageInfoRes = model.getGroupCompeData();
         if(_loc1_ && preRoundArr[model.selectedGroupIndex] == model.crtStatus)
         {
            updateProgressLine();
            updateChampion();
         }
         else
         {
            preRoundArr[model.selectedGroupIndex] = model.crtStatus;
            service.reqeustGroupNodeData(model.selectedGroupIndex);
         }
         updateBtnStauts();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
      }
      
      private function initView() : void
      {
         var _loc2_:int = 0;
         ChampionShipUtil.initView(this,30,14);
         var _loc1_:Array = [];
         _loc2_ = 0;
         while(_loc2_ <= 15)
         {
            _loc1_.push(null);
            _loc2_++;
         }
         this.list_players.dataSource = _loc1_;
         txt_championName.text = "";
         btn_ganbleBig.disabled = true;
      }
      
      private function updateProgressLine() : void
      {
         ChampionShipUtil.updateProgressLine(this);
      }
      
      private function updateChampion() : void
      {
         var _loc1_:* = null;
         if(model.getGroupCompeData().winnerDisplayIndex >= 0)
         {
            _loc1_ = model.getGroupPlayersData()[model.getGroupCompeData().winnerDisplayIndex - 15] as CompetePlayerDisplayInfo;
            btn_ganbleBig.visible = false;
            img_championIcon.url = HeroInfoUtil.getHeadIconUrl(_loc1_.baseInfo.id,_loc1_.baseInfo.npcId);
            txt_championName.text = LinkUtils.playerNameSmart(_loc1_.baseInfo.id,_loc1_.baseInfo.name,_loc1_.baseInfo.dist,ColorLib.getMilitaryColor(_loc1_.baseInfo.militaryRank));
            btn_0.visible = true;
         }
         else
         {
            btn_0.visible = false;
         }
      }
      
      private function updateBtnStauts() : void
      {
         var _loc1_:* = null;
         var _loc4_:int = 0;
         var _loc3_:int = model.gambleAvailableStatus;
         var _loc2_:int = ChampionshipConsts.ENABLE_BTN_START_INDEX[_loc3_];
         if(model.crtStatus == 0)
         {
            _loc2_ = 1;
         }
         _loc4_ = 1;
         while(_loc4_ <= 14)
         {
            _loc1_ = this["btn_" + _loc4_];
            if(_loc1_)
            {
               if(_loc4_ >= _loc2_)
               {
                  _loc1_.disabled = false;
               }
               else
               {
                  _loc1_.disabled = true;
               }
            }
            _loc4_++;
         }
         if(model.gambleAvailableStatus >= 4)
         {
            btn_ganbleBig.disabled = false;
         }
      }
      
      private function updatePlayersList() : void
      {
         list_players.dataSource = model.getGroupPlayersData();
      }
   }
}
