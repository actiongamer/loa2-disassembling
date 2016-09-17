package nslm2.modules.funnies.busyActivity.towers.funnys
{
   import game.ui.busyActivity.towers.funnys.TowerFunnyPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.funnies.funnyCommons.IInitView;
   import com.mz.core.utils.DictHash;
   import nslm2.utils.TempBagCtrl;
   import nslm2.modules.funnies.busyActivity.towers.services.TowerService;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import game.ui.busyActivity.towers.funnys.TowerFunnyGoldBgUI;
   import morn.core.components.Component;
   import game.ui.busyActivity.towers.funnys.TowerFunnySilverBgUI;
   import nslm2.mgrs.stcMgrs.vos.StcLotteryVo;
   import nslm2.modules.funnies.busyActivity.towers.services.stcVos.TowerStcVo_TowerCost;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import proto.ProtocolStatusRes;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import flash.geom.Point;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.model.OpActivityStaticDataModel;
   import proto.StaticOpActivityTmModel;
   import morn.customs.expands.MornExpandUtil;
   
   public class TowerFunnyPanel extends TowerFunnyPanelUI implements IViewStackPage, IObserver, IInitView
   {
      
      private static var bagDictHashDic:Object = {};
       
      
      public var funnyKind:int;
      
      private var _tempBagCtrl:TempBagCtrl;
      
      private var cdCtrl:TextCDCtrlS2;
      
      private var successEffCtrl:nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnySuccessEffCtrl;
      
      private var curLayerCell:nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyLayerRender;
      
      public var player2dBox:Component;
      
      public var playerMoveBss:BmcSpriteSheet;
      
      public var playerStandBss:BmcSpriteSheet;
      
      public var curLv:int;
      
      public function TowerFunnyPanel()
      {
         super();
         (this.pageBar_bagUI as IPageBar).bindList(this.list_bag);
         _tempBagCtrl = new TempBagCtrl();
         this.parts.push(new TempBagCtrl());
         var _loc2_:WealthVo = WealthUtil.parseCostStr(DefindConsts.TOWER_GOLD_SHOP_ITEM);
         _loc2_.useStcCount = true;
         this.renderWealth0.wealthVo = _loc2_;
         _loc2_ = WealthUtil.parseCostStr(DefindConsts.TOWER_SILVER_SHOP_ITEM);
         _loc2_.useStcCount = true;
         this.renderWealth1.wealthVo = _loc2_;
         var _loc1_:StaticOpActivityTmModel = OpActivityStaticDataModel.ins.getActivityOpenTime(TowerService.ins.timeKind_funny);
         this.cdCtrl = new TextCDCtrlS2(this.txt_cd,textCDFormat,textCDCpl);
         if(_loc1_)
         {
            this.cdCtrl.start(_loc1_.endTm);
         }
         this.txt_ruleTitle.text = LocaleMgr.ins.getStr(30600904);
         this.txt_rule.text = LocaleMgr.ins.getStr(13386004);
         this.btn_do1.label = LocaleMgr.ins.getStr(13386008);
         this.box_help.visible = false;
         MornExpandUtil.addHandlerForBtnAll(this,btn_handler);
      }
      
      private static function getBagDictHash(param1:int) : DictHash
      {
         if(Boolean(bagDictHashDic[param1.toString()]) == false)
         {
            bagDictHashDic[param1.toString()] = new DictHash();
         }
         return bagDictHashDic[param1.toString()] as DictHash;
      }
      
      public function get service() : TowerService
      {
         return TowerService.ins;
      }
      
      public function get myScore() : int
      {
         return this.service.myScore;
      }
      
      public function init() : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc1_:* = null;
         if(this.funnyKind == 0)
         {
            _loc2_ = new TowerFunnyGoldBgUI();
         }
         else
         {
            _loc2_ = new TowerFunnySilverBgUI();
         }
         _loc2_.x = 78;
         _loc2_.y = -28;
         this.addChildAt(_loc2_,0);
         _loc1_ = new StcLotteryVo();
         var _loc7_:TowerStcVo_TowerCost = this.service.stcModel.towerCostKindOnceDict[this.funnyKind];
         var _loc6_:TowerStcVo_TowerCost = this.service.stcModel.towerCostKind50Dict[this.funnyKind];
         var _loc5_:StcLotteryVo = new StcLotteryVo();
         _loc5_.spare_cost_res = _loc7_.cost;
         _loc5_.cost_res = _loc7_.cost2;
         this.costRender1.lotteryVo = _loc5_;
         var _loc3_:StcLotteryVo = new StcLotteryVo();
         _loc3_.spare_cost_res = _loc6_.cost;
         _loc3_.cost_res = _loc6_.cost2;
         this.costRender10.lotteryVo = _loc3_;
         _loc4_ = WealthUtil.parseCostStr(_loc6_.cost);
         _loc4_.useStcCount = true;
         this.renderWealthFree.wealthVo = _loc4_;
         if(_loc6_.count == 50)
         {
            this.btn_do10.label = LocaleMgr.ins.getStr(13386009);
         }
         else
         {
            this.btn_do10.label = LocaleMgr.ins.getStr(13386010);
         }
         this.successEffCtrl = new nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnySuccessEffCtrl(this);
         player2dBox = new Component();
         DisplayUtils.addChildAbove(player2dBox,this.list_layer);
         playerMoveBss = new BmcSpriteSheet();
         playerMoveBss.setAnchor(0.5,1);
         playerMoveBss.y = 193;
         playerMoveBss.init(13386001,1,"all",true);
         player2dBox.addChild(playerMoveBss);
         playerMoveBss.visible = false;
         playerStandBss = new BmcSpriteSheet();
         playerStandBss.setAnchor(0.5,1);
         playerStandBss.y = 193;
         playerStandBss.init(13386002,1,"all",true);
         player2dBox.addChild(playerStandBss);
         playerStandBss.visible = false;
         player2dBox.mouseChildren = false;
         player2dBox.mouseEnabled = false;
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(50600046) + "\\n" + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),458496);
      }
      
      private function textCDCpl() : void
      {
         this.txt_cd.text = "";
         ObserverMgr.ins.sendNotice("TowerService.MSG_SWITCH_TIME_OVER",15);
      }
      
      public function btn_handler(param1:Button, param2:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if(this.btn_do1 !== _loc4_)
         {
            if(this.btn_do10 === _loc4_)
            {
               if(this.costRender10.isHad)
               {
                  this.renderWealth0.isLock = true;
                  this.renderWealth1.isLock = true;
                  this.renderWealthFree.isLock = true;
                  _loc3_ = this.service.stcModel.towerCostKind50Dict[this.funnyKind];
                  this.service.protos.server_TOWER_JUMP(this.funnyKind,_loc3_.count,server_get_cpl,server_get_err);
               }
               else
               {
                  AlertUtil.lackWealth(this.costRender10.wealthVo.kind,this.costRender10.wealthVo.sid);
               }
            }
         }
         else if(this.costRender1.isHad)
         {
            this.renderWealth0.isLock = true;
            this.renderWealth1.isLock = true;
            this.renderWealthFree.isLock = true;
            this.service.protos.server_TOWER_JUMP(this.funnyKind,1,server_get_cpl,server_get_err);
         }
         else
         {
            AlertUtil.lackWealth(this.costRender1.wealthVo.kind,this.costRender1.wealthVo.sid);
         }
      }
      
      private function server_get_cpl(param1:int, param2:int, param3:int, param4:Array) : void
      {
         successEffCtrl.addWealthArr = param4;
         successEffCtrl.selectedLv = param2;
         successEffCtrl.selectedPos = param3;
         successEffCtrl.play(param1);
      }
      
      private function server_get_err(param1:ProtocolStatusRes) : void
      {
         this.renderWealth0.isLock = false;
         this.renderWealth1.isLock = false;
         this.renderWealthFree.isLock = false;
         ServerEngine.ins.doDefaultErr(param1);
      }
      
      function playEffCpl() : void
      {
         _tempBagCtrl.addToTempBagWealthVo(successEffCtrl.addWealthArr);
         this.list_bag.array = _tempBagCtrl.tempSuperBagDict.array;
         FloatUtil.showGetItemsDisplayPanel(successEffCtrl.addWealthArr);
         refreshUI2();
      }
      
      public function viewStackIn() : void
      {
         ObserverMgr.ins.regObserver(this);
         this.visible = true;
         _tempBagCtrl.tempSuperBagDict = getBagDictHash(funnyKind);
         this.list_bag.array = _tempBagCtrl.tempSuperBagDict.array;
         this.refreshUI();
         this.successEffCtrl.reset();
         this.refreshUI2();
      }
      
      private function refreshPos() : void
      {
         var _loc1_:int = this.service.infoRes.lvs[this.funnyKind];
         var _loc3_:nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyLayerRender = this.list_layer.cells[this.list_layer.cells.length - _loc1_ - 1];
         if(curLayerCell && curLayerCell != _loc3_)
         {
            curLayerCell.switchSelected(false);
         }
         _loc3_.switchSelected(true);
         curLayerCell = _loc3_;
         curLv = _loc1_;
         this.playerMoveBss.visible = false;
         this.playerStandBss.visible = true;
         var _loc2_:Point = this.playerAvatar2dPosToLayer(_loc1_);
         player2dBox.x = _loc2_.x;
         player2dBox.y = _loc2_.y;
         this.box_avatar.visible = false;
      }
      
      public function playerAvatar2dPosToLayer(param1:int) : Point
      {
         var _loc2_:nslm2.modules.funnies.busyActivity.towers.funnys.TowerFunnyLayerRender = this.list_layer.cells[this.list_layer.cells.length - param1 - 1];
         return DisplayUtils.localToTarget(_loc2_.txt_name,this.player2dBox.parent,new Point(16,15));
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.visible = false;
      }
      
      private function refreshUI() : void
      {
         var _loc1_:Array = this.service.stcModel.towerModelKindDict[this.funnyKind];
         _loc1_ = _loc1_.concat();
         _loc1_.reverse();
         this.list_layer.repeatY = _loc1_.length;
         this.list_layer.array = _loc1_;
         this.list_layer.commitMeasure();
      }
      
      private function refreshUI2() : void
      {
         this.refreshRedPoi();
         this.refreshScore();
         this.renderWealth0.isLock = false;
         this.renderWealth1.isLock = false;
         this.renderWealthFree.isLock = false;
         this.renderWealth0.refershNum();
         this.renderWealth1.refershNum();
         this.renderWealthFree.refershNum();
         this.refreshPos();
      }
      
      private function refreshRedPoi() : void
      {
      }
      
      private function refreshScore() : void
      {
         this.txt_score1.text = LocaleMgr.ins.getStr(13350007) + ": " + this.myScore.toString();
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_NPC_FUNC_VO_CHANGE"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = param1;
         if("MSG_NPC_FUNC_VO_CHANGE" === _loc4_)
         {
            _loc3_ = param2 as int;
            if(_loc3_ == 13377)
            {
               this.refreshRedPoi();
            }
         }
      }
      
      override public function dispose() : void
      {
         if(playerMoveBss)
         {
            playerMoveBss.dispose();
            playerMoveBss = null;
         }
         if(playerStandBss)
         {
            playerStandBss.dispose();
            playerStandBss = null;
         }
         if(successEffCtrl)
         {
            successEffCtrl.dispose();
            successEffCtrl = null;
         }
         curLayerCell = null;
         viewStackOut();
         super.dispose();
      }
   }
}
