package nslm2.modules.funnies.newYears.charmStar.view
{
   import flash.display.Sprite;
   import com.mz.core.interFace.IObserver;
   import game.ui.newYears.charmStar.view.CharmRankViewUI;
   import nslm2.modules.funnies.newYears.charmStar.model.CharmStarModel;
   import nslm2.modules.funnies.newYears.charmStar.control.CharmStarControl;
   import nslm2.common.ui.components.comps2d.TextCDCtrlS2;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.LabelUtils;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcShopVo;
   import morn.core.utils.ObjectUtils;
   import nslm2.modules.funnies.newYears.charmStar.model.CharmStarRankVo;
   
   public class CharmRankView extends Sprite implements IObserver
   {
       
      
      public var childIndex:int;
      
      private var _display:CharmRankViewUI;
      
      private var _model:CharmStarModel;
      
      private var _control:CharmStarControl;
      
      private var textCdCtrl:TextCDCtrlS2;
      
      public function CharmRankView(param1:CharmRankViewUI, param2:CharmStarModel, param3:CharmStarControl)
      {
         super();
         _display = param1;
         if(_display && _display.parent)
         {
            this.x = _display.x;
            this.y = _display.y;
            _display.x = 0;
            _display.y = 0;
            childIndex = param1.parent.getChildIndex(_display);
            this.addChild(_display);
         }
         _model = param2;
         _control = param3;
         init();
         this.addEventListener("addedToStage",addToStage);
      }
      
      private function textCDFormat(param1:int) : String
      {
         return LocaleMgr.ins.getStr(13100502) + TextFieldUtil.htmlText2(TimeUtils.hisCNWithDay(param1),LabelUtils.cdColor(true));
      }
      
      private function init() : void
      {
         textCdCtrl = new TextCDCtrlS2(_display.openTimesTxt,textCDFormat,txtCDCtrl_cpl);
         textCdCtrl.start(NpcFuncService.ins.getOpenTimeVo(13402).endTime);
         _display.render_need.wealthVo = WealthUtil.countVo(20,200011);
         _display.sendFriendsBtn.btnLabel.width = _display.sendFriendsBtn.btnLabel.width - 10;
         _display.rankList.itemRender = CharmRankRender;
      }
      
      private function txtCDCtrl_cpl() : void
      {
         _display.openTimesTxt.text = LocaleMgr.ins.getStr(999003116);
         _display.boxBuyAll.visible = false;
         ObserverMgr.ins.sendNotice("RANK_TIME_OVER");
      }
      
      protected function addToStage(param1:Event) : void
      {
         this.removeEventListener("addedToStage",addToStage);
         addListeners();
         show();
         this.addEventListener("removedFromStage",removeFromStage);
      }
      
      protected function removeFromStage(param1:Event) : void
      {
         this.removeEventListener("removedFromStage",removeFromStage);
         removeListeners();
         hide();
         this.addEventListener("addedToStage",addToStage);
      }
      
      private function addListeners() : void
      {
         ObserverMgr.ins.regObserver(this);
         _display.sendFriendsBtn.addEventListener("click",btn_sendFriendsHandler);
         _display.addBtn.addEventListener("click",btnAddHandler);
      }
      
      private function removeListeners() : void
      {
         _display.sendFriendsBtn.removeEventListener("click",btn_sendFriendsHandler);
         _display.addBtn.removeEventListener("click",btnAddHandler);
      }
      
      public function getFocusNotices() : Array
      {
         return ["refresh_rank"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("refresh_rank" === _loc3_)
         {
            onRankList();
         }
      }
      
      private function btn_sendFriendsHandler(param1:MouseEvent) : void
      {
         if(NpcFuncService.ins.isOpenTime(13402) == false)
         {
            AlertUtil.floadFuncTimeIsExpire(13400);
            return;
         }
         ModuleMgr.ins.showModule(13405,null,ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function btnAddHandler(param1:MouseEvent) : void
      {
         if(NpcFuncService.ins.isOpenTime(13403) == false)
         {
            AlertUtil.floadFuncTimeIsExpire(13400);
            return;
         }
         var _loc2_:StcShopVo = StcMgr.ins.getShopVo(200011);
         if(_loc2_)
         {
            ModuleMgr.ins.showModule(60320,_loc2_,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function show() : void
      {
         if(NpcFuncService.ins.isOpenTime(13402))
         {
            ObjectUtils.gray(_display.sendFriendsBtn,false);
         }
         else
         {
            ObjectUtils.gray(_display.sendFriendsBtn,true);
         }
         onRankList();
      }
      
      private function hide() : void
      {
      }
      
      private function onRankList() : void
      {
         var _loc1_:* = null;
         var _loc5_:int = 0;
         var _loc4_:Array = _model.rankInfo;
         var _loc2_:Array = [];
         var _loc3_:Array = _model.rankRewordArr;
         _loc5_ = 0;
         while(_loc5_ < _loc3_.length)
         {
            _loc1_ = new CharmStarRankVo();
            _loc1_.rank = _loc5_ + 1;
            _loc1_.rankVo = _loc3_[_loc5_];
            _loc1_.rankInfo = _model.rankInfo[_loc5_];
            _loc2_.push(_loc1_);
            _loc5_++;
         }
         _display.rankList.dataSource = _loc2_;
         _display.myScore.text = _model.score.toString();
         _display.myRank.text = _model.rank <= 100 && _model.rank > 0?_model.rank.toString():"100+";
      }
      
      public function dispose() : void
      {
         if(this.hasEventListener("addedToStage"))
         {
            this.removeEventListener("addedToStage",addToStage);
         }
         _display = null;
         _model = null;
         _control = null;
      }
   }
}
