package nslm2.modules.funnies.championShip
{
   import game.ui.championship.ChampionshipViewUI;
   import org.specter3d.display.Specter3D;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import morn.core.components.ViewStack;
   import nslm2.modules.funnies.championShip.service.ChampionShipService;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import org.specter3d.loaders.AssetLib;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import morn.customs.FilterLib;
   import flash.display.Sprite;
   import flash.display.Shape;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import morn.core.components.Button;
   import nslm2.modules.funnies.arenas.rewards.ActRewardVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.LabelUtils;
   import proto.CompeteInfoRes;
   import nslm2.modules.foundations.chatModules.ChatModuleParam;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.MainToolBarChangeMsg;
   import nslm2.modules.funnies.championShip.vo.ChampionShipHistoryVo;
   import com.greensock.TweenLite;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import nslm2.mgrs.skins.ColorLib;
   import flash.events.Event;
   import com.mz.core.mgrs.UIMgr;
   import nslm2.utils.TransformUtil;
   import nslm2.modules.funnies.championShip.view.GroupChampionView;
   import nslm2.modules.funnies.championShip.view.FinalChampionView;
   import morn.customs.expands.MornExpandUtil;
   
   public class ChampionShipModule extends ChampionshipViewUI
   {
       
      
      private var layer3D:Specter3D;
      
      public var bg3d:Image3D;
      
      private var viewStack:ViewStack;
      
      private var service:ChampionShipService;
      
      private var model:ChampionShipModel;
      
      private var textCDCtrl:TextCDCtrlS2;
      
      private var glowEffCtl:GlowFilterBreathCtrl;
      
      public function ChampionShipModule()
      {
         service = ChampionShipService.ins;
         model = ChampionShipModel.ins;
         super();
         layer3D = new Specter3D();
         UIMgr.root3D.addChild(layer3D);
         TransformUtil.cameraToSceneBattle();
         bg3d = new Image3D(UrlLib.getChampionshipImg("bg.png"),1500,900,2300);
         layer3D.addChild(bg3d);
         model.layer3D = layer3D;
         viewStack = new ViewStack();
         viewStack.subViewClasses = [GroupChampionView,FinalChampionView];
         viewStack.centerX = 0;
         viewStack.centerY = 0;
         addChildAt(viewStack,0);
         textCDCtrl = new TextCDCtrlS2(this.txt_status,textCDFormat,cdComplieteHandler);
         parts.push(model);
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         box_gamble.addEventListener("click",showMyGambleRecord);
         box_record.addEventListener("click",showMyCompeteRecord);
         box_rule.toolTip = LocaleMgr.ins.getStr(50400207);
         service.init();
         this.parts.push(service);
      }
      
      protected function load_res_onCompl() : void
      {
         var _loc1_:BitmapData = AssetLib.getBitmapData(UrlLib.getChampionshipImg("bg.png"));
         var _loc3_:BitmapData = _loc1_.clone();
         _loc3_.applyFilter(_loc3_,new Rectangle(0,0,1500,900),new Point(),FilterLib.sceneBlurFilter);
         var _loc2_:Sprite = new Sprite();
         var _loc4_:Shape = new Shape();
         _loc4_.graphics.beginFill(0,0.8);
         _loc4_.graphics.drawRect(0,0,1500,900);
         _loc2_.addChild(new Bitmap(_loc3_));
         _loc2_.addChild(_loc4_);
         var _loc5_:BitmapData = new BitmapData(1500,900,true,0);
         _loc5_.draw(_loc2_);
         bg3d.showByBmd(_loc1_);
      }
      
      protected function showMyCompeteRecord(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(50404);
      }
      
      protected function showMyGambleRecord(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(50403);
      }
      
      private function getRankReward() : void
      {
         service.getChampionRankReward();
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = param1;
         if(btn_chest === _loc3_)
         {
            _loc2_ = new ActRewardVo();
            _loc2_.list_items = model.rewardList;
            _loc2_.canGetReward = model.canGetReward;
            _loc2_.hasGotReward = model.hasGotReward;
            _loc2_.canGetTip = LocaleMgr.ins.getStr(11800102);
            _loc2_.canNotGetTip = LocaleMgr.ins.getStr(50400601);
            _loc2_.yesterdayRank = model.myRank;
            _loc2_.rank = model.myRank;
            _loc2_.titleString = LocaleMgr.ins.getStr(40710510);
            _loc2_.getHandler = getRankReward;
            _loc2_.tipString = LocaleMgr.ins.getStr(50400106);
            ModuleMgr.ins.showModule(50242,_loc2_);
         }
      }
      
      private function textCDFormat(param1:int) : String
      {
         var _loc2_:* = null;
         var _loc4_:int = 0;
         var _loc3_:* = null;
         switch(int(model.cdType) - 1)
         {
            case 0:
               _loc2_ = LocaleMgr.ins.getStr(50400206);
               break;
            case 1:
               _loc2_ = LocaleMgr.ins.getStr(50400205);
               break;
            case 2:
               _loc2_ = LocaleMgr.ins.getStr(50400205);
               break;
            default:
               _loc2_ = LocaleMgr.ins.getStr(50400204);
               break;
            case 4:
               _loc2_ = LocaleMgr.ins.getStr(50400208);
         }
         if(param1 > 86400)
         {
            _loc3_ = int(param1 / 86400) + LocaleMgr.ins.getStr(999000413);
         }
         else
         {
            _loc3_ = TimeUtils.hisColonFullAddZero(param1);
         }
         return _loc2_ + " " + TextFieldUtil.htmlText2(_loc3_,LabelUtils.cdColor(true));
      }
      
      private function cdComplieteHandler() : void
      {
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         service.reqeustBaseInfo(onGetBaseInfo);
      }
      
      private function onGetBaseInfo(param1:CompeteInfoRes) : void
      {
         model.updateChampionShipBaseInfo(param1);
         this.moduleServerCpl();
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         ModuleMgr.ins.staticLayer.closeAll([10430]);
         ModuleMgr.ins.showModule(10500,ChatModuleParam.init(this.moduleId,false));
         ObserverMgr.ins.sendNotice("msg_main_tool_bar_id",new MainToolBarChangeMsg(MainToolBarChangeMsg.Chapter_moduleIdArr,[],true,false));
         updateCDStatus();
         var _loc2_:ChampionShipHistoryVo = this.moduleInfo.historyParam;
         if(_loc2_)
         {
            initView(_loc2_.selectedGroupIndex);
         }
         else
         {
            initView();
         }
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         var _loc2_:ChampionShipHistoryVo = this.moduleInfo.historyParam;
         super.show(param1);
         TweenLite.delayedCall(0.1,reShowGamblePanel);
         onResize(null);
      }
      
      private function reShowGamblePanel() : void
      {
         var _loc1_:ChampionShipHistoryVo = this.moduleInfo.historyParam;
         if(_loc1_)
         {
            if(_loc1_.crtNodeRes)
            {
               ModuleMgr.ins.showModule(50401,_loc1_.crtNodeRes);
            }
         }
      }
      
      private function initView(param1:int = -1) : void
      {
         this.list_group.dataSource = [1,2,3,4,5];
         list_group.selectHandler = groupChangeHandler;
         if(param1 >= 0)
         {
            setDefaultIndex(param1);
         }
         else
         {
            setDefaultIndex(model.myGroupIndex);
         }
         updateGambleRewardStatus();
      }
      
      private function groupChangeHandler(param1:int) : void
      {
         model.selectedGroupIndex = param1;
         if(param1 > 3)
         {
            viewStack.selectedIndex = 1;
         }
         else
         {
            viewStack.selectedIndex = 0;
         }
         ObserverMgr.ins.sendNotice("notice_change_group_index");
      }
      
      private function setDefaultIndex(param1:*) : void
      {
         list_group.selectedIndex = param1;
      }
      
      private function updateCDStatus() : void
      {
         textCDCtrl.start(model.nextRoundTime);
      }
      
      private function updateGambleRewardStatus() : void
      {
         if(model.canGetGambleReward)
         {
            if(!glowEffCtl)
            {
               glowEffCtl = new GlowFilterBreathCtrl(FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(7))).addHandler(breath_cb).set_duration(1);
            }
         }
         else
         {
            if(glowEffCtl)
            {
               glowEffCtl.dispose();
            }
            glowEffCtl = null;
            this.btn_myGamble.filters = [];
         }
      }
      
      private function breath_cb(param1:Array) : void
      {
         this.btn_myGamble.filters = param1;
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["notice_update_status","notice_update_gamble_reward_status"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("notice_update_status" !== _loc3_)
         {
            if("notice_update_gamble_reward_status" === _loc3_)
            {
               updateGambleRewardStatus();
            }
         }
         else
         {
            updateCDStatus();
         }
      }
      
      override public function getHistoryParam() : *
      {
         var _loc1_:ChampionShipHistoryVo = new ChampionShipHistoryVo();
         _loc1_.selectedGroupIndex = model.selectedGroupIndex;
         _loc1_.selectedNodeIndex = model.selectedNodeIndex;
         _loc1_.crtNodeRes = model.crtCompeteStageInfoRes;
         return _loc1_;
      }
      
      override protected function resetPosition() : void
      {
         viewStack.centerX = 0;
         viewStack.centerY = 0;
         super.resetPosition();
      }
      
      override protected function onResize(param1:Event) : void
      {
         super.onResize(param1);
         if(UIMgr.gameHeight < 700)
         {
            box_top.y = 8;
         }
         else
         {
            box_top.y = (UIMgr.gameHeight >> 1) - 340;
         }
      }
      
      override public function dispose() : void
      {
         this.layer3D.dispose();
         textCDCtrl.stop();
         textCDCtrl = null;
         super.dispose();
      }
   }
}
