package nslm2.modules.funnies.championShip.view
{
   import game.ui.championship.FinalChampionviewUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import nslm2.modules.funnies.championShip.service.ChampionShipService;
   import morn.core.components.Button;
   import proto.CompeteStageInfoRes;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.funnies.championShip.consts.ChampionshipConsts;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import nslm2.modules.funnies.championShip.util.ChampionShipUtil;
   import proto.CompeteGroupStageInfoRes;
   import proto.CompetePlayerDisplayInfo;
   import nslm2.modules.footstones.linkModules.LinkUtils;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class FinalChampionView extends FinalChampionviewUI implements IViewStackPage, IObserver
   {
      
      private static const LINE_MAX_INDEX:int = 6;
      
      private static const MAX_BTN_INDEX:int = 2;
      
      private static const MAX_PLAYER_INDEX:int = 4;
       
      
      private var model:ChampionShipModel;
      
      private var imgStages:Array;
      
      private var championAvatar:Unit3DBase;
      
      private var preRound:int;
      
      private var service:ChampionShipService;
      
      private var emptArr:Array;
      
      public function FinalChampionView()
      {
         model = ChampionShipModel.ins;
         imgStages = [];
         service = ChampionShipService.ins;
         emptArr = [];
         super();
         addStageImgs();
         initView();
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
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
      
      private function addStageImgs() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:* = null;
         _loc3_ = 0;
         while(_loc3_ < 4)
         {
            _loc1_ = new Image3D(UrlLib.getChampionshipImg("stageSmall.png"),114,36,1900);
            _loc2_ = ChampionshipConsts.STAGE_IMG_POS[_loc3_];
            _loc1_.position = new Vector3D(_loc2_.x,_loc2_.y,2000);
            model.layer3D.addChild(_loc1_);
            imgStages.push(_loc1_);
            _loc3_++;
         }
         _loc1_ = new Image3D(UrlLib.getChampionshipImg("stageBig.png"),168,54,1900);
         _loc1_.position = new Vector3D(0,-100,2000);
         model.layer3D.addChild(_loc1_);
         imgStages.push(_loc1_);
      }
      
      private function initView() : void
      {
         var _loc1_:int = 0;
         ChampionShipUtil.initView(this,6,2);
         _loc1_ = 0;
         while(_loc1_ <= 4)
         {
            emptArr.push(_loc1_);
            _loc1_++;
         }
         this.list_players.dataSource = emptArr;
         championRender.nameRender.visible = false;
         btn_0.disabled = true;
      }
      
      private function update() : void
      {
         if(model.getGroupPlayersData() && model.getGroupPlayersData().length > 0)
         {
            if(preRound == 0 && model.crtStatus != preRound)
            {
               service.server_competePlayerDisplay(model.selectedGroupIndex);
            }
            else
            {
               updatePlayersList();
            }
         }
         else if(model.crtStatus > 5 || model.crtStatus == 0)
         {
            service.server_competePlayerDisplay(model.selectedGroupIndex);
         }
         updateCompeData();
      }
      
      private function updateCompeData() : void
      {
         var _loc1_:CompeteGroupStageInfoRes = model.getGroupCompeData();
         if(_loc1_ && preRound == model.crtStatus)
         {
            updateProgressLine();
            updateChampion();
         }
         else
         {
            preRound = model.crtStatus;
            service.reqeustGroupNodeData(model.selectedGroupIndex);
         }
         updateBtnStauts();
      }
      
      private function updateChampion() : void
      {
         var _loc1_:* = null;
         if(model.getGroupCompeData().winnerDisplayIndex >= 0)
         {
            _loc1_ = model.getGroupPlayersData()[model.getGroupCompeData().winnerDisplayIndex - 3] as CompetePlayerDisplayInfo;
            btn_0.visible = false;
            btn_small.visible = true;
            championRender.box_empty.visible = false;
            championRender.nameRender.txt_name.text = LinkUtils.playerNameSmart(_loc1_.baseInfo.id,_loc1_.baseInfo.name,_loc1_.baseInfo.dist,ColorLib.getMilitaryColor(_loc1_.baseInfo.militaryRank));
            if(!championAvatar)
            {
               championAvatar = new Unit3DBase(model.layer3D);
               PlayerModel.ins.changePlayerViewByPlayerBaseInfo(championAvatar,_loc1_.baseInfo);
               championAvatar.scaleAll = 1.4;
               championAvatar.pos2d = new Point(0,-100);
            }
            championRender.nameRender.visible = true;
         }
         else
         {
            btn_small.visible = false;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["notice_update_playres","notice_update_status","notice_update_nodes"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("notice_update_playres" !== _loc3_)
         {
            if("notice_update_status" !== _loc3_)
            {
               if("notice_update_nodes" === _loc3_)
               {
                  updateProgressLine();
                  updateChampion();
               }
            }
            else
            {
               if(preRound == 0 && model.crtStatus != preRound)
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
      
      private function updateBtnStauts() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = model.gambleAvailableStatus;
         if(_loc2_ > 10 || _loc2_ == 0)
         {
            _loc3_ = 1;
            while(_loc3_ <= 2)
            {
               _loc1_ = this["btn_" + _loc3_];
               if(_loc1_)
               {
                  _loc1_.disabled = false;
               }
               _loc3_++;
            }
         }
         if(model.gambleAvailableStatus >= 12)
         {
            btn_0.disabled = false;
         }
      }
      
      private function updatePlayersList() : void
      {
         if(model.getGroupPlayersData().length > 0)
         {
            list_players.dataSource = model.getGroupPlayersData();
         }
         else
         {
            list_players.dataSource = emptArr;
         }
      }
      
      private function updateProgressLine() : void
      {
         ChampionShipUtil.updateProgressLine(this);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         ObserverMgr.ins.regObserver(this);
         var _loc3_:int = 0;
         var _loc2_:* = imgStages;
         for each(var _loc1_ in imgStages)
         {
            _loc1_.visible = true;
         }
         if(championAvatar)
         {
            this.championAvatar.visible = true;
         }
         update();
      }
      
      public function viewStackOut() : void
      {
         this.visible = false;
         ObserverMgr.ins.unregObserver(this);
         var _loc3_:int = 0;
         var _loc2_:* = imgStages;
         for each(var _loc1_ in imgStages)
         {
            _loc1_.visible = false;
         }
         if(championAvatar)
         {
            championAvatar.dispose();
            championAvatar = null;
         }
         this.list_players.dataSource = emptArr;
      }
   }
}
