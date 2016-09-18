package nslm2.modules.cultivates.heroBag
{
   import game.ui.heroShowModule.HeroPieceRenderUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.utils.RTools;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.MouseEvent;
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import proto.HeroCombineReq;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.nets.sockets.ServerEvent;
   import proto.PlayerDataNotify;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.core.handlers.Handler;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.TextFieldUtil;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.events.Event;
   import morn.customs.FilterLib;
   import proto.Item;
   import com.mz.core.mediators.RollMediator;
   
   public class HeroPieceRender extends HeroPieceRenderUI implements IObserver
   {
       
      
      private var _canActived:Boolean;
      
      public function HeroPieceRender()
      {
         super();
         this.btn_getPoint.addEventListener("click",btn_getPoint_handler);
         this.parts.push(new RollMediator(this,onRoll));
         this.buttonMode = true;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(this.wealthVo == null)
         {
            this.removeEventListener("click",btn_handler);
            this.box1.visible = false;
            this.btn_getPoint.visible = true;
         }
         else
         {
            this.addEventListener("click",btn_handler);
            ObserverMgr.ins.regObserver(this);
            this.box1.visible = true;
            this.btn_getPoint.visible = false;
         }
      }
      
      override protected function validateImgIcon() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         if(this.wealthVoIsEnable)
         {
            _loc2_ = StcMgr.ins.getNpcVo(wealthVo.stcItemVo.heroPiece_stcNpcId);
            _loc1_ = UrlLib.npcDialogIcon(_loc2_.head_id);
            ResMgr.ins.load(1,_loc1_,loadIconUrlCpl);
            this.img_icon.url = _loc1_;
         }
      }
      
      private function loadIconUrlCpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.img_mask.cacheAsBitmap = true;
         this.img_icon.cacheAsBitmap = true;
         this.img_icon.mask = this.img_mask;
         showPieceTip(UrlLib.piece_tip_big(),39,44);
         var _loc1_:int = 6;
         icon_pieceTip.right = _loc1_;
         icon_pieceTip.top = _loc1_;
      }
      
      override protected function validateTxtName() : void
      {
         var _loc1_:* = null;
         if(this.wealthVoIsEnable)
         {
            _loc1_ = StcMgr.ins.getNpcVo(wealthVo.stcItemVo.heroPiece_stcNpcId);
            this.ref_txt_name.color = ColorLib.qualityColor(_loc1_.quality);
            this.ref_txt_name.text = HeroInfoUtil.getName(null,_loc1_.id,true);
            this.txt_nick.visible = RTools.cl(true,false);
            this.txt_nick.text = HeroInfoUtil.getHtmlNameHasTupoLevel(_loc1_.id,false,false);
            this.ref_txt_name.visible = true;
            if(false && _loc1_.career_id)
            {
               this.img_career.url = UrlLib.npcTypeIcon(_loc1_.career_id);
               this.img_career.visible = true;
            }
            else
            {
               this.img_career.visible = false;
            }
         }
      }
      
      override protected function validateQuality() : void
      {
         var _loc1_:* = null;
         if(this.wealthVoIsEnable)
         {
            _loc1_ = StcMgr.ins.getNpcVo(wealthVo.stcItemVo.heroPiece_stcNpcId);
            this.ref_img_quality.url = UrlLib.npcPieceQualityBg(_loc1_.quality);
            ref_img_quality.visible = true;
            this.img_bg.visible = false;
         }
         else
         {
            this.img_bg.visible = true;
            ref_img_quality.visible = false;
         }
      }
      
      override protected function showTxtNum(param1:Number) : void
      {
         if(param1 < wealthVo.stcItemVo.heroPieceNeed)
         {
            this.ref_txt_num.color = 16723968;
            this.img_redPoint.visible = false;
            this._canActived = false;
         }
         else
         {
            this.ref_txt_num.color = 458496;
            this.img_redPoint.visible = true;
            this._canActived = true;
         }
         this.ref_txt_num.visible = true;
         this.ref_txt_num.text = LocaleMgr.ins.getStr(999000045) + param1 + "/" + wealthVo.stcItemVo.heroPieceNeed;
      }
      
      private function btn_handler(param1:MouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(this._canActived)
         {
            _loc3_ = HeroModel.ins.playerHero;
            _loc2_ = new HeroCombineReq();
            _loc2_.item = wealthVo.item.id;
            ServerEngine.ins.send(5013,_loc2_,onServerCpl_Combine);
         }
         else
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByWealth(this.wealthVo.kind,this.wealthVo.item.itemId,this.wealthVo.stcItemVo.heroPieceNeed),ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function btn_getPoint_handler(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
         ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.HERO_PIECE_LESS_ID)),ModuleMgr.ins.popLayer.curModuleId);
      }
      
      private function onServerCpl_Combine(param1:*, param2:ServerEvent) : void
      {
         this.playerDataNotifyHander(param2.dataNotifyCacheVo.playerDataNotify);
      }
      
      private function playerDataNotifyHander(param1:PlayerDataNotify) : void
      {
         var _loc4_:* = null;
         var _loc2_:* = null;
         this.parent.mouseEnabled = false;
         this.parent.mouseChildren = false;
         var _loc3_:HeroInfo = param1.addHeroes[0];
         if(_loc3_)
         {
            _loc4_ = StcMgr.ins.getNpcVo(_loc3_.baseInfo.baseId);
            if(_loc4_.quality >= 4)
            {
               _loc2_ = new BmcSpriteSheet();
               _loc2_.addEndHandler(new Handler(effectCpl,[_loc3_])).init(30705000);
               _loc2_.x = -124;
               _loc2_.y = -48;
            }
            else
            {
               _loc2_ = new BmcSpriteSheet();
               _loc2_.addEndHandler(new Handler(effectCpl,[_loc3_])).init(8001);
               _loc2_.x = -27;
               _loc2_.y = 164;
               _loc2_.scaleY = -1;
            }
            DisplayUtils.addChildAbove(_loc2_,this.box1);
         }
      }
      
      private function effectCpl(param1:HeroInfo) : void
      {
         this.parent.mouseEnabled = true;
         this.parent.mouseChildren = true;
         var _loc2_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseInfo.baseId);
         if(_loc2_.quality >= 4)
         {
            ModuleMgr.ins.showModule(30705,new HeroPieceActiveSuccessParam(param1,successHandler),ModuleMgr.ins.popLayer.curModuleId);
         }
         else
         {
            AlertUtil.float(TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(999000046),458496));
            successHandler();
         }
      }
      
      private function successHandler() : void
      {
         TimerManager.ins.doOnce(200,new Handler(this.dispatchEvent,[new Event("evtNewHero",true)]));
      }
      
      private function onRoll(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(this.wealthVoIsEnable)
         {
            if(param1)
            {
               _loc2_ = StcMgr.ins.getNpcVo(wealthVo.stcItemVo.heroPiece_stcNpcId);
               this.filters = [FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(_loc2_.quality))];
            }
            else
            {
               this.filters = null;
            }
         }
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("msg_item_num_change" === _loc4_)
         {
            _loc3_ = param2 as Item;
            if(this.wealthVo.kind == 20 && this.wealthVo.sid == _loc3_.itemId)
            {
               this.validateTxtNum();
               this.validateTxtName();
            }
         }
      }
      
      override protected function validateIconMask() : void
      {
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["msg_item_num_change"]);
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
